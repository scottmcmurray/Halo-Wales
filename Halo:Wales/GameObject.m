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
	currentlyRunningActions = [NSMutableDictionary dictionaryWithCapacity:0];
	
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
    [self.parent addChild:[CCSpriteBatchNode batchNodeWithFile:spriteBatchNodeFile]];
    
    self.sprite = [CCSprite spriteWithSpriteFrameName:spriteInitialFrameName];
}

-(void) registerAnimations
{
    for( NSString *key in self->animations ) 
    {
        [[CCAnimationCache sharedAnimationCache] addAnimation:[self->animations objectForKey:key] name:key];
    }
}

-(void) moveToPosition: (CGPoint) position
{	
	BOOL flip;
	
	if( self.sprite.position.x > position.x )
	{
		flip = YES;
	}
	else 
	{
		flip = NO;
	}
	
	id flipObject = [CCFlipX actionWithFlipX: flip];
	id moveObject = [CCMoveTo actionWithDuration: 2.0f position:ccp(position.x, 60.0f)];

	id action = [CCSequence	actions:flipObject, moveObject, nil];
	
	[self.sprite runAction:action];
}

-(void) moveAlongGroundToPosition: (CGFloat) xPos
{	
	[self moveToPosition:ccp( xPos, 60.0f )];
}

-(CCAnimation *) createAnimationFrom:(int)startFrame to:(int)endFrame with:(NSString *)frameNameFormat andDelay:(float)delay;
{
    NSMutableArray *frameArray = [NSMutableArray array];
    
    for( int i = startFrame ; i <= endFrame ; i++ )
    {
        NSString *twentyNineCheck = [NSString stringWithFormat:frameNameFormat, i];
        
        if( ![twentyNineCheck isEqualToString:@"29.png"] )
        {
            [frameArray addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:twentyNineCheck]];
        }
    }
    
    CCAnimation *createdAnimation = [CCAnimation animationWithFrames:frameArray delay:delay];
    
    return createdAnimation;
}

-(void) setAnimationWithIdentifer:(NSString *)identifier
{
	CCAction *action = [self.sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[self->animations objectForKey:identifier]]]];
	
	[self->currentlyRunningActions setObject:action forKey:identifier];
}

@end
