//
//  EnemyMid.m
//  Flight
//
//  Created by Rayln Guan on 10/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyMid.h"


@implementation EnemyMid
- (id)initWithSpace:(cpSpace *)space__{
    if (self = [super initWithSpace:space__ :CGRectMake(131, 0, 67, 90)]) {
        _life = 3;
        cpBodySetVel(_body, cpv(0, -100));
        self.point = 3000;
    }
    return self;
}

@end
