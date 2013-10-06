//
//  EnemySmall.m
//  Flight
//
//  Created by Rayln Guan on 10/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemySmall.h"


@implementation EnemySmall

- (id)initWithSpace:(cpSpace *)space__{
    if (self = [super initWithSpace:space__ :CGRectMake(199, 86, 39, 28)]) {
        _life = 1;
        cpBodySetVel(_body, cpv(0, -150));
        self.point = 1000;
    }
    return self;
}

@end
