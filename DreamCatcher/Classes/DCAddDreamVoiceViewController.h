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


@interface DCAddDreamVoiceViewController : UIViewController<AVAudioPlayerDelegate>{
    int _elapsedTime;
    
}

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *progressBarTimer;
@property (strong, nonatomic) NSTimer *elapsedTimeIndicatorTimer;
@property (strong, nonatomic) NSURL *audioFileURL;
@property (strong, nonatomic) NSString *audioFilePath;


@property (weak, nonatomic) IBOutlet UIImageView *recordingIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeIndicator;

@property BOOL isAudioRecording;
@property BOOL isAudioPlaying;


-(IBAction)dismissVC:(id)sender;

- (IBAction)handleButtonTocuh:(id)sender;

@end
