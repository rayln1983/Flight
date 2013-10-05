//
//  Background.h
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Background : CCNode {
    CGPoint bg1;
    CGPoint bg2;
}
@property (nonatomic, strong) CCSprite *background1;
@property (nonatomic, strong) CCSprite *background2;

@end
