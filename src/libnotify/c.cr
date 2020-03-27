module Libnotify
  @[Link("libnotify")]
  lib C
    fun notification_get_type = notify_notification_get_type : GType
    alias Gsize = LibC::ULong
    alias GType = Gsize
    fun notification_new = notify_notification_new(summary : LibC::Char*, body : LibC::Char*, icon : LibC::Char*) : NotifyNotification*
    struct X_NotifyNotification
      parent_object : GObject
      priv : NotifyNotificationPrivate
    end
    type NotifyNotification = X_NotifyNotification
    struct X_GObject
      g_type_instance : GTypeInstance
      ref_count : Guint
      qdata : GData
    end
    type GObject = X_GObject
    struct X_GTypeInstance
      g_class : GTypeClass*
    end
    type GTypeInstance = X_GTypeInstance
    struct X_GTypeClass
      g_type : GType
    end
    type GTypeClass = X_GTypeClass
    alias Guint = LibC::UInt
    type GData = Void*
    type NotifyNotificationPrivate = Void*
    fun notification_update = notify_notification_update(notification : NotifyNotification*, summary : LibC::Char*, body : LibC::Char*, icon : LibC::Char*) : Gboolean
    alias Gint = LibC::Int
    alias Gboolean = Gint
    fun notification_show = notify_notification_show(notification : NotifyNotification*, error : GError**) : Gboolean
    struct X_GError
      domain : GQuark
      code : Gint
      message : Gchar*
    end
    type GError = X_GError
    alias Guint32 = LibC::UInt
    alias GQuark = Guint32
    alias Gchar = LibC::Char
    fun notification_set_timeout = notify_notification_set_timeout(notification : NotifyNotification*, timeout : Gint)
    fun notification_set_category = notify_notification_set_category(notification : NotifyNotification*, category : LibC::Char*)
    fun notification_set_urgency = notify_notification_set_urgency(notification : NotifyNotification*, urgency : NotifyUrgency)
    enum NotifyUrgency
      NotifyUrgencyLow = 0
      NotifyUrgencyNormal = 1
      NotifyUrgencyCritical = 2
    end
    fun notification_set_image_from_pixbuf = notify_notification_set_image_from_pixbuf(notification : NotifyNotification*, pixbuf : GdkPixbuf)
    type GdkPixbuf = Void*
    fun notification_set_icon_from_pixbuf = notify_notification_set_icon_from_pixbuf(notification : NotifyNotification*, icon : GdkPixbuf)
    fun notification_set_hint_int32 = notify_notification_set_hint_int32(notification : NotifyNotification*, key : LibC::Char*, value : Gint)
    fun notification_set_hint_uint32 = notify_notification_set_hint_uint32(notification : NotifyNotification*, key : LibC::Char*, value : Guint)
    fun notification_set_hint_double = notify_notification_set_hint_double(notification : NotifyNotification*, key : LibC::Char*, value : Gdouble)
    alias Gdouble = LibC::Double
    fun notification_set_hint_string = notify_notification_set_hint_string(notification : NotifyNotification*, key : LibC::Char*, value : LibC::Char*)
    fun notification_set_hint_byte = notify_notification_set_hint_byte(notification : NotifyNotification*, key : LibC::Char*, value : Guchar)
    alias Guchar = UInt8
    fun notification_set_hint_byte_array = notify_notification_set_hint_byte_array(notification : NotifyNotification*, key : LibC::Char*, value : Guchar*, len : Gsize)
    fun notification_set_hint = notify_notification_set_hint(notification : NotifyNotification*, key : LibC::Char*, value : GVariant)
    type GVariant = Void*
    fun notification_set_app_name = notify_notification_set_app_name(notification : NotifyNotification*, app_name : LibC::Char*)
    fun notification_clear_hints = notify_notification_clear_hints(notification : NotifyNotification*)
    fun notification_add_action = notify_notification_add_action(notification : NotifyNotification*, action : LibC::Char*, label : LibC::Char*, callback : NotifyActionCallback, user_data : Gpointer, free_func : GFreeFunc)
    alias Gpointer = Void*
    alias NotifyActionCallback = (NotifyNotification*, LibC::Char*, Gpointer -> Void)
    alias GFreeFunc = (Gpointer -> Void)
    fun notification_clear_actions = notify_notification_clear_actions(notification : NotifyNotification*)
    fun notification_close = notify_notification_close(notification : NotifyNotification*, error : GError**) : Gboolean
    fun notification_get_closed_reason = notify_notification_get_closed_reason(notification : NotifyNotification*) : Gint
    fun urgency_get_type = notify_urgency_get_type : GType
    fun init = notify_init(app_name : LibC::Char*) : Gboolean
    fun uninit = notify_uninit
    fun is_initted = notify_is_initted : Gboolean
    fun get_app_name = notify_get_app_name : LibC::Char*
    fun set_app_name = notify_set_app_name(app_name : LibC::Char*)
    fun get_server_caps = notify_get_server_caps : GList*
    struct X_GList
      data : Gpointer
      next : GList*
      prev : GList*
    end
    type GList = X_GList
    fun get_server_info = notify_get_server_info(ret_name : LibC::Char**, ret_vendor : LibC::Char**, ret_version : LibC::Char**, ret_spec_version : LibC::Char**) : Gboolean
  end
end