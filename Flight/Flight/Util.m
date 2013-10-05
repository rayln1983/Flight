//
//  Util.m
//  Plane
//
//  Created by rayln on 13-10-1.
//
//

#import "Util.h"

@implementation Util

+ (int)random:(int)min :(int)max{
    return rand()%(max - min + 1) + min;
}

@end
