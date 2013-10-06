//
//  EnemySprite.m
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemySprite.h"

enum{
    xSpeed = 0,
    ySpeed = -50,
    xPosiiton = 0,
    yPosition = 500,
    minRandom = 35,
    maxRandom = 290,
    sLife = 10
};

@implementation EnemySprite


- (id)initWithSpace:(cpSpace *)space__:(CGRect)rect__{
    if (self = [super initWithSpace:space__ :rect__]) {
        _body->p = ccp([Util random:minRandom :maxRandom], yPosition);
        cpBodySetVel(_body, cpv(xSpeed, ySpeed));
        _shape->collision_type = 2;
        _life = sLife;
        _bomb = [[BombEffect alloc] initWithTexture:_spriteTexture];
        
    }
    return self;
}
-(id)handleCollision{
    
    _life--;
    if (_life <= 0 && !self.isDead) {
        self.isDead = YES;
        _shape->collision_type = 3;
        [_bomb runMiddleEffect:self];
        [self scheduleOnce:@selector(clear) delay:.5];
        
        return self.point;
    }
    
    return 0;
}

- (void)clear{
    [self removeFromParentAndCleanup:YES];
}

- (void)dealloc{
    [_bomb release];
    [super dealloc];
}

@end
