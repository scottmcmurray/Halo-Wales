//
//  Sheep.h
//  Halo:Wales
//
//  Created by Robert Falconer on 12/07/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"

@interface Sheep : GameObject {
    
}

-(void) roam;
-(void) roamLeft;
-(void) roamRight;

-(void) checkIsWithinLeftBounds:(CGRect) bounds;
-(void) checkIsWithinRightBounds:(CGRect) bounds;

@end
