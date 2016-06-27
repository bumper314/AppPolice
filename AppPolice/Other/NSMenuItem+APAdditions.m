//
//  NSMenuItem+APAdditions.m
//  AppPolice
//
//  Created by Steve Audette on 06/25/16.
//  Copyright (c) 2016 Maksym Stefanchuk. All rights reserved.
//

#import "NSMenuItem+APAdditions.h"

@implementation NSMenuItem (APAdditions)

- (id)initWithTitle:(NSString *)title action:(SEL)action
{
	return [[NSMenuItem alloc] initWithTitle:title action:action keyEquivalent:@""];
}

- (id)initWithTitle:(NSString *)title icon:(NSImage *)icon action:(SEL)action
{
	NSMenuItem *temp = [[NSMenuItem alloc] initWithTitle:title action:action keyEquivalent:@""];
	[temp setImage:icon];
	return temp;
}

@end
