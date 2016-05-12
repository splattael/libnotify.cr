require "./libnotify/*"

module Libnotify

  @[Link("libnotify")]
  lib C
    fun notify_init(app_name : LibC::Char*) : Bool
    fun notify_uninit() : Void
    fun notify_is_initted() : Bool
    fun notify_get_app_name() : LibC::Char*
    fun notify_set_app_name(LibC::Char*) : Void

    # GList *             notify_get_server_caps  (void);
    # gboolean            notify_get_server_info  (char **ret_name,
    #                                              char **ret_vendor,
    #                                              char **ret_version,
    #                                              char **ret_spec_version);


    fun notify_notification_new(summary : LibC::Char*,
                                body : LibC::Char*,
                                icon : LibC::Char*) : Void*

    fun notify_notification_show(notification : Void*, gerror : Void**) : Bool

    fun notify_notification_update(notification : Void*,
                                   summary : LibC::Char*,
                                   body : LibC::Char*,
                                   icon : LibC::Char*) : Bool
  end

end
