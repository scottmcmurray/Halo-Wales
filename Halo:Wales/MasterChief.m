//
//  MasterChief.m
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterChief.h"


@implementation MasterChief

-(void) setUpOnNode:(CCNode *)node
{
    parent = node;
    
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"16.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *runningAnimation = [self createAnimationFrom:16 to:26 with:@"%i.png" andDelay:0.05f];
    [self->animations setObject:runningAnimation forKey:@"MasterChiefRunning"];
    
    [self registerAnimations];
}

-(void) run
{
    [self.sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[self->animations objectForKey:@"MasterChiefRunning"]]]];
}

@end
