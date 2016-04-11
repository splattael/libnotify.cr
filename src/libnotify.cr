require "./libnotify/*"

module Libnotify

  @[Link("libnotify")]
  lib C
    fun notify_init(app_name : LibC::Char*) : Bool
    fun notify_uninit() : Void
    fun notify_is_initted() : Bool
  end

end
