//
//  PhysicsSprite.m
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PhysicsSprite.h"

enum{
    shapeNum = 4
};
@implementation PhysicsSprite

- (id)initWithSpace:(cpSpace *)space__ :(CGRect)rect__{
    _spriteTexture= [[CCTextureCache sharedTextureCache] addImage:@"plane.png"];
    if(self = [super initWithTexture:_spriteTexture rect:rect__]){
        self._isDead = NO;
        _space = space__;
        //_body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, vers, CGPointZero);
        _body = cpBodyNew(1.0f, cpMomentForBox(1.0f, rect__.size.width, rect__.size.height));
        cpSpaceAddBody(_space, _body);
        
        _shape = cpBoxShapeNew(_body, rect__.size.width, rect__.size.height);
        _shape->data = self;
        cpSpaceAddShape(_space, _shape);
        
    }
    return self;
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
- (void)handleCollision{
    //cpBodyEachShape(_body, removeShape, NULL);
	//cpBodyFree( _body );
}

// callback to remove Shapes from the Space
void removeShape( cpBody *body, cpShape *shape, void *data )
{
	cpShapeFree( shape );
}
-(void) dealloc
{
	//cpBodyEachShape(_body, removeShape, NULL);
	//cpBodyFree( _body );
	
	[super dealloc];
}


@end
