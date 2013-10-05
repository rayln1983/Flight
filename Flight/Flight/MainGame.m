//
//  MainGame.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainGame.h"

enum gravity{
    xGravity = 0,
    yGravity = 0
};
enum{
    tPlane = 0,
    tBullet = 1,
    tEnemy = 2,
    tBomb = 3
};
@implementation MainGame

+ (CCScene *)scene{
    return [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
}

- (id)init{
    if (self = [super init]) {
        [self initPhysics];
        [self createBackground];
        [self createPlayer];
        [self scheduleUpdate];
        
    }
    return self;
}

//create background
- (void)createBackground{
    CCLayer *layer = [CCLayer node];
    Background *background = [[Background alloc] init];
    [layer addChild:background];
    [self addChild:layer];
    [background release];
}

// init physics
- (void)initPhysics{
    self.isAccelerometerEnabled = YES;
    self.isTouchEnabled = YES;
    _space = cpSpaceNew();
    _space->gravity = ccp(xGravity, yGravity);
    cpSpaceAddCollisionHandler(_space, tBullet, tEnemy, beginBulletToEnemy, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tBullet, tBomb, beginBulletToBomb, NULL, NULL, NULL, NULL);
}
int beginBulletToEnemy(cpArbiter *arb, cpSpace *space, void *unused){
    //CP_ARBITER_GET_SHAPES取出是哪两个shape发生了碰撞，a，b是emery还是bullet，与之前设置回调函数时的第2，3参数的顺序有关
	CP_ARBITER_GET_SHAPES(arb, a, b);
    //我们不能直接在begin函数里面释放刚体或者shape，要等chipmunk做完必要的计算后才能释放。cpSpaceAddPostStepCallback用来安全的完成这个步骤
	cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepARemove, a, NULL);
	cpSpaceAddPostStepCallback(space, (cpPostStepFunc)postStepBRemove, b, NULL);
	// The object is dead, don't process the collision further
    //返回1是物体撞击事件有效
    //返回0是物体撞击事件无效
	return 0;
}
int beginBulletToBomb(cpArbiter *arb, cpSpace *space, void *unused){
	return 0;
}
//碰撞的处理函数
void postStepARemove(cpSpace *space, cpShape *shape, void *unused)
{
    PhysicsSprite *p = shape->data;
    //NSLog(@"A:%@",p);
    if(p && !p._isDead){
        [p handleCollision];
    }
}
//碰撞的处理函数
static void postStepBRemove(cpSpace *space, cpShape *shape, void *unused)
{
    PhysicsSprite *p = shape->data;
    //NSLog(@"%i", shape->collision_type);
    if(p && !p._isDead){
        [p handleCollision];
    }
}

- (void)createPlayer{
    Player *play = [[Player alloc] initWithSpace:_space];
    [self addChild:play];
    
    EnemyBig *enemyBig = [[EnemyBig alloc] initWithSpace:_space];
    [self addChild:enemyBig];
    
    //release
    [enemyBig release];
    [play release];
}

-(void) update:(ccTime)time{
    // Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
}

- (void)dealloc{
    
    [super dealloc];
}
@end
