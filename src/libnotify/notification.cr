require "./c"

class Libnotify::Notification
  property summary : String?
  property body : String?
  property icon_path : String?
  property app_name : String
  property timeout : Int32
  property category : String?
  property append : Bool
  property transient : Bool
  property urgency : Libnotify::C::Notifyurgency

  def initialize(@summary = nil, @body = nil, @icon_path = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::Notifyurgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default")
    init_app!
    @notify = C.notification_new @summary.to_s, @body.to_s, @icon_path.to_s
    update
  end

  def initialize(@summary = nil, @body = nil, @icon_path = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::Notifyurgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default", &block)
    init_app!
    @notify = C.notification_new @summary.to_s, @body.to_s, @icon_path.to_s
    yield self
    update
  end

  def show(gerror = nil)
    C.notification_show @notify, gerror
    self
  end

  def update
    C.notification_update @notify, @summary.to_s, @body.to_s, @icon_path.to_s
    C.notification_set_timeout @notify, @timeout
    C.notification_set_urgency @notify, @urgency
    C.notification_set_category @notify, @category.to_s
    C.notification_set_app_name @notify, @app_name
    self
  end

  def to_unsafe
    @notify
  end

  # set the timeout at `sec`, in seconds
  def timeout=(sec : Float::Primitive)
    timeout = (sec * 1000).round
  end

  # set the urgency, based on the symbols `:critical`, `:normal`, `:low`
  def urgency=(urgency : Symbol)
    urgency = case urgency
              when :low
                Libnotify::C::Notifyurgency::NotifyUrgencyLow
              when :normal
                Libnotify::C::Notifyurgency::NotifyUrgencyNormal
              when :critical
                Libnotify::C::Notifyurgency::NotifyUrgencyCritical
              else
                raise "Invalid Notifyurgency"
              end
  end

  private def init_app!
    C.init @app_name if C.is_initted == 0
    C.set_app_name @app_name if C.get_app_name != @app_name
  end
end
