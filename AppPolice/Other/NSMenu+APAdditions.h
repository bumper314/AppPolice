//
//  NSMenu+APAdditions.h
//  AppPolice
//
//  Created by Steve Audette on 06/25/16.
//  Copyright (c) 2016 Maksym Stefanchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenu (APAdditions)

- (void)insertItem:(NSMenuItem *)newItem atIndex:(NSInteger)index animate:(BOOL)animate;
- (void)removeItemAtIndex:(NSInteger)index animate:(BOOL)animate;
- (void)removeItemsAtIndexes:(NSIndexSet *)indexes;

@end
