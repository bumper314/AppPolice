//
//  AppDelegate.m
//  AppPolice
//
//  Created by Maksym on 5/19/13.
//  Copyright (c) 2013 Maksym Stefanchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "StatusbarMenuController.h"

#include "C/proc_cpulim.h"
#include "C/selfprofile.h"


@implementation AppDelegate


- (void)dealloc {
	[_statusbarMenuController release];
    [super dealloc];
}


- (void)applicationWillFinishLaunching:(NSNotification *)notification {
	NSImage *ico = [NSImage imageNamed:@"status_icon"];
	[ico setTemplate:YES];
	_statusbarItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[_statusbarItem retain];
	[_statusbarItem setImage:ico];
	[_statusbarItem setHighlightMode:YES];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
#ifdef PROFILE_APPLICATION
	/* print stats right after App launch: resources used by OS X to launch the App */
	profiling_print_stats();
#endif
	
	// Add status item with menu
	_statusbarMenuController = [[StatusbarMenuController alloc] init];
	NSMenu *mainMenu = [_statusbarMenuController mainMenu];
	[_statusbarItem setMenu:mainMenu];

	// Register default preferences
	NSString *defaultsPath = [[NSBundle mainBundle] pathForResource:@"UserDefaults" ofType:@"plist"];
	NSDictionary *defaults = [NSDictionary dictionaryWithContentsOfFile:defaultsPath];
	NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
	[preferences registerDefaults:defaults];
	
	// Set default task schedule interval
	unsigned int task_schedule_interval = (unsigned int)[preferences integerForKey:@"APProcCpulimTaskScheduleInterval"];
	(void) proc_cpulim_schedule_interval(task_schedule_interval, NULL);
}


- (void)applicationWillTerminate:(NSNotification *)notification {
	// We really want to stop limiter before application terminates,
	// or otherwise any limited processes will remain sleeping.
	proc_cpulim_suspend_wait();
}



@end
