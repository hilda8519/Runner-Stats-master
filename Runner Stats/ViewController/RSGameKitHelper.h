//
//  RSGameKitHelper.h
//  Runner Stats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <Foundation/Foundation.h>

@protocol GameKitHelperProtocol <NSObject>
-(void) onScoresSubmitted:(bool)success;
@end


@interface RSGameKitHelper : NSObject <GKGameCenterControllerDelegate>

@property (assign, nonatomic) id<GameKitHelperProtocol> delegate;

@property (readonly, nonatomic) NSError *lastError;

@property (assign, nonatomic) BOOL gameCenterFeaturesEnabled;

+ (id) sharedGameKitHelper;

- (void) authenticateLocalPlayer;

-(void) submitScore:(double_t)score
           category:(NSString*)category;

@end
