//
//  BubbleShield.m
//  Halo:Wales
//
//  Created by Scott McMurray on 13/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BubbleShield.h"
#import "HelloWorldLayer.h"

@implementation BubbleShield

-(void) setUp
{    
    spriteFrameFile = @"halo.plist";
    spriteBatchNodeFile = @"halo.png";
    spriteInitialFrameName = @"066.png";
    [self registerSprite];
    
    self->animations = [NSMutableDictionary dictionaryWithCapacity:1];
    
    CCAnimation *startBubble = [CCScaleTo actionWithDuration:0.0f scale:0.01f];
	CCAnimation *expandBubbleAnimation = [CCScaleTo actionWithDuration:0.8f scale:1.0f];
	
	[self->animations setObject:startBubble forKey:@"StartBubble"];
    [self->animations setObject:expandBubbleAnimation forKey:@"ExpandBubble"];

    [self registerAnimations];
}

+(void) deployBubble
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"bubble-shield.mp3"];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	
	BubbleShield *bubbleShield = [BubbleShield node];
	[bubbleShield setUp];
	bubbleShield.sprite.position = CGPointMake(0.0f, 0.0f);
	
	[[HelloWorldLayer scene] addChild:bubbleShield.sprite];
//	[bubbleShield run];
}

@end
