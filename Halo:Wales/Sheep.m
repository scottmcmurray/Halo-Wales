//
//  Sheep.m
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Sheep.h"


@implementation Sheep

-(void) setUp
{
    if( arc4random_uniform(2) == 1 )
    {
        self->direction = @"Left";
    }
    else 
    {
        self->direction = @"Right";
    }
    
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"063.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *walkRightAnimation = [self createAnimationFrom:63 to:65 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:walkRightAnimation forKey:@"SheepWalkRight"];
    
    CCAnimation *walkLeftAnimation = [self createAnimationFrom:60 to:62 with:@"%03i.png" andDelay:0.1f];
    [self->animations setObject:walkLeftAnimation forKey:@"SheepWalkLeft"];
    
    [self registerAnimations];
    [self->animations retain];
}

-(void) roam
{
    if( [self->direction isEqualToString:@"Right"] )
    {
        [self roamRight];
    }
    else 
    {
        [self roamLeft];
    }
}

-(void) roamLeft
{
    self->direction = @"Left";
    
    [self setAnimationWithIdentifer:@"SheepWalkLeft"];
    
    float duration = ( self.sprite.position.x * ( 10.0 / [[CCDirector sharedDirector] winSize].width ) );
    
    id moveLeft = [CCMoveTo actionWithDuration: duration position:ccp( 0.1f, 60.0f)];
	id action = [CCSequence	actions:moveLeft, nil];
	
	[self.sprite runAction:action];
}

-(void) roamRight
{
    self->direction = @"Right";
    [self setAnimationWithIdentifer:@"SheepWalkRight"];
    
    float duration = ( ( [[CCDirector sharedDirector] winSize].width - self.sprite.position.x ) * ( 10.0 / [[CCDirector sharedDirector] winSize].width ) );
    
    id moveRight = [CCMoveTo actionWithDuration:duration position:ccp( [[CCDirector sharedDirector] winSize].width, 60.0f)];
    id action = [CCSequence	actions:moveRight, nil];
	
	[self.sprite runAction:action];
}

-(void) checkIsWithinLeftBounds:(CGRect) bounds
{
    if( CGRectIntersectsRect( [self.sprite boundingBox], bounds ) && [self->direction isEqualToString:@"Left"] )
    {
        [self roamRight];
    }
}

-(void) checkIsWithinRightBounds:(CGRect) bounds
{
    if( CGRectIntersectsRect( [self.sprite boundingBox], bounds ) && [self->direction isEqualToString:@"Right"] )
    {
        [self roamLeft];
    }
}

@end
