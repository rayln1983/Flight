//
//  EnemySprite.h
//  Flight
//
//  Created by Rayln Guan on 10/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicsSprite.h"
#import "BombEffect.h"

@interface EnemySprite : PhysicsSprite {
    BombEffect *_bomb;
    int speed;
}
@property (nonatomic, assign) int point;
@property (nonatomic, strong) CCLabelTTF *lable;
- (id)initWithSpaceAndLabel:(cpSpace *)space :(CCLabelTTF *)label :(int)speed;
- (id)initWithSpaceAndLabel:(cpSpace *)space :(CCLabelTTF *)label;
@end
