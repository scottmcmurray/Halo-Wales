//
//  BubbleShield.m
//  Halo:Wales
//
//  Created by Scott McMurray on 13/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BubbleShield.h"

@implementation BubbleShield

+(void) deployBubble
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"bubble-shield.mp3"];
}

@end
