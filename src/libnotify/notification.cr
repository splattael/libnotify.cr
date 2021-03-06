require "./c"

class Libnotify::Notification
  getter notify : C::NotifyNotification*
  property summary : String?
  property body : String?
  property icon_path : String?
  property app_name : String
  property timeout : Int32
  property category : String?
  property append : Bool
  property transient : Bool
  property urgency : Libnotify::C::NotifyUrgency

  def initialize(@summary = nil, @body = nil, @icon_path = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::NotifyUrgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default")
    init_app!
    @notify = new_notification(@summary, @body, @icon_path)
    update!
  end

  def initialize(@summary = nil, @body = nil, @icon_path = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::NotifyUrgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default", &block)
    init_app!
    @notify = new_notification(@summary, @body, @icon_path)
    yield self
    update!
  end

  # Update **all fields** of the notification (in arguments or via the block).
  #
  # It resets the fields to their default value / nil or use the arguments.
  # Then, it yield a block where it is possible to modify all of them.
  def update(@summary = nil, @body = nil, @icon_path = nil,
             @timeout = -1, @category = nil, @urgency = Libnotify::C::NotifyUrgency::NotifyUrgencyNormal,
             @append = false, @transient = true,
             @app_name = "default", &block)
    yield self
    update!
  end

  def update(@summary = nil, @body = nil, @icon_path = nil,
             @timeout = -1, @category = nil, @urgency = Libnotify::C::NotifyUrgency::NotifyUrgencyNormal,
             @append = false, @transient = true,
             @app_name = "default")
    update!
  end

  # Display the notification on the screen with the last modification
  def show
    update!
    C.notification_show @notify, nil
    self
  end

  # Use the C bindings if you really need the raw pointer
  # def to_unsafe
  #   @notify
  # end

  # Set the timeout at `sec`, in seconds
  def timeout=(sec : Float::Primitive)
    timeout = (sec * 1000).round
  end

  # Set the urgency, based on the symbols `:critical`, `:normal`, `:low`
  def urgency=(urgency : Symbol)
    urgency = case urgency
              when :low
                Libnotify::C::NotifyUrgency::NotifyUrgencyLow
              when :normal
                Libnotify::C::NotifyUrgency::NotifyUrgencyNormal
              when :critical
                Libnotify::C::NotifyUrgency::NotifyUrgencyCritical
              else
                raise "Invalid NotifyUrgency"
              end
  end

  private def update!
    summary, body = ensure_nonempty(@summary, @body)
    C.notification_update @notify, summary.to_s, body.to_s, @icon_path.to_s
    C.notification_set_timeout @notify, @timeout
    C.notification_set_urgency @notify, @urgency
    C.notification_set_category @notify, @category.to_s
    C.notification_set_app_name @notify, @app_name
    self
  end

  private def init_app!
    C.init @app_name if C.is_initted == 0
    C.set_app_name @app_name if C.get_app_name != @app_name
  end

  private def new_notification(summary, body, icon_path)
    summary, body = ensure_nonempty(summary, body)
    C.notification_new summary.to_s, body.to_s, icon_path.to_s
  end

  private def ensure_nonempty(summary, body)
    summary = " " if summary.nil? || summary.empty?
    body = " " if body.nil? || body.empty?
    return summary, body
  end
end
