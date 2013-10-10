//
//  EnemyMid.m
//  Flight
//
//  Created by Rayln Guan on 10/6/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyMid.h"


@implementation EnemyMid

- (id)initWithSpaceAndLabel:(cpSpace *)space__ :(CCLabelTTF *)label__ :(int)speed__{
    speed = speed__;
    return [self initWithSpaceAndLabel:space__ :label__];
}
- (id)initWithSpaceAndLabel:(cpSpace *)space__ :(CCLabelTTF *)labe__{
    if (self = [super initWithSpace:space__ :CGRectMake(131, 0, 67, 90)]) {
        self.lable = labe__;
        _life = 3;
        if (speed == 0) {
            speed = -100;
        }
        cpBodySetVel(_body, cpv(0, speed));
        self.point = 3000;
    }
    return self;
}

@end
