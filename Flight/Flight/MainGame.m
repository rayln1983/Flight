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
        [self createPoint];
        [self createPlayer];
        [self schedule:@selector(createEnemy) interval:1];
        [self scheduleUpdate];
        
    }
    return self;
}

- (void)createPoint{
    _sum = 0;
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    self.point = [CCLabelTTF labelWithString:@"0" fontName:@"Marker Felt" fontSize:32];
    [self.point setColor:ccBLACK];
    [self.point setAnchorPoint:ccp(1, 1)];
    //CGPoint *p = self._point
    [self.point setPosition:ccp(winSize.width-20, winSize.height-20)];
    [self addChild:self.point z:100];
}

//create background
- (void)createBackground{
    CCLayer *layer = [CCLayer node];
    Background *background = [[Background alloc] init];
    [layer addChild:background];
    [self addChild:layer];
    
    [background release];
}

- (void)createEnemy{

    int number = [Util random:0 :9];
    if(number <= 1){
        EnemyBig *enemyBig = [[EnemyBig alloc] initWithSpace:_space];
        [self addChild:enemyBig];
        //release
        [enemyBig release];
        
    }else if(number >1 && number <=4){
        EnemyMid *enemy = [[EnemyMid alloc] initWithSpace:_space];
        [self addChild:enemy];
        //release
        [enemy release];
                
    }else{
        EnemySmall *enemy = [[EnemySmall alloc] initWithSpace:_space];
        [self addChild:enemy];
        //release
        [enemy release];

        
    }
    
    
}

// init physics
- (void)initPhysics{
    self.isAccelerometerEnabled = YES;
    self.isTouchEnabled = YES;
    _space = cpSpaceNew();
    _space->gravity = ccp(xGravity, yGravity);
    cpSpaceAddCollisionHandler(_space, tBullet, tEnemy, beginBulletToEnemy, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tBullet, tBomb, skipCollision, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tPlane, tEnemy, beginPlaneToEnemy, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tEnemy, tEnemy, skipCollision, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tPlane, tBomb, skipCollision, NULL, NULL, NULL, NULL);
    cpSpaceAddCollisionHandler(_space, tEnemy, tBomb, skipCollision, NULL, NULL, NULL, NULL);

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
int skipCollision(cpArbiter *arb, cpSpace *space, void *unused){
	return 0;
}
int beginPlaneToEnemy(cpArbiter *arb, cpSpace *space, void *unused){
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainGame scene] withColor:ccc3(195, 199, 202)]];
    
	return 0;
}
//碰撞的处理函数
void postStepARemove(cpSpace *space, cpShape *shape, void *unused)
{
    PhysicsSprite *p = shape->data;
    if(p && !p.isDead){
        [p handleCollision];
    }
}
//碰撞的处理函数
void postStepBRemove(cpSpace *space, cpShape *shape, void *unused)
{
    PhysicsSprite *p = shape->data;
    //NSLog(@"%i", shape->collision_type);
    if(p && !p.isDead){
        int pointer = [p handleCollision];
        
        _sum += pointer;
        //point.getBody;
        //[self.point setString:<#(NSString *)#>]
        //[self.point ]
    }
}

- (void)createPlayer{
    self.play = [[Player alloc] initWithSpace:_space];
    [self addChild:self.play];
    
}

-(void) update:(ccTime)time{
    // Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint p1 = [touch locationInView:nil];
    
    self.play.plane.getBody->p = ccp(p1.x, 480-p1.y);
    
}

- (void)dealloc{
    [self.play release];

    [super dealloc];
}
@end
