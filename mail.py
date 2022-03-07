import subprocess
import time
import threading

Ten_Minutes = 60 * 10

def check_mail():
    while True:
        unread = subprocess.check_output(['./unread.oas'])
        if int(unread) > 0:
            cmds = ["/Users/rkt/ruby/mail/objc/notify/DerivedData/notify/Build/Products/Release/notify.app/Contents/MacOS/notify", "%d" % int(unread)]
            pid = subprocess.Popen(cmds)
            pid.wait()
        time.sleep(Ten_Minutes)

thread = threading.Thread(target=check_mail)
thread.start()

while True:
    time.sleep(60)
