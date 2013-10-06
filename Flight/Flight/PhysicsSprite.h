//
//  PhysicsSprite.h
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "chipmunk.h"
#import "Util.h"


@interface PhysicsSprite : CCSprite {
    cpSpace *_space;
    cpBody *_body;
    cpShape *_shape;
    CCTexture2D *_spriteTexture;
    CGSize _winSize;
    int _life;
}
@property (nonatomic, assign) bool isDead;

- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__;
- (cpSpace *)getSpace;
- (cpBody *)getBody;
- (cpShape *)getShape;
- (id)handleCollision;
@end
