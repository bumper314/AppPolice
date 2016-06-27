//
//  AppInspector.h
//  AppPolice
//
//  Created by Maksym on 7/2/13.
//  Copyright (c) 2013 Maksym Stefanchuk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define APApplicationInfoNameKey @"appInfoNameKey"
#define APApplicationInfoIconKey @"appInfoIconKey"
#define APApplicationInfoPidKey @"appInfoPidKey"
#define APApplicationInfoLimitKey @"appInfoLimitKey"
#define APApplicationInfoUserKey @"appInfoUserKey"

#define APAppInspectorProcessDidChangeLimit @"appInspectorProcDidChangeLim"


@interface AppInspector : NSObject
{
	@private
	NSMenuItem *_attachedToItem;
	IBOutlet NSViewController *_appViewController;
	IBOutlet NSView *_appView;
	NSTimer *_cpuTimer;
	struct {
		uint64_t cputime;
		uint64_t timestamp;
	} _cpuTime;
	
	IBOutlet NSImageView *_applicationIcon;
	IBOutlet NSTextField *_applicationNameTextfield;
	IBOutlet NSTextField *_applicationUserTextfield;
	IBOutlet NSTextField *_applicationCPUTextfield;
	IBOutlet NSTextField *_sliderLimit1Textfield;
	IBOutlet NSTextField *_sliderLimit2Textfield;
	IBOutlet NSTextField *_sliderLeftTextfield;
	IBOutlet NSTextField *_sliderMiddleTextfield;
	IBOutlet NSTextField *_sliderRightTextfield;
	IBOutlet NSSlider *_slider;
	IBOutlet NSLevelIndicator *_levelIndicator;
}

@property (assign) NSMutableDictionary *applicationInfo;
@property (assign, nonatomic) NSMenuItem *attachedToItem;
@property (readonly) NSView *appView;

@end
