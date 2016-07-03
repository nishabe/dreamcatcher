//
//  DCAddDreamViewController.m
//  DreamCatcher
//
//  Created by Aneesh on 07/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import "DCAddDreamViewController.h"
#import "DCUtils.h"

@interface DCAddDreamViewController ()
{
   
}
@end

@implementation DCAddDreamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismissVC:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
