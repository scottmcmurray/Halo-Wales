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
	NSLog(@"moved (%g,%g)", location.x, location.y);
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
			
			[BubbleShield deployBubbleOnNode:self atPoint:masterChief.sprite.position.x];
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
    if( !gesturecontrol )
    {
        CGPoint touchOrigin = [touch locationInView:[touch view]];
        [masterChief moveAlongGroundToPosition: touchOrigin.x];
        [masterChief run];
    }
    
    gesturecontrol=NO;
}

-(void) initAssets
{
    // ask director the the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    [[SimpleAudioEngine sharedEngine ] playBackgroundMusic:@"24929.mp3" loop:YES];
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    gesturecontrol =NO;
    
    greenGrassySlopesOfTheBoyne = [[[CCSprite alloc] init] autorelease];
	[greenGrassySlopesOfTheBoyne setTextureRectInPixels:CGRectMake(0, 0, 480, 49) rotated:NO untrimmedSize:CGSizeMake(480, 49)];
	greenGrassySlopesOfTheBoyne.position = ccp(240, 23);
	[greenGrassySlopesOfTheBoyne setColor:ccc3(56, 143, 69)];
	[self addChild: greenGrassySlopesOfTheBoyne];
    
    leftWall = [CCSprite spriteWithFile:@"1x1.gif"];
    leftWall.scaleY = size.height;
    leftWall.scaleX = 10;
    leftWall.position = ccp( 0, 0 );
    
    [leftWall retain];
    
    rightWall = [CCSprite spriteWithFile:@"1x1.gif"];
    rightWall.scaleY = size.height;
    rightWall.scaleX = 10;
    rightWall.position = ccp( size.width-10, 0 );
    
    [rightWall retain];
    
    CCSprite *ground = [CCSprite spriteWithFile:@"1x1.gif"];
    ground.scaleY = 60.0f;
    ground.scaleX = size.width;
    ground.position = ccp( 0, 0 );
    ground.color = ccc3(56, 143, 69);
    ground.opacity = 1;

    [self addChild:ground];
    
    masterChief = [MasterChief node];
    [masterChief setUp];
    masterChief.sprite.position = ccp( size.height/2, 60.0f );
    [self addChild:masterChief.sprite];
    
    [masterChief retain];
    
    Sheep *sheep = [[Sheep node] retain];
    [sheep setUp];
    sheep.sprite.position = ccp( size.width /3, 60.0f );
    [self addChild:sheep.sprite];
    [sheep roam];
    
    sheeps = [[NSMutableArray arrayWithCapacity:0] retain];
    [sheeps addObject:sheep];
    
    banshee = [[Banshee node] retain];
    [banshee setUp];
    [banshee.sprite setRotation:20];
    banshee.sprite.position = ccp( -50, size.height-50 );
    [self addChild:banshee.sprite];
    [banshee fly];
    
    fuelRod = [[FuelRod node] retain];
    [fuelRod setUp];
    fuelRod.sprite.position = ccp( 0, size.height-50 );
    fuelRod.sprite.scale = 0.2f;
    fuelRod.sprite.flipX = YES;
    [self addChild:fuelRod.sprite];
    [fuelRod fire];
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
        [self initAssets];
        [self scheduleUpdate];
	}
	
	return self;
}

-(void) update:(ccTime) deltaTime
{
    for( int i = 0 ; i < [sheeps count] ; i++ )
    {
        Sheep *sheep = [sheeps objectAtIndex:i];
        [sheep checkIsWithinLeftBounds:[leftWall boundingBox]];
        [sheep checkIsWithinRightBounds:[rightWall boundingBox]];
        
        if( CGRectIntersectsRect( [fuelRod.sprite boundingBox], [sheep.sprite boundingBox] ) )
        {
            [self removeChild:fuelRod.sprite cleanup:YES];
            [self removeChild:sheep.sprite cleanup:YES];
        }
    }
    
    if( [masterChief checkForRunningAction:@"ObjectMovement"] )
    {
        [masterChief stopRunning];
    }
    
    if( CGRectIntersectsRect( [fuelRod.sprite boundingBox], [greenGrassySlopesOfTheBoyne boundingBox] ) )
    {
        [self removeChild:fuelRod.sprite cleanup:YES];
    }
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
