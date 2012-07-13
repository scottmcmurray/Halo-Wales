//
//  HelloWorldLayer.m
//  Halo:Wales
//
//  Created by Scott McMurray on 12/07/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "MasterChief.h"
#import "Sheep.h"
#import "BubbleShield.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    CCLayerColor *collay = [CCLayerColor layerWithColor:ccc4(162, 215, 250, 255)];
    
    [scene addChild:collay];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	
	[masterChief moveAlongGroundToPosition: location.x];
}

-(BOOL) ccTouchBegan:(UITouch *) touch withEvent: (UIEvent *) event
{
	
	CGPoint touchOrigin = [touch locationInView:[touch view]];
	touchOrigin2 = [[CCDirector sharedDirector] convertToGL:touchOrigin];
	
    return YES;
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchOrigin = [touch locationInView:[touch view]];
	CGPoint touchOrigin3 = [[CCDirector sharedDirector] convertToGL:touchOrigin];
	
    if(gesturecontrol==NO){
        if(touchOrigin2.x-touchOrigin3.x > 100)
		{
            NSLog(@"left");
            gesturecontrol=YES;
        }
		else if(touchOrigin2.x-touchOrigin3.x < -100)
		{
            NSLog(@"right");
            gesturecontrol=YES;
        }
		else if(touchOrigin2.y-touchOrigin3.y > 100)
		{
            NSLog(@"down");
            gesturecontrol=YES;
			
			[BubbleShield deployBubble];
        }
		else if(touchOrigin2.y-touchOrigin3.y < -100)
		{
            NSLog(@"up");
            gesturecontrol=YES;
        }
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    gesturecontrol=NO;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) 
    {
		[[SimpleAudioEngine sharedEngine] preloadEffect:@"bubble-shield.mp3"];

		self.isTouchEnabled = YES;

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        masterChief = [MasterChief node];
        [masterChief setUp];
        masterChief.sprite.position = ccp( size.width /2 , size.height/2 );
        [self addChild:masterChief.sprite];
        [masterChief run];
        
		[masterChief retain];
		
        Sheep *sheep = [Sheep node];
        [sheep setUp];
        sheep.sprite.position = ccp( size.width /3 , size.height/3 );
        [self addChild:sheep.sprite];
        [sheep roamRight];		 

		[[SimpleAudioEngine sharedEngine ] playBackgroundMusic:@"24929.mp3" loop:YES];
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
		
        gesturecontrol =NO;
	}
	
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
