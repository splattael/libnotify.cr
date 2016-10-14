require "./c"

class Libnotify::Notification
  property summary : String?
  property body : String?
  property icon : String?
  property app_name : String
  property timeout : Int32
  property category : String?
  property append : Bool
  property transient : Bool
  property urgency : Libnotify::C::Notifyurgency

  private def init_app!
    C.init @app_name if C.is_initted == 0
    C.set_app_name @app_name if C.get_app_name != @app_name
  end

  def initialize(@summary = nil, @body = nil, @icon = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::Notifyurgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default")
    init_app!
    @notify = C.notification_new @summary.to_s, @body.to_s, @icon.to_s
    update!
  end

  def initialize(@summary = nil, @body = nil, @icon = nil,
                 @timeout = -1, @category = nil, @urgency = Libnotify::C::Notifyurgency::NotifyUrgencyNormal,
                 @append = false, @transient = true,
                 @app_name = "default", &block)
    init_app!
    @notify = C.notification_new @summary.to_s, @body.to_s, @icon.to_s
    yield self
    update!
  end

  def show(gerror = nil)
    C.notification_show @notify, gerror
    self
  end

  private def update!
    C.notification_update @notify, @summary.to_s, @body.to_s, @icon.to_s
    C.notification_set_timeout @notify, @timeout
    C.notification_set_urgency @notify, @urgency
    C.notification_set_category @notify, @category.to_s
    C.notification_set_app_name @notify, @app_name
    self
  end

  {% for attribute in ["summary", "body", "icon", "app", "timeout", "append", "transient", "urgency"] %}

    def {{attribute.id}}=(v)
      @{{attribute.id}} = v
      update!
    end

  {% end %}
end
