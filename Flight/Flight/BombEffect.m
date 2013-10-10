//
//  BombEffect.m
//  Plane
//
//  Created by Rayln Guan on 10/3/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BombEffect.h"


@implementation BombEffect
// break x 214 y 115 w 26 h 27
// break x 200  y 42  w 40 h 42
// break x 143 y 91 w 36 h 39
+ (id)bombEffect:(CCSpriteBatchNode *)batch{
    BombEffect *bomb = [[[BombEffect alloc] initWithBatch:batch] autorelease];
    return bomb;
}
+ (id)bombEffectWithTexture:(CCTexture2D *)batch{
    BombEffect *bomb = [[[BombEffect alloc] initWithTexture:batch] autorelease];
    return bomb;
}

- (id)init{
    self = [super init];
    if(self){
        self.batchNode = [CCSpriteBatchNode batchNodeWithFile:@"plane.png"];
        [self createSprite];
    }
    return self;
}

- (id)initWithBatch:(CCSpriteBatchNode *)batch{
    self = [super init];
    if(self){
        self.batchNode = batch;
        [self createSprite];
    }
    return self;
}

- (id)initWithTexture:(CCTexture2D *)spriteTexture{
    self = [super init];
    if(self){
        self.texture = spriteTexture;
        [self createSpriteTexture];
    }
    return self;
}

- (void)createSprite{
    self.sprite = [CCSprite spriteWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(214, 115, 26, 27)];
    self.effect1 = [CCSpriteFrame frameWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(214, 115, 26, 27)];
    self.effect2 = [CCSpriteFrame frameWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(200, 42, 40, 42)];
    self.effect3 = [CCSpriteFrame frameWithTexture:[[self.batchNode textureAtlas] texture] rect:CGRectMake(143, 91, 36, 39)];
    self.array = [[[NSMutableArray alloc] initWithObjects:self.effect1,self.effect2,self.effect3,self.effect2,self.effect1, nil] autorelease];
}
- (void)createSpriteTexture{
    self.sprite = [CCSprite spriteWithTexture:self.texture rect:CGRectMake(214, 115, 26, 27)];
    self.effect1 = [CCSpriteFrame frameWithTexture:self.texture rect:CGRectMake(214, 115, 26, 27)];
    self.effect2 = [CCSpriteFrame frameWithTexture:self.texture rect:CGRectMake(200, 42, 40, 42)];
    self.effect3 = [CCSpriteFrame frameWithTexture:self.texture rect:CGRectMake(143, 91, 36, 39)];
    self.array = [[[NSMutableArray alloc] initWithObjects:self.effect2,self.effect3,self.effect1, nil] autorelease];
}
- (void)runMiddleEffect{
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:self.array delay:.1];
    CCAnimate* animate = [CCAnimate actionWithAnimation:animation];
    CCRepeat *repeat = [CCRepeat actionWithAction:animate times:1];
    [self.sprite runAction:repeat];
    
}

- (void)runMiddleEffect: (CCSprite *)sprite{
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:self.array delay:.1];
    CCAnimate* animate = [CCAnimate actionWithAnimation:animation];
    CCRepeat *repeat = [CCRepeat actionWithAction:animate times:1];
    [sprite runAction:repeat];
    //[self.sprite runAction:repeat];
    
}
- (void)dealloc{
    [_array release];
    [super dealloc];
}
@end
