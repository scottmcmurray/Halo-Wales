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
}

-(void) wander
{
    
}

-(void) roam
{
    
}

-(void) roamLeft
{
    [self setAnimationWithIdentifer:@"SheepWalkLeft"];
}

-(void) roamRight
{
    [self setAnimationWithIdentifer:@"SheepWalkRight"];
}

@end
