//
//  HelloWorldLayer.h
//  Halo:Wales
//
//  Created by Scott McMurray on 12/07/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "MasterChief.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	MasterChief *masterChief;
    CCSprite *leftWall;
    CCSprite *rightWall;
    NSMutableArray *sheeps;
    CGPoint touchOrigin2;
	BOOL gesturecontrol; 
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;


@end
