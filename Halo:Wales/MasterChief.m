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
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:0];
    self->currentlyRunningActions = [NSMutableDictionary dictionaryWithCapacity:0];
    [self->currentlyRunningActions retain];
    
    CCAnimation *runningAnimation = [self createAnimationFrom:24 to:33 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:runningAnimation forKey:@"MasterChiefRunning"];
    
    CCAnimation *stopRunningAnimation = [self createAnimationFrom:13 to:13 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:stopRunningAnimation forKey:@"MasterChiefStopRunning"];
    
    [self registerAnimations];
    [self->animations retain];
}

-(void) run
{
    [self setAnimationWithIdentifer:@"MasterChiefRunning"];
}

-(void) stopRunning
{    
    [self setAnimationWithIdentifer:@"MasterChiefStopRunning"];
}

@end
