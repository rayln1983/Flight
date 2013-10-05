//
//  PhysicsNode.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PhysicsNode.h"


@implementation PhysicsNode

- (id)initWithSpace:(cpSpace *)space__{
    if (self = [super init]) {
        _space = space__;
    }
    return self;
}

@end
