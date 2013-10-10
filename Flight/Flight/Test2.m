//
//  Test2.m
//  Flight
//
//  Created by Rayln Guan on 10/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Test2.h"


@implementation Test2
- (id)init{
    if (self = [super init]) {
        NSLog(@"====Test2: %i", [self retainCount]);
    }
    return self;
}

- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__{
    if (self = [super initWithSpace:space__ :rect__ ]) {
        
    }
    return self;
}


@end
