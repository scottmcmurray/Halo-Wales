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
	CCAnimation *expandBubbleAnimation = [CCScaleTo actionWithDuration:0.8f scale:0.7f];
	
	[self->animations setObject:startBubble forKey:@"StartBubble"];
    [self->animations setObject:expandBubbleAnimation forKey:@"ExpandBubble"];

    [self registerAnimations];
}

+(BubbleShield *) deployBubbleOnNode:(CCNode *)node atPoint:(int)point
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"bubble-shield.mp3"];
	
	BubbleShield *bubbleShield = [BubbleShield node];
	[bubbleShield setUp];
    bubbleShield.sprite.scale = 0.01f;
	bubbleShield.sprite.position = ccp( point, 80.0f );
	
	[node addChild:bubbleShield.sprite];
    [bubbleShield expand];
    
    return bubbleShield;
}

-(void) expand
{
    id sequence = [CCSequence actions:[self->animations objectForKey:@"StartBubble"], [self->animations objectForKey:@"ExpandBubble"], nil];
    [self.sprite runAction:sequence];
}

@end
