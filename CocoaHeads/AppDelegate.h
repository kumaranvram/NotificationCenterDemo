//
//  AppDelegate.h
//  CocoaHeads
//
//  Created by kumaran on 31/07/13.
//
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) NSNumber *clickCount;

-(IBAction) incrementValue:(id)sender;

-(IBAction) resetValue:(id)sender;

@end
