module Libnotify
  @[Link("libnotify")]
  lib C
    fun notification_get_type = notify_notification_get_type : Gtype
    alias Gsize = LibC::ULong
    alias Gtype = Gsize
    fun notification_new = notify_notification_new(summary : LibC::Char*, body : LibC::Char*, icon : LibC::Char*) : Notifynotification*
    struct X_Notifynotification
      parent_object : Gobject
      priv : Notifynotificationprivate
    end
    type Notifynotification = X_Notifynotification
    struct X_Gobject
      g_type_instance : Gtypeinstance
      ref_count : Guint
      qdata : Gdata
    end
    type Gobject = X_Gobject
    struct X_Gtypeinstance
      g_class : Gtypeclass*
    end
    type Gtypeinstance = X_Gtypeinstance
    struct X_Gtypeclass
      g_type : Gtype
    end
    type Gtypeclass = X_Gtypeclass
    alias Guint = LibC::UInt
    type Gdata = Void*
    type Notifynotificationprivate = Void*
    fun notification_update = notify_notification_update(notification : Notifynotification*, summary : LibC::Char*, body : LibC::Char*, icon : LibC::Char*) : Gboolean
    alias Gint = LibC::Int
    alias Gboolean = Gint
    fun notification_show = notify_notification_show(notification : Notifynotification*, error : Gerror**) : Gboolean
    struct X_Gerror
      domain : Gquark
      code : Gint
      message : Gchar*
    end
    type Gerror = X_Gerror
    alias Guint32 = LibC::UInt
    alias Gquark = Guint32
    alias Gchar = LibC::Char
    fun notification_set_timeout = notify_notification_set_timeout(notification : Notifynotification*, timeout : Gint)
    fun notification_set_category = notify_notification_set_category(notification : Notifynotification*, category : LibC::Char*)
    fun notification_set_urgency = notify_notification_set_urgency(notification : Notifynotification*, urgency : Notifyurgency)
    enum Notifyurgency
      NotifyUrgencyLow = 0
      NotifyUrgencyNormal = 1
      NotifyUrgencyCritical = 2
    end
    fun notification_set_image_from_pixbuf = notify_notification_set_image_from_pixbuf(notification : Notifynotification*, pixbuf : Gdkpixbuf)
    type Gdkpixbuf = Void*
    fun notification_set_icon_from_pixbuf = notify_notification_set_icon_from_pixbuf(notification : Notifynotification*, icon : Gdkpixbuf)
    fun notification_set_hint_int32 = notify_notification_set_hint_int32(notification : Notifynotification*, key : LibC::Char*, value : Gint)
    fun notification_set_hint_uint32 = notify_notification_set_hint_uint32(notification : Notifynotification*, key : LibC::Char*, value : Guint)
    fun notification_set_hint_double = notify_notification_set_hint_double(notification : Notifynotification*, key : LibC::Char*, value : Gdouble)
    alias Gdouble = LibC::Double
    fun notification_set_hint_string = notify_notification_set_hint_string(notification : Notifynotification*, key : LibC::Char*, value : LibC::Char*)
    fun notification_set_hint_byte = notify_notification_set_hint_byte(notification : Notifynotification*, key : LibC::Char*, value : Guchar)
    alias Guchar = UInt8
    fun notification_set_hint_byte_array = notify_notification_set_hint_byte_array(notification : Notifynotification*, key : LibC::Char*, value : Guchar*, len : Gsize)
    fun notification_set_hint = notify_notification_set_hint(notification : Notifynotification*, key : LibC::Char*, value : Gvariant)
    type Gvariant = Void*
    fun notification_set_app_name = notify_notification_set_app_name(notification : Notifynotification*, app_name : LibC::Char*)
    fun notification_clear_hints = notify_notification_clear_hints(notification : Notifynotification*)
    fun notification_add_action = notify_notification_add_action(notification : Notifynotification*, action : LibC::Char*, label : LibC::Char*, callback : Notifyactioncallback, user_data : Gpointer, free_func : Gfreefunc)
    alias Gpointer = Void*
    alias Notifyactioncallback = (Notifynotification*, LibC::Char*, Gpointer -> Void)
    alias Gfreefunc = (Gpointer -> Void)
    fun notification_clear_actions = notify_notification_clear_actions(notification : Notifynotification*)
    fun notification_close = notify_notification_close(notification : Notifynotification*, error : Gerror**) : Gboolean
    fun notification_get_closed_reason = notify_notification_get_closed_reason(notification : Notifynotification*) : Gint
    fun urgency_get_type = notify_urgency_get_type : Gtype
    fun init = notify_init(app_name : LibC::Char*) : Gboolean
    fun uninit = notify_uninit
    fun is_initted = notify_is_initted : Gboolean
    fun get_app_name = notify_get_app_name : LibC::Char*
    fun set_app_name = notify_set_app_name(app_name : LibC::Char*)
    fun get_server_caps = notify_get_server_caps : Glist*
    struct X_Glist
      data : Gpointer
      next : Glist*
      prev : Glist*
    end
    type Glist = X_Glist
    fun get_server_info = notify_get_server_info(ret_name : LibC::Char**, ret_vendor : LibC::Char**, ret_version : LibC::Char**, ret_spec_version : LibC::Char**) : Gboolean
  end
end
