require "./libnotify/*"

module Libnotify
  def self.new(*args, **options)
    Notification.new(*args, **options)
  end

  def self.new(*args, **options)
    Notification.new(*args, **options) { |n| yield n }
  end

  def self.show(*args, **options)
    new(*args, **options).show
  end

  def self.show(*args, **options)
    new(*args, **options) { |n| yield n }.show
  end
end
