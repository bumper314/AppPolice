//
//  AppDelegate.h
//  AppPolice
//
//  Created by Maksym on 5/19/13.
//  Copyright (c) 2013 Maksym Stefanchuk. All rights reserved.
//

@class StatusbarItemController, StatusbarMenuController;

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	@private
	NSStatusItem *_statusbarItem;
	StatusbarMenuController *_statusbarMenuController;
}


@end
