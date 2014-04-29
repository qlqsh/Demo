//
//  SKFoePlane.m
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import "SKFoePlane.h"
#import "SKSharedAtles.h"

@implementation SKFoePlane

+ (instancetype)createSmallPlane
{
	SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeSmallFoePlane]];

	foePlane.hp = 1;
	foePlane.type = SKFoePlaneTypeSmall;
	foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];

	return foePlane;
}

+ (instancetype)createMediumPlane
{
	SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeMediumFoePlane]];

	foePlane.hp = 5;
	foePlane.type = SKFoePlaneTypeMedium;
	foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];

	return foePlane;
}

+ (instancetype)createBigPlane
{
	SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeBigFoePlane]];
	
	foePlane.hp = 7;
	foePlane.type = SKFoePlaneTypeBig;
	foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];
	
	return foePlane;
}

@end
