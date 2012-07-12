//
//  GameObject.h
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObject : CCNode 
{
    NSMutableDictionary *animations;
    NSMutableDictionary *actions;
	NSMutableDictionary *currentlyRunningActions;
    
    NSString *spriteFrameFile;
    NSString *spriteBatchNodeFile;
    NSString *spriteInitialFrameName;
}

@property (nonatomic, strong) CCSprite *sprite;

-(void) setUp;

-(void) registerSprite;
-(void) registerAnimations;
-(void) moveToPosition: (CGPoint) position;
-(void) moveAlongGroundToPosition: (CGFloat) xPos;

-(CCAnimation *) createAnimationFrom:(int)startFrame to:(int)endFrame with:(NSString *)frameNameFormat andDelay:(float)delay;
-(void) setAnimationWithIdentifer:(NSString *)identifier;

@end
