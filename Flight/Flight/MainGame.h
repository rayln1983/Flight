//
//  MainGame.h
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "chipmunk.h"
#import "CCBReader.h"
#import "Background.h"
#import "Player.h"
#import "EnemyBig.h"
#import "EnemyMid.h"
#import "EnemySmall.h"
int _sum;

@interface MainGame : CCLayer {
    cpSpace *_space;
    
}
@property (nonatomic, strong) Player *play;
@property (nonatomic, strong) CCLabelTTF *point;
+ (CCScene *)scene;
@end
