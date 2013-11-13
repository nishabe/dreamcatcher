//
//  DCAddDreamPicsViewController.m
//  DreamCatcher
//
//  Created by Aneesh on 08/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import "DCAddDreamPicsViewController.h"

@interface DCAddDreamPicsViewController ()

@end

@implementation DCAddDreamPicsViewController

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
    self.title=@"Add Pics to it!";

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
