//
//  Bullet.m
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
enum{
    bulletSpeed = 1000
};

@implementation Bullet

- (id)initWithSpaceT:(cpSpace *)space__{
    if(self = [super initWithSpace:space__ :CGRectMake(109, 0, 12, 20)]){
        //_body->p = ccp(plane__.getBody->p.x, plane__.getBody->p.y+40);
        _body->p = ccp(160, 200);
        _shape->collision_type = 1;
    }
    return self;
}

- (id)initWithSpaceRed:(cpSpace *)space__ :(Plane *)plane__{
    if(self = [super initWithSpace:space__ :CGRectMake(109, 0, 12, 20)]){
        _body->p = ccp(plane__.getBody->p.x, plane__.getBody->p.y+40);
        _shape->collision_type = 1;
        cpBodySetVel(_body, cpv(0, bulletSpeed));
    }
    return self;
}

- (id)initWithSpaceBlue:(cpSpace *)space__ :(Plane *)plane__{
    if(self = [super initWithSpace:space__ :CGRectMake(64, 235, 12, 20)]){
        _body->p = ccp(plane__.getBody->p.x, plane__.getBody->p.y+40);
        _shape->collision_type = 1;
        cpBodySetVel(_body, cpv(0, bulletSpeed));
    }
    return self;

}

- (void)handleCollision{
    cpSpaceRemoveBody(_space, _body);
    cpSpaceRemoveShape(_space, _shape);
    [self removeFromParentAndCleanup:YES];
}
@end
