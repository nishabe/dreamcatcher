//
//  DCWords.m
//  DreamCatcher
//
//  Created by Aneesh on 14/01/14.
//  Copyright (c) 2014 Ammini Inc. All rights reserved.
//

#import "DCAddDreamWordsViewController.h"
#define SYSTEM_VERSION_LESS_THAN(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface DCAddDreamWordsViewController ()

@end

@implementation DCAddDreamWordsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Add Words to it!";
    NSArray *fields = @[ self.dreamName,self.dreamRole, self.dreamText,self.dreamTime];
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.dreamName=nil;
    self.dreamRole=nil;
    self.dreamText=nil;
    self.dreamTime=nil;
    [self setKeyboardControls:nil];
}


#pragma mark -
#pragma mark Text Field Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keyboardControls setActiveField:textField];
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}

#pragma mark -
#pragma mark Text View Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.keyboardControls setActiveField:textView];
}

#pragma mark -
#pragma mark Keyboard Controls Delegate

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        view = field.superview.superview;
    } else {
        view = field.superview.superview.superview;
    }
    
    [self.tableView scrollRectToVisible:view.frame animated:YES];

}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidChange :(UITextField *)theTextField {
    self.dreamSummary.text=[NSString stringWithFormat:@"%@\n%@\n%@",self.dreamRole.text,self.dreamText.text,self.dreamTime.text];
}
-(IBAction)showSavingAlert:(id)sender{
    UIAlertView *anAlert = [[UIAlertView alloc] init];
    anAlert.tag=201;
    [anAlert setTitle:nil];
    [anAlert setMessage:@"Do you want to save the dream description?"];
    [anAlert setDelegate:self];
    [anAlert addButtonWithTitle:@"Yes"];
    [anAlert addButtonWithTitle:@"No"];
    [anAlert show];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
    }
}
@end
