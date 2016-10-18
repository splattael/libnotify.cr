describe Libnotify::Notification do
  it "Init" do
    w = Libnotify::Notification.new("summary", "body", "/").show
    w.summary.should eq "summary"
    w.body.should eq "body"
    w.icon_path.should eq "/"
  end

  it "Init with block" do
    Libnotify::Notification.new "init" do |n|
      n.body = "Block is ok"
    end.show

    Libnotify::Notification.new do |notify|
      notify.summary    = "hello"
      notify.body       = "world"
      notify.timeout    = 1.5
      notify.timeout    = 1500
      notify.urgency    = :critical   # :low, :normal, :critical
      notify.append     = false       # default true
      notify.transient  = true        # default false
      notify.icon_path  = "/usr/share/icons/gnome/scalable/emblems/emblem-default.svg"
    end

  end

  it "Init and update" do
    n = Libnotify::Notification.new "update 1" do |n|
      n.body = "Should be displayed"
    end
    n.body = "Should not be displayed"
    n.show
    n.update # not displayed either

    sleep 0.5

    n = Libnotify::Notification.new "update 2" do |n|
      n.body = "Should not be displayed"
    end
    n.body = "Should be displayed"
    n.update.show

    n = Libnotify::Notification.new summary: "big", body: "body text"
  end
end
