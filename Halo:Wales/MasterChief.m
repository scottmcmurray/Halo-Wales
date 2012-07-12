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
    spriteInitialFrameName = @"024.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *runningAnimation = [self createAnimationFrom:24 to:33 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:runningAnimation forKey:@"MasterChiefRunning"];
    
    [self registerAnimations];
}

-(void) run
{
    [self.sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[self->animations objectForKey:@"MasterChiefRunning"]]]];
}

-(void) stopRunning
{
	[self.sprite cleanup];
}

-(void) moveToPosition: (CGPoint) position
{	
//	id stopRunning = [self stopRunning];
	
	BOOL flip;
	
	if( self.sprite.position.x > position.x )
	{
		flip = YES;
	}
	else 
	{
		flip = NO;
	}
	
	id moveMan = [CCMoveTo actionWithDuration: 2.0f position:ccp(position.x, 60.0f)];
	id flipMan = [CCFlipX actionWithFlipX: flip];
	id action = [CCSequence	actions:flipMan, moveMan, nil];
	
	[self.sprite runAction:action];
	
	//self.sprite.position = ccp( position.x, 60.0f );
}

@end
