//
//  MBLAddNewBucketItemViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/28/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLAddNewBucketItemViewController.h"
#import "UIColor+MBLAdditions.h"

@interface MBLAddNewBucketItemViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *itemTitle;
@property (weak, nonatomic) IBOutlet UITextView *itemDescription;
@property (weak, nonatomic) IBOutlet UIDatePicker *itemDatePicker;
@property (weak, nonatomic) IBOutlet UISwitch *completeItemSwitch;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomConstraint;

@end

@implementation MBLAddNewBucketItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add title for top bar
    self.title = @"Add new item";
    
    //set design for fields
    
    [[self.itemTitle layer] setBorderColor:[UIColor colorForBorder].CGColor];
    [[self.itemTitle layer] setCornerRadius:5.f];
    [[self.itemTitle layer] setBorderWidth:1.f];
    
    [[self.itemDescription layer] setBorderColor:[UIColor colorForBorder].CGColor];
    [[self.itemDescription layer] setCornerRadius:5.f];
    [[self.itemDescription layer] setBorderWidth:1.f];
    
    [self.completeItemSwitch setTintColor:[UIColor navigationBarColor]];
    [self.completeItemSwitch setOnTintColor:[UIColor navigationBarColor]];
    
    //setup date picker
    [_itemDatePicker setDatePickerMode:UIDatePickerModeDate];
    
    //add "Add" button
    UIBarButtonItem *addNewItemButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addNewItemToStorage)];
    
    self.navigationController.topViewController.navigationItem.rightBarButtonItems = @[addNewItemButton];
    
    //register keyboard notifications
    [self registerKeyboardNotifications];
    
    //add tapgesturerecognozer to scrollview
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.scrollView addGestureRecognizer:tap];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    [self unsubscribeKeyboardNotifications];
}

// MARK: - New item methods

- (void)addNewItemToStorage {
    if ([self.itemTitle.text length] == 0 || [self.itemDescription.text length] == 0) {
        [self presentViewController:[self alertViewWithText:@"Oh..Looks like you didn't specify some fields"] animated:true completion:nil];
        return;
    }
    
    MBLDataManager *dataManager = [MBLDataManager sharedManager];
    NSString *isCompleted = [self.completeItemSwitch isOn] ? @"yes" : @"no";
    [dataManager insertDataIntoEntity:self.itemTitle.text descr:self.itemDescription.text date:[self.itemDatePicker date] completed:isCompleted];
    [self.navigationController popViewControllerAnimated:true];
}

// MARK: - Alert methods

- (UIAlertController *)alertViewWithText:(NSString *)message {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"WARNING" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertView addAction:action];
    return alertView;
}

//MARK: - Keyboard methods

- (void)registerKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)unsubscribeKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillChange:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGRect kbFrame = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double kbAnimationDuration = [info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect kbFrameInView = [self.view convertRect:kbFrame fromView:nil];
    CGFloat keyboardYPos = CGRectGetMinY(kbFrameInView);
    CGFloat viewHeight = CGRectGetHeight(self.view.bounds);
    CGFloat offset = fabs(keyboardYPos - viewHeight);
    self.scrollViewBottomConstraint.constant = offset;
    [UIView animateWithDuration:kbAnimationDuration animations:^{
        [self.scrollView layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    double kbAnimationDuration = [info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.scrollViewBottomConstraint.constant = 0;
    [UIView animateWithDuration:kbAnimationDuration animations:^{
        [self.scrollView layoutIfNeeded];
    }];
}

- (void)hideKeyboard {
    [self.scrollView endEditing:YES];
}

@end
