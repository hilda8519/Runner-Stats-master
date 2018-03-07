//
//  RSRecordDetailsVC.h
//  RunningStats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JBLineChartView.h"
#import "JBConstants.h"
#import "RSConstants.h"

@interface RSRecordDetailsVC : UIViewController <JBLineChartViewDelegate, JBLineChartViewDataSource>//, ADBannerViewDelegate>
- (void)showRecordFromDate:(NSString *)recordDate;
@property GADBannerView *bannerView;
@end
