//
//  HelloWorldLayer.m
//  Halo:Wales
//
//  Created by Scott McMurray on 12/07/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

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
	//NSLog(@"touch (%g,%g)", location.x, location.y);
	location = [[CCDirector sharedDirector] convertToGL:location];
	NSLog(@"touch (%g,%g)", location.x, 60.0f);
	
	[masterChief moveToPosition: location];
	//[masterChief moveToPosition: CGPointMake(10.0f, 10.0f)];
	//CGSize size = [[CCDirector sharedDirector] winSize];
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	//NSLog(@"touch (%g,%g)", location.x, location.y);
	location = [[CCDirector sharedDirector] convertToGL:location];
	NSLog(@"moved (%g,%g)", location.x, location.y);
	
	}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) 
    {
		self.isTouchEnabled = YES;

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        masterChief = [MasterChief node];
        [masterChief setUp];
        
        masterChief.sprite.position = ccp( size.width /2 , size.height/2 );
        [self addChild:masterChief.sprite];
        
        [masterChief run];
		[masterChief retain];
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
