//
//  RSGameKitHelper.m
//  Runner Stats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.//

#import "RSGameKitHelper.h"
#import "RSConstants.h"

@implementation RSGameKitHelper

-(void) submitScore:(double_t)score
           category:(NSString*)category {
    //1: Check if Game Center
    //   features are enabled
    if (!_gameCenterFeaturesEnabled) {
        NSLog(@"Player not authenticated");
        return;
    }
    
    //2: Create a GKScore object
    GKScore* gkScore = [[GKScore alloc] initWithLeaderboardIdentifier:category];
    
    //3: Set the score value
    gkScore.value = score;
    
    //4: Send the score to Game Center
    [GKScore reportScores:@[gkScore] withCompletionHandler:
     ^(NSError* error) {
         [self setLastError:error];
         BOOL success = (error == nil);
         
         if ([_delegate respondsToSelector:@selector(onScoresSubmitted:)]) {
             [_delegate onScoresSubmitted:success];
         }
     }];
}

+(id) sharedGameKitHelper
{
    static RSGameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGameKitHelper = [[RSGameKitHelper alloc] init];
    });
    return sharedGameKitHelper;
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) authenticateLocalPlayer
{
    GKLocalPlayer* localPlayer =
    [GKLocalPlayer localPlayer];
    
    __weak GKLocalPlayer *blockLocalPlayer = localPlayer;
    localPlayer.authenticateHandler =
    ^(UIViewController *viewController,
      NSError *error) {
        
        [self setLastError:error];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (blockLocalPlayer.authenticated) {
            self.gameCenterFeaturesEnabled = YES;
            
            [defaults setBool:YES forKey:FLAG_LOGIN_GC];
        }
        else if(viewController) {
            [defaults setBool:YES forKey:FLAG_LOGIN_GC];
            [self presentViewController:viewController];
        }
        else {
            self.gameCenterFeaturesEnabled = NO;
        }
    };
}

-(void) setLastError:(NSError*)error
{
    _lastError = [error copy];
    if (_lastError) {
        NSLog(@"GameKitHelper ERROR: %@", [[_lastError userInfo]
                                           description]);
    }
}

-(UIViewController*) getRootViewController {
    return [UIApplication
            sharedApplication].keyWindow.rootViewController;
}

-(void)presentViewController:(UIViewController*)vc {
    UIViewController* rootVC = [self getRootViewController];
    [rootVC presentViewController:vc animated:YES
                       completion:nil];
}

@end
