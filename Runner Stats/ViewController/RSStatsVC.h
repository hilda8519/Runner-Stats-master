//
//  RSSecondViewController.h
//  RunningStats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSStatsVC : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIScrollView *currentStatsView;
@end
