//
//  Bullet.m
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
enum{
    bulletSpeed = 2000
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
- (id)initWithSpaceAndPosition:(cpSpace *)space__ :(Plane *)plane__ :(CGPoint)point__{
    if(self = [super initWithSpace:space__ :CGRectMake(64, 235, 12, 20)]){
        _body->p = ccp(plane__.getBody->p.x+point__.x, plane__.getBody->p.y+point__.y);
        _shape->collision_type = 1;
        cpBodySetVel(_body, cpv(0, bulletSpeed));
    }
    return self;
    
}

- (id)handleCollision{
    [self removeFromParentAndCleanup:YES];
    return 0;
}

- (void)dealloc{
    [super dealloc];
}
@end
