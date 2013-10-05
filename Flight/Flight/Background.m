//
//  Background.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Background.h"


@implementation Background{
    
}

- (id)init{
    self = [super init];
    if(self){
        bg1 = CGPointMake(0, 481);
        bg2 = CGPointMake(0, 962);
        
        self.background1 = [CCSprite spriteWithFile:@"bg_01.jpg"];
        self.background2 = [CCSprite spriteWithFile:@"bg_02.jpg"];
        [self initBackground1:self.background1];
        [self initBackground2:self.background2];
        [self addChild:self.background1];
        [self addChild:self.background2];
        [self startBackground2];
        [self startBackground1];
    }
    return self;
}

- (void)initBackground1:(CCSprite *)bg{
    [bg setAnchorPoint:CGPointMake(0, 1)];
    [bg setScale:.672];
    [bg setPosition:bg1];
}

- (void)initBackground2:(CCSprite *)bg{
    [bg setAnchorPoint:CGPointMake(0, 1)];
    [bg setScale:.672];
    [bg setPosition:bg2];
}
- (CCSequence *)getSequence{
    CCFiniteTimeAction *action1 = [CCMoveTo actionWithDuration:0 position:CGPointMake(0, 962)];
    CCFiniteTimeAction *action2 = [CCMoveTo actionWithDuration:10 position:CGPointMake(0, 0)];
    return [CCSequence actions:action1, action2, nil];
}
- (void)startBackground2{
    [self.background2 runAction:[CCRepeatForever actionWithAction:[self getSequence]]];
}
- (void)startBackground1{
    CCFiniteTimeAction *action1 = [CCMoveTo actionWithDuration:5 position:CGPointMake(0, 0)];
    CCCallFunc *cal = [CCCallFunc actionWithTarget:self selector:@selector(callback1)];
    CCSequence *seq1 = [CCSequence actions:action1, cal, nil];
    [self.background1 runAction:[CCRepeat actionWithAction:seq1 times:1]];
    
}
- (void)callback1{
    [self.background1 runAction:[CCRepeatForever actionWithAction:[self getSequence]]];
}
@end
