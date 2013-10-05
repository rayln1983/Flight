//
//  EnemySprite.m
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemySprite.h"


@implementation EnemySprite

- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__{
    if (self = [super initWithSpace:space__ :rect__]) {
        _bomb = [BombEffect bombEffectWithTexture:_spriteTexture];
        
    }
    return self;
}

@end
