require "gtk3"
require 'thread'

timer = Thread.new do
  Ten_Minutes = 4 #60 * 10
  while true
    unread = `./unread.oas`
    if unread.to_i > 0
      cmd = "ruby notify.rb --mail_count=" + unread
      `#{cmd}`
    end
    sleep Ten_Minutes
  end
end

while true
  sleep 5
end

