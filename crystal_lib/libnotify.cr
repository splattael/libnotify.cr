module Libnotify
  @[Include(
    "libnotify/notify.h",
    flags: "-pthread -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng12 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include",
    prefix: %w(notify_),
    remove_prefix: true
  )]
  @[Link("libnotify")]
  lib C
  end
end
