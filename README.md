# Libnotify for Crystal

:warning: :construction: :construction: :construction: :warning:

Bindings for [GNOME's Libnotify](https://developer.gnome.org/libnotify/).

For the Ruby version see https://rubygems.org/gems/libnotify.

![libnotify](https://github.com/splattael/libnotify.cr/raw/master/images/screenshot-gnome3.png)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  libnotify:
    github: splattael/libnotify.cr
```

### Linux

```
apt-get install libnotify # debian
pacman -S libnotify       # archlinux
dnf install libnotify     # fedora
```


## Usage

```crystal
require "libnotify"

Libnotify::C.notify_init("test")
icon_path = File.expand_path("images/crystal-120x120.png")
notify = Libnotify::C.notify_notification_new("summary", "body", icon_path)
Libnotify::C.notify_notification_show(notify, nil)

```

For now just run: `make spec`


## Development

* `make update`
* `make spec`


## Contributing

1. [Fork it](https://github.com/splattael/libnotify.cr/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [splattael](https://github.com/splattael) Peter Suschlik - creator, maintainer
- [Nephos](https://github.com/Nephos) Arthur Poulet - contributor
