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
    CCNode *parent;
    NSMutableDictionary *animations;
    NSMutableDictionary *actions;
    
    NSString *spriteFrameFile;
    NSString *spriteBatchNodeFile;
    NSString *spriteInitialFrameName;
}

@property (nonatomic, strong) CCSprite *sprite;

-(void) setUpOnNode:(CCNode *)node;

-(void) registerSprite;
-(void) registerAnimations;
-(CCAnimation *) createAnimationFrom:(int)startFrame to:(int)endFrame with:(NSString *)frameNameFormat andDelay:(float)delay;

@end
