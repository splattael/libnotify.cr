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
    github: splattael/libnotify
    version: ~> 0.1.0
```

### Debian

```
apt-get install libnotify
```


## Usage

```crystal
require "libnotify"

# TODO
```

For now just run: `make spec`


## Development

```
$ make update
$ make spec
```

### Debian

```
$ apt-get install libnotify
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
