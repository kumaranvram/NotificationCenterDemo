//
//  AppDelegate.h
//  CocoaHeads
//
//  Created by kumaran on 31/07/13.
//
//

#import <Cocoa/Cocoa.h>
#import "Growl/Growl.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate, GrowlApplicationBridgeDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) NSNumber *clickCount;

-(IBAction) incrementValue:(id)sender;

-(IBAction) resetValue:(id)sender;

@end
