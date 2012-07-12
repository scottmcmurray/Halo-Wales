//
//  GameObject.m
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

@synthesize sprite;

#pragma mark Setup and Register

-(void) setUp
{    
    #warning implement these values to set up your game objects
    spriteFrameFile = @"";
    spriteBatchNodeFile = @"";
    spriteInitialFrameName = @"";
    [self registerSprite];
    
    #warning write some code to set up your animations and actions
    [self registerAnimations];
}

-(void) registerSprite
{
    // add the sprite frames information to the shared caches
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spriteFrameFile];
    [self addChild:[CCSpriteBatchNode batchNodeWithFile:spriteBatchNodeFile]];
    
    self.sprite = [CCSprite spriteWithSpriteFrameName:spriteInitialFrameName];
}

-(void) registerAnimations
{
    for( NSString *key in self->animations ) 
    {
        [[CCAnimationCache sharedAnimationCache] addAnimation:[self->animations objectForKey:key] name:key];
    }
}

-(CCAnimation *) createAnimationFrom:(int)startFrame to:(int)endFrame with:(NSString *)frameNameFormat andDelay:(float)delay;
{
    NSMutableArray *frameArray = [NSMutableArray array];
    
    for( int i = startFrame ; i <= endFrame ; i++ )
    {
        [frameArray addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameNameFormat]];
    }
    
    CCAnimation *createdAnimation = [CCAnimation animationWithFrames:frameArray delay:delay];
    
    return createdAnimation;
}

@end
