//
//  SKMainScene.h
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKMainScene : SKScene <SKPhysicsContactDelegate>
{
	int _smallPlaneTime;
	int _mediumPlaneTime;
	int _bigPlaneTime;
	
	int _adjustmentBackgroundPosition;
	
	SKLabelNode  *_scoreLabel;
	SKSpriteNode *_playerPlane;
	SKSpriteNode *_background1;
	SKSpriteNode *_background2;
	
	SKAction *_smallFoePlaneHitAction;
	SKAction *_mediumFoePlaneHitAction;
	SKAction *_bigFoePlaneHitAction;
	SKAction *_smallFoePlaneBlowupAction;
	SKAction *_mediumFoePlaneBlowupAction;
	SKAction *_bigFoePlaneBlowupAction;
}

@end
