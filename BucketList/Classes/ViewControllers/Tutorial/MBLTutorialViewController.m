//
//  MBLTutorialViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/16/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLTutorialViewController.h"
#import "MBLTutorialContentViewController.h"
#import "MBLTutorialModel.h"

@interface MBLTutorialViewController ()

@property (nonatomic, strong) NSArray* backgrounds;
@property (nonatomic, strong) NSArray* tutorialIcons;
@property (nonatomic, strong) NSArray* tutorialTitles;
@property (weak, nonatomic) UIStoryboard* sb;
@property (nonatomic,strong) MBLTutorialModel* tutorialModel;

@end

@implementation MBLTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tutorialModel = [[MBLTutorialModel alloc] init];
    
    _sb = [UIStoryboard storyboardWithName:@"MBLTutorialViewController" bundle:nil];
    self.pageViewController = [self.sb instantiateViewControllerWithIdentifier:@"MBLTutorialViewController"];
    self.pageViewController.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tutorial4"]]];
    
    MBLTutorialContentViewController* initialViewController = [self viewControllerAtIndex:0];
    [self.pageViewController setViewControllers:[NSArray arrayWithObject:initialViewController] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    
}

- (MBLTutorialContentViewController* )viewControllerAtIndex:(NSUInteger)index
{
    if ([self.tutorialModel.tutorialText count] <= 0) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    MBLTutorialContentViewController* contentViewController = [self.sb instantiateViewControllerWithIdentifier:@"MBLTutorialContentViewController"];
    contentViewController.iconImageFile = self.tutorialModel.tutorialIcon[index];
    contentViewController.titleText = self.tutorialModel.tutorialText[index];
    contentViewController.index = index;
    
    if (index == [self.tutorialModel.tutorialText count] - 1) {
        contentViewController.lastPage = true;
    } else {
        contentViewController.lastPage = false;
    }

    return contentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((MBLTutorialContentViewController*) viewController).index;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.tutorialModel.tutorialText count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((MBLTutorialContentViewController*) viewController).index;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;

    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.tutorialModel.tutorialText count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - delegate method

- (void)popSelf {
    [self.navigationController popViewControllerAnimated:true];
}

@end
