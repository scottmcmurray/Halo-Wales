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
    CCSprite *sprite;
    NSMutableArray *animations;
    NSMutableArray *actions;
    
    NSString *spriteFrameFile;
    NSString *spriteBatchNodeFile;
    NSString *spriteInitialFrameName;
}

-(void) registerAssets;
-(void) registerSprite;
-(void) registerAnimations;
-(void) registerActions;

@end
