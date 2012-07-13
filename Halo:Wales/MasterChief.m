//
//  MasterChief.m
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterChief.h"


@implementation MasterChief

-(void) setUp
{    
    self->direction = @"Right";
    
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"024.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *runningAnimation = [self createAnimationFrom:24 to:33 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:runningAnimation forKey:@"MasterChiefRunning"];
    
    [self registerAnimations];
}

-(void) run
{
    [self setAnimationWithIdentifer:@"MasterChiefRunning"];
}

-(void) stopRunning
{
//	[self.sprite cleanup];
	
	//[[self->currentlyRunningActions objectForKey:@"MasterChiefRunning"] stop ];
	
//	[self.sprite stopActionByTag: [self->currentlyRunningActions objectForKey: @"MasterChiefRunning" ].tag];
}

@end
