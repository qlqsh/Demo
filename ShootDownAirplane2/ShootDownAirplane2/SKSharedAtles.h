//
//  SKSharedAtles.h
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//
//  共享图集

#import <SpriteKit/SpriteKit.h>
#import "SKFoePlane.h"

typedef NS_ENUM (int, SKTextureType) 
{
	SKTextureTypeBackground = 1,        // 背景
	SKTextureTypeBullet = 2,            // 子弹
	SKTextureTypePlayerPlane = 3,       // 玩家
	SKTextureTypeSmallFoePlane = 4,     // 小敌机
	SKTextureTypeMediumFoePlane = 5,    // 中敌机
	SKTextureTypeBigFoePlane = 6        // 大敌机
};

@interface SKSharedAtles : SKTextureAtlas

+ (SKTexture *)textureWithType:(SKTextureType)type;
+ (SKAction *)playerPlaneAction;
+ (SKAction *)playerPlaneBlowupAction;
+ (SKAction *)bigFoePlaneAction;
+ (SKAction *)hitActionWithFoePlaneType:(SKFoePlaneType)type;
+ (SKAction *)blowupActionWithFoePlaneType:(SKFoePlaneType)type;

@end
