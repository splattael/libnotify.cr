require "./spec_helper"

describe Libnotify do
  describe "C" do
    it "can init and uninit" do
      Libnotify::C.notify_is_initted.should eq(false)

      Libnotify::C.notify_init("test").should eq(true)
      Libnotify::C.notify_is_initted.should eq(true)

      Libnotify::C.notify_uninit
      Libnotify::C.notify_is_initted.should eq(false)
    end

    it "gets and sets app name" do
      Libnotify::C.notify_init("test")
      app_name = Libnotify::C.notify_get_app_name
      String.new(app_name, 4).should eq("test")

      Libnotify::C.notify_set_app_name("bar")
      app_name = Libnotify::C.notify_get_app_name
      String.new(app_name, 3).should eq("bar")
    end

    it "new" do
      notify = Libnotify::C.notify_notification_new("test me", Time.now.to_s, nil)
      notify.should be_truthy

      Libnotify::C.notify_notification_show(notify, nil)
    end
  end
end
