//
//  Jul26AppDelegate.m
//  Jul26
//
//  Created by Dominick Ciano on 7/24/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "Jul26AppDelegate.h"
#import "tableViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation Jul26AppDelegate
@synthesize window = _window;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	// Override point for customization after application launch.
	self.window.rootViewController = [[TableViewController alloc] initWithStyle: UITableViewStylePlain];
	[self.window makeKeyAndVisible];
	
// take screenshot - currently remmed out since it was only needed for building app's icon 
		UIGraphicsBeginImageContext(self.window.bounds.size);
		[self.window.layer renderInContext: UIGraphicsGetCurrentContext()];
		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		if (image == nil) {
			NSLog(@"UIGraphicsGetImageFromCurrentImageContext failed");
			return YES;
		}
		
		NSData *d = UIImagePNGRepresentation(image);
		if (d == nil) {
			NSLog(@"UIImagePNGRepresentation failed");
			return YES;
		}
		
		NSString *fileName = [NSString stringWithFormat:
							  @"%@/jul26snapshot.png", NSHomeDirectory()];
		
		if (![d writeToFile: fileName atomically: NO]) {
			NSLog(@"writeToFile:atomically: failed");
			return YES;
		}	
		
	
	return YES;
}

- (void) applicationWillResignActive: (UIApplication *) application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void) applicationWillTerminate: (UIApplication *) application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

@end
