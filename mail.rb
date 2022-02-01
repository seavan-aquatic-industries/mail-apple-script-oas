require 'thread'

timer = Thread.new do
  Ten_Minutes = 60 * 10
  while true
    #puts "Checking email..."
    unread = `./unread.oas`
    if unread.to_i > 0
      cmd = "/Users/rkt/ruby/mail/objc/notify/DerivedData/notify/Build/Products/Release/notify.app/Contents/MacOS/notify " + unread
      pid = spawn(cmd)
      Process.wait pid
    end
    sleep Ten_Minutes
  end
end

while true
  sleep 5
end

