describe Libnotify::Notification do
  it "Init" do
    w = Libnotify::Notification.new("summary", "body", "/").show
    w.summary.should eq "summary"
    w.body.should eq "body"
    w.icon.should eq "/"
  end

  it "Init with block" do
    Libnotify::Notification.new "init" do |n|
      n.body = "Block is ok"
    end.show
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
