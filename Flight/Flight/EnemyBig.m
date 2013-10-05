//
//  EnemyBig.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyBig.h"

enum{
    xSpeed = 0,
    ySpeed = -50,
    xPosiiton = 0,
    yPosition = 500,
    minRandom = 35,
    maxRandom = 290,
    sLife = 10
};

@implementation EnemyBig

- (id)initWithSpace:(cpSpace *)space__{
    if (self = [super initWithSpace:space__ :CGRectMake(0, 0, 113, 164)]) {
        _body->p = ccp([Util random:minRandom :maxRandom], yPosition);
        cpBodySetVel(_body, cpv(xSpeed, ySpeed));
        _shape->collision_type = 2;
        _life = sLife;
        _bomb = [[BombEffect alloc] initWithTexture:_spriteTexture];
    }
    return self;
}
-(void)handleCollision{
    _life--;
    if (_life <= 0) {
        self._isDead = YES;
        _shape->collision_type = 3;
        [_bomb runMiddleEffect:self];
        [self scheduleOnce:@selector(clear) delay:1];
    }
}

- (void)clear{
    cpSpaceRemoveBody(_space, _body);
    cpSpaceRemoveShape(_space, _shape);
    [self removeFromParentAndCleanup:YES];
}

- (void)dealloc{
    [_bomb release];
    [super dealloc];
}
@end
