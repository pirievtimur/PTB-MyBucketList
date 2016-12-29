//
//  MBLSettingsViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/22/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLAboutViewController.h"
#import "MBLTutorialViewController.h"
#import "UIColor+MBLAdditions.h"

@interface MBLAboutViewController ()

@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;
@property (weak, nonatomic) IBOutlet UIButton *supportRequestButton;

@end

@implementation MBLAboutViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title = [NSString stringWithFormat:@"About"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButtonDesign];
}

//MARK: - Button handlers

- (IBAction)onClickAboutButton:(id)sender {
}

- (IBAction)onClickTutorialButton:(id)sender {
    [self presentViewController:[MBLTutorialViewController new] animated:YES completion:nil];
}
- (IBAction)onClickSupportRequestButton:(id)sender {
}

- (void)setupButtonDesign {
    [[self.aboutButton layer] setBorderWidth:1.f];
    [[self.aboutButton layer] setCornerRadius:5.f];
    [[self.aboutButton layer] setBorderColor:[UIColor colorForBorder].CGColor];
    self.aboutButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
    
    [[self.tutorialButton layer] setBorderWidth:1.f];
    [[self.tutorialButton layer] setCornerRadius:5.f];
    [[self.tutorialButton layer] setBorderColor:[UIColor colorForBorder].CGColor];
    self.tutorialButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
    
    [[self.supportRequestButton layer] setBorderWidth:1.f];
    [[self.supportRequestButton layer] setCornerRadius:5.f];
    [[self.supportRequestButton layer] setBorderColor:[UIColor colorForBorder].CGColor];
    self.supportRequestButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
}



@end
