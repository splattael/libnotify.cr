describe Libnotify::Notification do
  it "Init" do
    w = Libnotify::Notification.new("summary", "body", "/").show
    w.summary.should eq "summary"
    w.body.should eq "body"
    w.icon.should eq "/"
  end

  it "Init with block" do
    Libnotify::Notification.new do |n|
      n.summary = "Block is ok"
    end.show
  end
end
