//
//  RSRecordCell.h
//  RunningStats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSRecordCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UILabel *unitLabel;
@property (strong, nonatomic) IBOutlet UIImageView *timeImageView;

@end
