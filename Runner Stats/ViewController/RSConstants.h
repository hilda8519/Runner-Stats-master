//
//  RSConstants.h
//  RunningStats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

//#import <iAd/iAd.h>
#import "GADBannerView.h"
#import "GADAdMobExtras.h"
#import "RSGameKitHelper.h"

#ifndef RunningStats_RSConstants_h
#define RunningStats_RSConstants_h

#define RS_UNIT ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? 1000.0 : 1609.34)
#define RS_UNIT_VOICE ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? NSLocalizedString(@"kilometers",nil) : NSLocalizedString(@"miles",nil))
#define RS_DISTANCE_UNIT_STRING ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? @"km" : @"mi")
#define RS_SPEED_UNIT_STRING ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? @"km/h" : @"mi/h")
#define RS_SPEED_UNIT_SHORT_STRING  ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? @"kph" : @"mph")
#define RS_PACE_UNIT_STRING ([[NSUserDefaults standardUserDefaults] integerForKey:@"measureUnit"]==0 ? @"min/km" : @"min/mi")
#define RS_VOICE_ON [[NSUserDefaults standardUserDefaults] boolForKey:@"voiceSwitch"]
#define RS_COUNT_DOWN ([[NSUserDefaults standardUserDefaults] integerForKey:@"countDown"]==0 ? 0 : ([[NSUserDefaults standardUserDefaults] integerForKey:@"countDown"]==1 ? 5 : 10))

#define SECONDS_OF_HOUR 3600

#define NUMBER_OF_XY_POINTS 60

#define LEADERBOARD_ID @"me.lifexplorer.Runner_Stats.Best_Runners"

#define FLAG_LOGIN_GC @"LoginGC"
#define FLAG_HAS_SUBMITTED_SOCRE @"hasSubmitted"


#define RS_JAN NSLocalizedString(@"JAN", nil)
#define RS_FEB NSLocalizedString(@"FEB", nil)
#define RS_MAR NSLocalizedString(@"MAR", nil)
#define RS_APR NSLocalizedString(@"APR", nil)
#define RS_MAY NSLocalizedString(@"MAY", nil)
#define RS_JUN NSLocalizedString(@"JUN", nil)
#define RS_JUL NSLocalizedString(@"JUL", nil)
#define RS_AUG NSLocalizedString(@"AUG", nil)
#define RS_SEP NSLocalizedString(@"SEP", nil)
#define RS_OCT NSLocalizedString(@"OCT", nil)
#define RS_NOV NSLocalizedString(@"NOV", nil)
#define RS_DEC NSLocalizedString(@"DEC", nil)
#endif
