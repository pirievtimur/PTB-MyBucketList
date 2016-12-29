//
//  MBLFullDescriptionViewController.m
//  BucketList
//
//  Created by Timur Piriev on 11/1/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLFullDescriptionViewController.h"
#import <Social/Social.h>
#import "UIColor+MBLAdditions.h"

@interface MBLFullDescriptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemDate;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UIButton *markAsDoneButton;

@end

@implementation MBLFullDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.markAsDoneButton layer] setBorderWidth:1.f];
    [[self.markAsDoneButton layer] setCornerRadius:5.f];
    [[self.markAsDoneButton layer] setBorderColor:[UIColor colorForBorder].CGColor];
    
    self.title = @"Bucket Item";
}

- (void)viewWillAppear:(BOOL)animated {
    self.itemTitle.text = [self.data valueForKey:@"title"];
    
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"MMM d, yyyy"];
    NSDate *date = [self.data valueForKey:@"date"];
    self.itemDate.text = [dateFormat stringFromDate:date];
    
    self.itemDescription.text = [self.data valueForKey:@"desc"];
    self.markAsDoneButton.hidden = [[self.data valueForKey:@"completed"] isEqualToString:@"yes"] ? true : false;

}

- (IBAction)onClickMarkAsDone:(id)sender {
    MBLDataManager *manager = [MBLDataManager sharedManager];
    NSString *title = [self.data valueForKey:@"title"];
    NSString *description =  [self.data valueForKey:@"desc"];
    NSDate *date =  [self.data valueForKey:@"date"];

    [manager insertDataIntoEntity:title descr:description date:date completed:@"yes"];
    [manager deleteDataFromEntity:self.data];
    
    //creating alert vc
    NSString *alertString = [NSString stringWithFormat:@"Congrats! \"%@\" is done!", title];
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"My BucketList" message:alertString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:true];
    }];
    [alertView addAction:action];
    [self presentViewController:alertView animated:true completion:nil];
}

// MARK: - Share content

- (IBAction)onClickShareViaFB:(id)sender {
    SLComposeViewController *fbPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    NSString *fbString = [self titleForPost:self.itemTitle.text which:self.markAsDoneButton.hidden];
    [fbPost setInitialText:fbString];
    [self presentViewController:fbPost animated:YES completion:nil];
}

- (IBAction)onClickShareViaTwitter:(id)sender {
    SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    NSString *tweetString = [self titleForPost:self.itemTitle.text which:self.markAsDoneButton.hidden];
    [tweet setInitialText:tweetString];
    [self presentViewController:tweet animated:YES completion:nil];
}

- (NSString *)titleForPost:(NSString *)itemTitle which:(BOOL)completed {
    NSString *titleForPost = nil;
    if (completed) {
        titleForPost = [NSString stringWithFormat:@"I completed \"%@\" from my bucket list with #MyBucketList app🏆", itemTitle];
    } else {
        titleForPost = [NSString stringWithFormat:@"\"%@\" in my bucket list in #MyBucketList app", itemTitle];
    }
    
    return titleForPost;
}

@end
