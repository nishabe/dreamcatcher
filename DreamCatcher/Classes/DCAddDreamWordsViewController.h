//
//  DCWords.h
//  DreamCatcher
//
//  Created by Aneesh on 14/01/14.
//  Copyright (c) 2014 Ammini Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSKeyboardControls.h"

@interface DCAddDreamWordsViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate, BSKeyboardControlsDelegate>
@property (weak, nonatomic) IBOutlet UITextField *dreamName;
@property (weak, nonatomic) IBOutlet UITextView *dreamSummary;

@property (weak, nonatomic) IBOutlet UITextField *dreamRole;
@property (weak, nonatomic) IBOutlet UITextField *dreamText;
@property (weak, nonatomic) IBOutlet UITextField *dreamTime;

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
@property (weak, nonatomic) NSMutableString  *descriptionSummaryText;

-(IBAction)showSavingAlert:(id)sender;

@end
