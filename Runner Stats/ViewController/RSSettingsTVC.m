//
//  RSSettingsTVC.m
//  RunningStats
//
//  Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

#import "RSSettingsTVC.h"
#import "RSSettingsVC.h"

@interface RSSettingsTVC ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *measureUnitSegControl;
@property (strong, nonatomic) IBOutlet UISwitch *voiceSwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *countDownSegControl;

@end

@implementation RSSettingsTVC

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // read user preferences if it exists
    [self setupUserDefaults];
}

- (void)setupUserDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.measureUnitSegControl.selectedSegmentIndex = [defaults integerForKey:@"measureUnit"];
    self.voiceSwitch.on = [defaults boolForKey:@"voiceSwitch"];
    self.countDownSegControl.selectedSegmentIndex = [defaults integerForKey:@"countDown"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    RSSettingsVC *parentVC = (RSSettingsVC *)self.parentViewController;

    parentVC.scrollView.scrollEnabled = YES;
    parentVC.descriptionLabel.hidden = NO;
}

- (IBAction)changeMeasureUnit
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.measureUnitSegControl.selectedSegmentIndex forKey:@"measureUnit"];
    [defaults synchronize];
}

- (IBAction)toggleVoiceSwitch
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.voiceSwitch.on forKey:@"voiceSwitch"];
    // if voice gets turned off, no countdown
    if (!self.voiceSwitch.on) {
        [defaults setInteger:0 forKey:@"countDown"];
        self.countDownSegControl.selectedSegmentIndex = 0;
    }
    
    [defaults synchronize];
}

- (IBAction)changeCountDown
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.countDownSegControl.selectedSegmentIndex forKey:@"countDown"];
    [defaults synchronize];
}

# pragma mark - segue tableview delegate
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"showAppSuportPage"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(showAppSuportPage)]) {

                    [segue.destinationViewController performSelector:@selector(showAppSuportPage)];
                }
            }
            else if ([segue.identifier isEqualToString:@"showOpenSourceLibs"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(showOpenSourceLibs)]) {
                    
                    [segue.destinationViewController performSelector:@selector(showOpenSourceLibs)];
                }
            }
            else if ([segue.identifier isEqualToString:@"showVersionLog"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(showVersionLog)]) {
                    
                    [segue.destinationViewController performSelector:@selector(showVersionLog)];
                }
            }
        }
    }
}
// setup rate me table view cell
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        NSURL *appStoreURL = [NSURL URLWithString:@"https://itunes.apple.com/gb/app/runner-stats/id793443821?ls=1&mt=8"];
        [[UIApplication sharedApplication] openURL:appStoreURL];
    }
}
@end
