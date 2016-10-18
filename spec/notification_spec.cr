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
      notify.timeout    = 1.5         # 1.5 (s), 1000 (ms), "2", nil, false
      notify.urgency    = :critical   # :low, :normal, :critical
      notify.append     = false       # default true - append onto existing notification
      notify.transient  = true        # default false - keep the notifications around after display
      notify.icon_path  = "/usr/share/icons/gnome/scalable/emblems/emblem-default.svg"
    end

  end

  it "Init and update" do
    n = Libnotify::Notification.new "update 1" do |n|
      n.body = "Should be displayed"
    end
    n.body = "Should not be displayed"
    n.show

    n = Libnotify::Notification.new "update 2" do |n|
      n.body = "Should not be displayed"
    end
    n.body = "Should be displayed"
    n.update.show
  end
end
