//
//  PhysicsNode.h
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "chipmunk.h"

@interface PhysicsNode : CCNode {
    cpSpace *_space;

}
- (id)initWithSpace:(cpSpace *)space__;
@end
