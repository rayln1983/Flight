//
//  PhysicsSprite.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PhysicsSprite.h"

enum{
    shapeNum = 4,
    outScreen = 50
};
@implementation PhysicsSprite

- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__{
    _spriteTexture= [[CCTextureCache sharedTextureCache] addImage:@"plane.png"];
    if(self = [super initWithTexture:_spriteTexture rect:rect__]){
        self.isDead = NO;
        _winSize = [[CCDirector sharedDirector] winSize];
        _space = space__;
        //_body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, vers, CGPointZero);
        _body = cpBodyNew(1.0f, cpMomentForBox(1.0f, rect__.size.width, rect__.size.height));
        _body->p = ccp(0,0);
        cpSpaceAddBody(_space, _body);
        
        _shape = cpBoxShapeNew(_body, rect__.size.width, rect__.size.height);
        _shape->collision_type = 1;
        _shape->data = self;
        
        cpSpaceAddShape(_space, _shape);
        [self scheduleUpdate];
    }
    return self;
}
- (void)update:(ccTime)time{
    if((_body->p.x<-outScreen || _body->p.x>_winSize.width+outScreen) || (_body->p.y<-outScreen || _body->p.y > _winSize.height+outScreen)){
        [self removeFromParentAndCleanup:YES];
    }
}
- (BOOL)dirty{
    return YES;
}
-(CGAffineTransform) nodeToParentTransform
{
	CGFloat x = _body->p.x;
	CGFloat y = _body->p.y;
	
	if ( ignoreAnchorPointForPosition_ ) {
		x += anchorPointInPoints_.x;
		y += anchorPointInPoints_.y;
	}
	
	// Make matrix
	CGFloat c = _body->rot.x;
	CGFloat s = _body->rot.y;
	
	if( ! CGPointEqualToPoint(anchorPointInPoints_, CGPointZero) ){
		x += c*-anchorPointInPoints_.x + -s*-anchorPointInPoints_.y;
		y += s*-anchorPointInPoints_.x + c*-anchorPointInPoints_.y;
	}
	
	// Translate, Rot, anchor Matrix
	transform_ = CGAffineTransformMake( c,  s,
									   -s,	c,
									   x,	y );
	
	return transform_;
}

- (cpSpace *)getSpace{
    return _space;
}

- (cpBody *)getBody{
    return _body;
}

- (cpShape *)getShape{
    return _shape;
}

-(void) dealloc
{
    cpSpaceRemoveBody(_space, _body);
    cpBodyFree(_body);
    cpSpaceRemoveShape(_space, _shape);
    cpShapeFree(_shape);
	[super dealloc];
}


@end
