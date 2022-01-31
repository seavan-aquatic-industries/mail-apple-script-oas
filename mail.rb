require "gtk3"
require 'thread'

timer = Thread.new do
  Ten_Minutes = 60 #60 * 10
  while true
    running = `ps | grep "ruby notify.rb"`
    print running
    if running.count("ruby notify.rb") < 2
      unread = `./unread.oas`
      if unread.to_i > 0
        cmd = "ruby notify.rb --mail_count=" + unread
        `#{cmd}`
      end
    end
    sleep Ten_Minutes
  end
end

while true
  sleep 5
end

