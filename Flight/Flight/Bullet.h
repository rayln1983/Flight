//
//  Bullet.h
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicsSprite.h"
#import "Plane.h"

@interface Bullet : PhysicsSprite {
    
}
- (id)initWithSpaceT:(cpSpace *)space__;
- (id)initWithSpaceRed:(cpSpace *)space__ :(Plane *)plane__;
- (id)initWithSpaceBlue:(cpSpace *)space__ :(Plane *)plane__;
    
@end
