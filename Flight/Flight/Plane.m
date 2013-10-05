//
//  Plane.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Plane.h"


@implementation Plane


- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__{
    if (self = [super initWithSpace:space__ :rect__]) {
        
        _body->p = ccp(160, 100);
        _shape->collision_type = 0;
    }
    return self;
}

@end
