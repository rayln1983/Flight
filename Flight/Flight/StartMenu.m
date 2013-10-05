//
//  StartMenu.m
//  Plane
//
//  Created by Rayln Guan on 9/29/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StartMenu.h"
#import "CCBReader.h"
#import "MainGame.h"

@implementation StartMenu

- (void)startGame:(id)sender{
    	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainGame scene] withColor:ccc3(195, 199, 202)]];
};

@end
