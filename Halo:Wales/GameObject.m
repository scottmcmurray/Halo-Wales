//
//  GameObject.m
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

#pragma mark Setup and Register

-(void) setUp
{
    #warning implement these values to set up your game objects
    spriteFrameFile = @"";
    spriteBatchNodeFile = @"";
    spriteInitialFrameName = @"";
    
    #warning write some code to set up your animations and actions
    
    [self registerAssets];
}

-(void) registerAssets
{
    [self registerSprite];
    [self registerAnimations];
    [self registerActions];
}

-(void) registerSprite
{
    // add the sprite frames information to the shared caches
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spriteFrameFile];
    [self addChild:[CCSpriteBatchNode batchNodeWithFile:spriteBatchNodeFile]];
    
    self->sprite = [CCSprite spriteWithSpriteFrameName:spriteInitialFrameName];
}

-(void) registerAnimations
{
    
}

-(void) registerActions
{
    
}

@end
