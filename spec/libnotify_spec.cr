require "./spec_helper"

describe Libnotify do
  describe "C" do
    it "notify_init" do
      Libnotify::C.notify_init("test").should eq(true)
    end

    it "notify_uninit" do
      Libnotify::C.notify_uninit
    end

    it "notify_is_initted" do
      Libnotify::C.notify_is_initted.should eq(false)
      Libnotify::C.notify_init("test").should eq(true)
      Libnotify::C.notify_is_initted.should eq(true)
    end
  end
end
