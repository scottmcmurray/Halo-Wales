//
//  Banshee.m
//  Halo:Wales
//
//  Created by Robert Falconer on 13/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Banshee.h"


@implementation Banshee

-(void) setUp
{
    self->direction = @"Left";

    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"049.png";
    [self registerSprite];
}

-(void) fly
{
    if( [self->direction isEqualToString:@"Right"] )
    {
        [self flyRight];
    }
    else 
    {
        [self flyLeft];
    }
}

-(void) flyLeft
{
    self->direction = @"Left";
    
    float duration = 10.0f;
    
    id moveLeft = [CCMoveTo actionWithDuration:duration position:ccp( [[CCDirector sharedDirector] winSize].width + 50, [[CCDirector sharedDirector] winSize].height - 50 )];
	id action = [CCSequence	actions:moveLeft, nil];
	
	[self.sprite runAction:action];
}

-(void) flyRight
{
    self->direction = @"Right";
    
    float duration = 10.0f;
    
    id moveRight = [CCMoveTo actionWithDuration:duration position:ccp(  -50, [[CCDirector sharedDirector] winSize].height - 50 )];
    id action = [CCSequence	actions:moveRight, nil];
	
	[self.sprite runAction:action];
}

@end
