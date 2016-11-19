require "./spec_helper"

describe Libnotify do
  it "delegates .new to Notification.new w/o block" do
    Libnotify.new(summary: "no block", body: "hello").show
  end

  it "delegates .new to Notification.new with block" do
    Libnotify.new do |notify|
      notify.summary = "with block"
      notify.body = "hello2"
    end.show
  end

  it "creates and shows w/o block" do
    Libnotify.show(summary: "no block", body: "hello")
  end

  it "creates and shows with block" do
    Libnotify.show do |n|
      n.summary = "with block"
      n.body = "hello2"
    end
  end
end
