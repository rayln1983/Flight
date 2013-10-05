//
//  BombEffect.h
//  Plane
//
//  Created by Rayln Guan on 10/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BombEffect : CCNode {
    
}
@property (nonatomic, strong) CCSprite *sprite;
@property (nonatomic, strong) CCSpriteFrame *effect1;
@property (nonatomic, strong) CCSpriteFrame *effect2;
@property (nonatomic, strong) CCSpriteFrame *effect3;
@property (nonatomic, strong) CCSpriteBatchNode* batchNode;
@property (nonatomic, strong) CCTexture2D *texture;
@property (nonatomic, strong) NSMutableArray* array;
+ (id) bombEffect:(CCSpriteBatchNode *)batch;
+ (id) bombEffectWithTexture:(CCTexture2D *)batch;
- (void) runMiddleEffect;
- (void) runMiddleEffect:(CCSprite *)sprite;
- (id)initWithBatch:(CCSpriteBatchNode *)batch;
- (id)initWithTexture:(CCTexture2D *)spriteTexture;
@end
