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
    spriteFrameFile = @"Resources/halo.plist";
    spriteBatchNodeFile = @"Resources/halo.png";
    spriteInitialFrameName = @"16.png";
    [self registerSprite];
    
    [self createAnimationFrom:16 to:26 with:@"MasterChiefRunning" andDelay:0.05f];
    [self registerAnimations];
}

-(void) run
{
    [self.sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[self->animations objectForKey:@"MasterChiefRunning"]]]];
}

@end
