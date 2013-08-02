//
//  AppDelegate.m
//  CocoaHeads
//
//  Created by kumaran on 31/07/13.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib
{
    [GrowlApplicationBridge setGrowlDelegate:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self setClickCount:[NSNumber numberWithInt:0]];
    [GrowlApplicationBridge setGrowlDelegate:self];
}

-(IBAction) incrementValue:(id)sender {
    NSLog(@"Clicked Increment");
    int value = [_clickCount intValue] + 1;
    [self setClickCount:[NSNumber numberWithInt:value]];
    [GrowlApplicationBridge notifyWithTitle:@"A notification"
                                description:@"A short description of the notification"
                           notificationName:@"growlNotificationKey"
                                   iconData:nil
                                   priority:0
                                   isSticky:NO
                               clickContext:nil];

    if (value % 5 == 0 && value != 0) {
        [self sendNotification:value];
    }
}

-(IBAction) resetValue:(id)sender {
    NSLog(@"Clicked Increment");
    [self setClickCount:[NSNumber numberWithInt:0]];
}

-(void) sendNotification:(int)value {
    NSUserNotificationCenter *userNotificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    [userNotificationCenter setDelegate:self];
    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    [userNotification setTitle:@"Cocoa heads"];
    [userNotification setInformativeText:[NSString stringWithFormat:@"You have clicked %d times", value]];
    [userNotification setSubtitle:@"Demo notification"];
    [userNotification setSoundName:NSUserNotificationDefaultSoundName];

//    [userNotification setDeliveryDate:[NSDate dateWithTimeIntervalSinceNow:5]];
//    [[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:userNotification];
    [userNotificationCenter deliverNotification:userNotification];
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification{
    return YES;
}

-(void)growlNotificationWasClicked:(id)clickContext {
    NSLog(@"Growl notification was clicked");
}


@end
