//
//  FuelRod.m
//  Halo:Wales
//
//  Created by Robert Falconer on 13/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FuelRod.h"


@implementation FuelRod

-(void) setUp
{
    self->direction = @"Right";
    
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"067.png";
    [self registerSprite];
}

-(void) fire
{
    if( [self->direction isEqualToString:@"Right"] )
    {
        [self fireRight];
    }
    else 
    {
        [self fireLeft];
    }
}

-(void) fireLeft
{
    self->direction = @"Left";
    
    float duration = 5.0f;
    
    id moveLeft = [CCMoveTo actionWithDuration:duration position:ccp( self.sprite.position.x - 100, 60 )];
	id action = [CCSequence	actions:moveLeft, nil];
	
	[self.sprite runAction:action];
}

-(void) fireRight
{
    self->direction = @"Right";
    
    float duration = 5.0f;
    
    id moveRight = [CCMoveTo actionWithDuration:duration position:ccp( self.sprite.position.x + 100, 60 )];
    id action = [CCSequence	actions:moveRight, nil];
	
	[self.sprite runAction:action];
}

@end
