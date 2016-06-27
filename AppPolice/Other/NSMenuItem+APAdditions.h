//
//  NSMenuItem+APAdditions.h
//  AppPolice
//
//  Created by Steve Audette on 06/25/16.
//  Copyright (c) 2016 Maksym Stefanchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenuItem (APAdditions)

- (id)initWithTitle:(NSString *)title action:(SEL)action;
- (id)initWithTitle:(NSString *)title icon:(NSImage *)icon action:(SEL)action;

@end
