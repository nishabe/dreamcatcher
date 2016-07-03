//
//  DCDreamPlayBackViewController.m
//  DreamCatcher
//
//  Created by Aneesh on 21/01/14.
//  Copyright (c) 2014 Ammini Inc. All rights reserved.
//

#import "DCDreamPlayBackViewController.h"

@interface DCDreamPlayBackViewController ()

@end

@implementation DCDreamPlayBackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self animateLoop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)animateLoop
{
    
    self.dreamSummaryLabel.text=@"SAAAAdiiiii";
    self.dreamSummaryLabel.frame = CGRectMake(-self.dreamSummaryLabel.bounds.size.width, 100, self.dreamSummaryLabel.bounds.size.width,     self.dreamSummaryLabel.bounds.size.height);
    
    [UIView beginAnimations:@"timesquare" context:nil];
    [UIView setAnimationDuration:5];
    [UIView setAnimationRepeatAutoreverses:(YES)];
    [UIView setAnimationRepeatCount:10];
    
    self.dreamSummaryLabel.frame = CGRectMake(480, 100, self.dreamSummaryLabel.bounds.size.width, self.dreamSummaryLabel.bounds.size.height);
    
    [UIView commitAnimations];
}
@end
