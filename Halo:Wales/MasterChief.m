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
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"13.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *runningAnimation = [self createAnimationFrom:13 to:33 with:@"%i.png" andDelay:0.1f];
    [self->animations setObject:runningAnimation forKey:@"MasterChiefRunning"];
    
    [self registerAnimations];
}

-(void) run
{
    [self.sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[self->animations objectForKey:@"MasterChiefRunning"]]]];
}

@end
