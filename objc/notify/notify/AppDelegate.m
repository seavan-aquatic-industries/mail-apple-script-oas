//
//  AppDelegate.m
//  notify
//
//  Created by Aaron Elkins on 2/1/22.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTextField *notice;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSArray *arguments = [[NSProcessInfo processInfo] arguments];
    NSString *mails = [arguments objectAtIndex:1];
    NSString *text = [NSString stringWithFormat:@"Match! You have %@ new mail!", mails];
    self.notice.stringValue = text;
    NSBeep();
    [self.window makeKeyAndOrderFront:nil];
    [self.window setLevel:NSStatusWindowLevel];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)okay:(id)sender {
    [NSApp terminate:sender];
}
@end
