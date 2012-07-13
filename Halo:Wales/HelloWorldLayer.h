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
#import "Banshee.h"
#import "FuelRod.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	MasterChief *masterChief;
    CCSprite *leftWall;
    CCSprite *rightWall;
    NSMutableArray *sheeps;
    NSMutableArray *bubbles;
    CGPoint touchOrigin2;
	BOOL gesturecontrol; 
    Banshee *banshee;
    FuelRod *fuelRod;
    CCSprite *greenGrassySlopesOfTheBoyne;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;


@end
