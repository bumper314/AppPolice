//
//  StatusbarMenuController.h
//  AppPolice
//
//  Created by Maksym on 10/11/13.
//  Copyright (c) 2013 Maksym Stefanchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APApplicationsSortedByName 0
#define APApplicationsSortedByPid 1

@class AppInspector;

@interface StatusbarMenuController : NSObject<NSMenuDelegate>
{
	@private;
	NSMenu *_mainMenu;
	NSMutableArray *_runningApplications;
	NSMutableArray *_runningSystemProcesses;
	NSMenuItem *_appInspectorItem;
	int _sortKey;
	BOOL _orderAsc;
	AppInspector *_appInspector;
}

- (NSMenu *)mainMenu;

// Default is |APApplicationsSortedByName|
- (int)sortKey;
- (void)setSortKey:(int)sortKey;

@end
