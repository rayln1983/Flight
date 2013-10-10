//
//  Player.h
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicsNode.h"
#import "Plane.h"
#import "Bullet.h"

@interface Player : PhysicsNode {
    
}
@property (nonatomic, strong) Plane *plane;
@property (nonatomic, strong) Bullet *bullet;
@property (nonatomic, assign) int type;

@end
