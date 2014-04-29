//
//  SKSharedAtles.m
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import "SKSharedAtles.h"

static SKSharedAtles *_shared = nil;

@implementation SKSharedAtles

+ (instancetype)shared
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_shared = (SKSharedAtles *)[SKSharedAtles atlasNamed:@"gameArts-hd"];
	});
	
	return _shared;
}

/**
 *  根据不同纹理类型，选择不同图片
 *
 *  @param type 纹理类型
 *
 *  @return 特定纹理
 */
+ (SKTexture *)textureWithType:(SKTextureType)type
{
	switch (type)
	{
		case SKTextureTypeBackground:
		{
			return [[[self class] shared] textureNamed:@"background_2.png"];
		}
		case SKTextureTypeBullet:
		{
			return [[[self class] shared] textureNamed:@"bullet1.png"];
		}
		case SKTextureTypePlayerPlane:
		{
			return [[[self class] shared] textureNamed:@"hero_fly_1.png"];
		}
		case SKTextureTypeSmallFoePlane:
		{
			return [[[self class] shared] textureNamed:@"enemy1_fly_1.png"];
		}
		case SKTextureTypeMediumFoePlane:
		{
			return [[[self class] shared] textureNamed:@"enemy3_fly_1.png"];
		}
		case SKTextureTypeBigFoePlane:
		{
			return [[[self class] shared] textureNamed:@"enemy2_fly_1.png"];
		}
		default:
		{
			break;
		}
	}
	return nil;
}

#pragma mark - 玩家相关
// 玩家正常情况所需纹理
+ (SKTexture *)playerPlaneTextureWithIndex:(int)index
{
	return [[[self class] shared] textureNamed:[NSString stringWithFormat:@"hero_fly_%d.png", index]];
}

// 玩家爆炸所需纹理
+ (SKTexture *)playerPlaneBlowupTextureWithIndex:(int)index
{
	return [[[self class] shared] textureNamed:[NSString stringWithFormat:@"hero_blowup_%d.png", index]];
}

#pragma mark - 敌机相关
// 敌机正常运行所需纹理
+ (SKTexture *)generalTextureWithFoePlaneType:(int)type animationIndex:(int)animationIndex
{
	return [[[self class] shared] textureNamed:[NSString stringWithFormat:@"enemy%d_fly_%d.png", type, animationIndex]];
}

// 敌机被击中所需纹理
+ (SKTexture *)hitTextureWithPlaneType:(int)type animationIndex:(int)animationIndex
{
	return [[[self class] shared] textureNamed:[NSString stringWithFormat:@"enemy%d_hit_%d.png", type, animationIndex]];
}

// 敌机爆炸所需纹理
+ (SKTexture *)blowupTextureWithPlaneType:(int)type animationIndex:(int)animationIndex
{
	return [[[self class] shared] textureNamed:[NSString stringWithFormat:@"enemy%d_blowup_%i.png", type, animationIndex]];
}

#pragma mark - 行为
// 玩家飞机的正常运行效果。
+ (SKAction *)playerPlaneAction
{
	NSMutableArray *textures = [NSMutableArray array];
	
	for (size_t i = 1; i <= 2; ++i)
	{
		SKTexture *texture = [[self class] playerPlaneTextureWithIndex:i];
		[textures addObject:texture];
	}
	
	return [SKAction repeatActionForever:[SKAction animateWithTextures:textures timePerFrame:0.1]];
}

// 玩家飞机的爆炸效果。
+ (SKAction *)playerPlaneBlowupAction
{
	NSMutableArray *textures = [NSMutableArray array];
	for (size_t i = 1; i <= 4; ++i)
	{
		SKTexture *texture = [[self class] playerPlaneBlowupTextureWithIndex:i];
		[textures addObject:texture];
	}
	SKAction *dieAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
	
	return [SKAction sequence:@[dieAction, [SKAction removeFromParent]]];
}

// 大敌机正常运行效果
+ (SKAction *)bigFoePlaneAction
{
    NSMutableArray *textures = [NSMutableArray array];

    for(size_t i = 1; i <= 2; ++i)
    {
        SKTexture *texture = [[self class] generalTextureWithFoePlaneType:2 animationIndex:i];
        [textures addObject:texture];
    }
    
    return [SKAction repeatActionForever:[SKAction animateWithTextures:textures timePerFrame:0.1]];
}

/**
 *  敌机被击中效果。
 */
+ (SKAction *)hitActionWithFoePlaneType:(SKFoePlaneType)type
{
	switch (type)
	{
		case 1:
		{
			NSMutableArray *textures = [NSMutableArray array];
			
			SKTexture *texture1 = [[self class] hitTextureWithPlaneType:2 animationIndex:1];
			SKAction *action1 = [SKAction setTexture:texture1];
			
			SKTexture *texture2 = [[self class] textureWithType:SKTextureTypeBigFoePlane];
			SKAction *action2 = [SKAction setTexture:texture2];
			
			[textures addObject:action1];
			[textures addObject:action2];
			
			return [SKAction sequence:textures];
		}
		case 2:
		{
			NSMutableArray *textures = [NSMutableArray array];
			
			for (size_t i = 1; i <= 2; ++i)
			{
				SKTexture *texture = [[self class] hitTextureWithPlaneType:3 animationIndex:i];
				SKAction *action = [SKAction setTexture:texture];
				[textures addObject:action];
			}
			
			return [SKAction sequence:textures];
		}
		case 3:
		{
			
			break;
		}
		default:
		{
			break;
		}
	}
    
    return nil;
}

/**
 *  敌机爆炸效果。
 */
+ (SKAction *)blowupActionWithFoePlaneType:(SKFoePlaneType)type
{
	switch (type)
	{
		case 1:
		{
			// 大飞机
			NSMutableArray *textures = [NSMutableArray array];
			
			for (size_t i = 1; i <= 7; ++i)
			{
				SKTexture *texture = [[self class] blowupTextureWithPlaneType:2 animationIndex:i];
				[textures addObject:texture];
			}
			SKAction *dieAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
			
			return [SKAction sequence:@[dieAction, [SKAction removeFromParent]]];
		}
		case 2:
		{
			// 中飞机
			NSMutableArray *textures = [NSMutableArray array];
			
			for (size_t i = 1; i <= 4; ++i)
			{
				SKTexture *texture = [[self class] blowupTextureWithPlaneType:3 animationIndex:i];
				[textures addObject:texture];
			}
			SKAction *dieAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
			
			return [SKAction sequence:@[dieAction, [SKAction removeFromParent]]];
		}
		case 3:
		{
			// 小飞机
			NSMutableArray *textures = [NSMutableArray array];
			
			for (size_t i = 1; i <= 4; ++i)
			{
				SKTexture *texture = [[self class] blowupTextureWithPlaneType:1 animationIndex:i];
				[textures addObject:texture];
			}
			SKAction *dieAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
			
			return [SKAction sequence:@[dieAction, [SKAction removeFromParent]]];
		}
		default:
		{
			break;
		}
	}
	return nil;
}

@end
