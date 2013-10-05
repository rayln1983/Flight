//
//  Player.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize type;
- (id)initWithSpace:(cpSpace *)space__{
    if (self = [super initWithSpace:space__]) {
        self.plane = [[Plane alloc] initWithSpace:space__ :CGRectMake(64, 168, 64, 68)];
        [self addChild:self.plane];
        
        [self schedule:@selector(fire) interval:.3];
        [self.plane release];
        
    }
    return self;
}

- (void)fire{
    Bullet *bullet = [[Bullet alloc] initWithSpaceRed:_space :self.plane];
    [self addChild:bullet];
    [bullet release];
}
@end
