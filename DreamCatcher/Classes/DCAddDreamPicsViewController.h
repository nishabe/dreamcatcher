//
//  DCAddDreamPicsViewController.h
//  DreamCatcher
//
//  Created by Aneesh on 08/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCAddDreamPicsViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UIImageView* dreamImageView;
    IBOutlet UIBarButtonItem* cameraButton;
    IBOutlet UIToolbar* toolbar;

}
-(IBAction)dismissVC:(id)sender;
-(IBAction)selectPhoto:(id)sender;
-(IBAction)takePhoto:(id)sender;
-(IBAction)showSavingAlert:(id)sender;

@end
