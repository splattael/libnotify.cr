# Libnotify for Crystal

:warning: :construction: :construction: :construction: :warning:

[![Build Status](https://travis-ci.org/splattael/libnotify.cr.svg?branch=master)](https://travis-ci.org/splattael/libnotify.cr)
[![Shard version](https://img.shields.io/badge/libnotify.cr-v0.1.0-orange.svg)](http://crystalshards.xyz/?filter=libnotify)

Bindings for [GNOME's Libnotify](https://developer.gnome.org/libnotify/).

For the Ruby version see https://rubygems.org/gems/libnotify.

![libnotify](https://github.com/splattael/libnotify.cr/raw/master/images/screenshot-gnome3.png)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  libnotify:
    github: splattael/libnotify.cr
    version: ~> 0.1.0
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

n = Libnotify::Notification.new do |notify|
  notify.summary    = "hello"
  notify.body       = "world"
  notify.timeout    = 1.5
  notify.timeout    = 1500
  notify.urgency    = :critical   # :low, :normal, :critical
  notify.append     = false       # default true
  notify.transient  = true        # default false
  notify.icon_path  = "/usr/share/icons/gnome/scalable/emblems/emblem-default.svg"
end

n = Libnotify::Notification.new(summary: "big", body: "body text").show
sleep 1
n.body = "hello world"
n.update.show
```

For now just run: `make spec`


## Development

```
$ make update
$ make spec
```

### Linux

```
apt-get install libnotify-dev # debian
pacman -S libnotify           # archlinux
dnf install libnotify         # fedora
```

### Generate libnotify/c.cr

```
$ git clone https://github.com/crystal-lang/crystal_lib
$ cd crystal_lib
$ ./main < ../libnotify.cr/crystal_lib/libnotify.cr  > ../libnotify.cr/src/libnotify/c.cr
```


## Contributing

1. [Fork it](https://github.com/splattael/libnotify.cr/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [splattael](https://github.com/splattael) Peter Suschlik - creator, maintainer
- [Nephos](https://github.com/Nephos) Arthur Poulet - contributor
