//
//  NSMenu+APAdditions.m
//  AppPolice
//
//  Created by Steve Audette on 06/25/16.
//  Copyright (c) 2016 Maksym Stefanchuk. All rights reserved.
//

#import "NSMenu+APAdditions.h"

@implementation NSMenu (APAdditions)

- (void)insertItem:(NSMenuItem *)newItem atIndex:(NSInteger)index animate:(BOOL)animate
{
	[self insertItem:newItem atIndex:index];
}

- (void)removeItemAtIndex:(NSInteger)index animate:(BOOL)animate
{
	[self removeItemAtIndex:index];
}

- (void)removeItemsAtIndexes:(NSIndexSet *)indexes {
	NSMutableArray *items = [[self itemArray] mutableCopy];
	__block NSUInteger itemsCount = [items count];
	if (! itemsCount) {
		[NSException raise:NSInvalidArgumentException format:@"Removing items from empty Menu at -removeItemsAtIndexes:"];
		return;
	}
	if ([indexes indexGreaterThanOrEqualToIndex:itemsCount] != NSNotFound) {
		[NSException raise:NSRangeException format:@"Indexes out of bounds at NSMenu -removeItemsAtIndexes:"];
		return;
	}

	[indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
		// See if any of the removing items has submenus
		NSMenuItem *item = [[self itemArray] objectAtIndex:idx];
		if ([item hasSubmenu]) {
			[item setSubmenu:nil];
		}
	}];

	[indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
		[self removeItemAtIndex:idx];
	}];
}

@end
