//
//  DCAddDreamVoiceViewController.h
//  DreamCatcher
//
//  Created by Aneesh on 08/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "DCOscilloscopeView.h"


@interface DCAddDreamVoiceViewController : UIViewController

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (weak, nonatomic) IBOutlet DCOscilloscopeView *oscilloscopeView;

-(IBAction)dismissVC:(id)sender;

- (IBAction)audioRecord:(id)sender;
- (IBAction)audioPlay:(id)sender;
- (IBAction)audioStop:(id)sender;

@end
