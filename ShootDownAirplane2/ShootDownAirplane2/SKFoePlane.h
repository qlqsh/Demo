//
//  SKFoePlane.h
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//
//  敌机类

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(int, SKFoePlaneType)
{
	SKFoePlaneTypeBig = 1,
	SKFoePlaneTypeMedium = 2,
	SKFoePlaneTypeSmall = 3
};

@interface SKFoePlane : SKSpriteNode

@property (nonatomic, assign) int hp;               // 血量
@property (nonatomic, assign) SKFoePlaneType type;  // 飞机类型


+ (instancetype)createSmallPlane;   // 小飞机
+ (instancetype)createMediumPlane;  // 中飞机
+ (instancetype)createBigPlane;     // 大飞机

@end
