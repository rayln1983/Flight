//
//  IntroLayer.h
//  Flight
//
//  Created by Rayln Guan on 10/4/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Test1.h"

// HelloWorldLayer
@interface IntroLayer : CCLayer
{
}

@property (nonatomic, retain) Test1 *t;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
