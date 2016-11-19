describe Libnotify::Notification do
  it "initializes" do
    w = Libnotify::Notification.new("summary", "body")
    w.summary.should eq "summary"
    w.body.should eq "body"
  end

  it "initializes with block" do
    Libnotify::Notification.new do |notify|
      notify.summary = "hello"
      notify.body = "world"
      notify.timeout = 1.5
      notify.timeout = 1500
      notify.urgency = :critical # :low, :normal, :critical
      notify.append = false      # default true
      notify.transient = true    # default false
      notify.icon_path = File.expand_path("images/crystal-120x120.png")
    end.show
  end

  it "initializes and updates" do
    n = Libnotify::Notification.new "update 1" do |n|
      n.body = "Should not be displayed"
    end
    n.body = "Should be displayed"
    n.show

    n = Libnotify::Notification.new "update 2 not displayed" do |n|
      n.body = "Should not be displayed"
    end
    n.update(body: "Should be displayed") do |n|
      n.summary = "update 2"
    end.show
  end

  it "default summary and body to an empty string" do
    # TODO capture stderr and check for warnings
    Libnotify::Notification.new.show
    Libnotify::Notification.new(summary: "", body: "").show
  end
end
