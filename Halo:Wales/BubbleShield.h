//
//  BubbleShield.h
//  Halo:Wales
//
//  Created by Scott McMurray on 13/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"
#import "SimpleAudioEngine.h"

@interface BubbleShield : GameObject

+(BubbleShield *) deployBubbleOnNode:(CCNode *)node atPoint:(int)point;

-(void) expand;

@end
