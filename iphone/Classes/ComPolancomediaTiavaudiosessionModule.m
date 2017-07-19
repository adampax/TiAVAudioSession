/**
 * TiAVAudioSession
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "ComPolancomediaTiavaudiosessionModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiMediaAudioSession.h"
#import <AVFoundation/AVFoundation.h>

@implementation ComPolancomediaTiavaudiosessionModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"84459c05-fe6b-432a-a6e0-daed1273e5a4";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.polancomedia.tiavaudiosession";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)init:(id)value
{
    //sets the ambient audio session using TiMediaAudioSession
    [[TiMediaAudioSession sharedSession] setSessionMode:AVAudioSessionCategoryAmbient];

}

-(void)enableDuckAudio:(id)value
{
    //set the AVAudioSessionCategoryOptionDuckOthers option
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient withOptions: AVAudioSessionCategoryOptionDuckOthers error: nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
}

-(void)disableDuckAudio:(id)value
{
    //turn off the AVAudioSessionCategoryOptionDuckOthers option
    [[AVAudioSession sharedInstance] setActive:NO withOptions:0 error:nil];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryAmbient
                                     withOptions: 0
                                           error: nil];
    [[AVAudioSession sharedInstance] setActive:YES withOptions: 0 error:nil];
}

@end
