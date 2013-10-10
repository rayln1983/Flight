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
        self.plane = [[[Plane alloc] initWithSpace:space__ :CGRectMake(64, 168, 64, 68)] autorelease];
        [self addChild:self.plane];
        [self schedule:@selector(fire) interval:.3];
        
    }
    return self;
}

- (void)fire{
    [self createOneFire];
}

- (void)createOneFire{
    Bullet *bullet = [[Bullet alloc] initWithSpaceRed:_space :self.plane];
    [self addChild:bullet];
    [bullet release];
}

- (void)createTwoFire{
    Bullet *bullet1 = [[Bullet alloc] initWithSpaceAndPosition:_space :self.plane :ccp(-20, 10)];
    Bullet *bullet2 = [[Bullet alloc] initWithSpaceAndPosition:_space :self.plane :ccp(20, 10)];
    [self addChild:bullet1];
    [bullet1 release];
    [self addChild:bullet2];
    [bullet2 release];
}
- (void)dealloc{
    [_plane release];
    [_bullet release];
    [super dealloc];
}
@end
