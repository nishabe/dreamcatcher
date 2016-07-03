//
//  DCAddDreamVoiceViewController.m
//  DreamCatcher
//
//  Created by Aneesh on 08/11/13.
//  Copyright (c) 2013 Ammini Inc. All rights reserved.
//

#import "DCAddDreamVoiceViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DCUtils.h"


@interface DCAddDreamVoiceViewController ()
- (void)audioRecordingStart;
- (void)audioRecordingStop;
- (void)audioPlayingStop;
@end

@implementation DCAddDreamVoiceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=@"Add Voice to it!";
    //Audio Recording Setup
    self.audioFilePath=[DCUtils getFileName:nil withExtension:@".m4a"];

    self.audioFileURL = [NSURL fileURLWithPath:self.audioFilePath];
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,nil];
    NSError *error = nil;
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:self.audioFileURL
                          settings:audioSettings
                          error:nil];
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [self.audioRecorder prepareToRecord];
    }
}
-(void)showRecordingIndicatorWithAnimation{
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = .5;
    pulseAnimation.toValue = [NSNumber numberWithFloat:1.1];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = FLT_MAX;
    [self.recordingIndicator.layer addAnimation:pulseAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismissVC:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)handleButtonTocuh:(id)sender{
    UIButton *aButton=(UIButton*)sender;
    
    switch (aButton.tag) {
        case 100:// Record
            if (!self.isAudioPlaying && !self.isAudioRecording) {
                self.isAudioRecording=YES;
                [self audioRecordingStart];
                [self animateButtonTouch:aButton];
            }
            break;
        case 101:// Record Stop
        {
            if (self.isAudioRecording) {
                [self audioRecordingStop];
                [self animateButtonTouch:aButton];
            }
        }
            break;
        case 102:// Play
            if (!self.isAudioPlaying && !self.isAudioRecording && [[NSFileManager defaultManager] fileExistsAtPath:self.audioFilePath]) {
                self.isAudioPlaying=YES;
                [self audioPlayingStart];
                [self animateButtonTouch:aButton];
            }
            break;
        case 103:// Play Stop
        {
            if (self.isAudioPlaying) {
                [self audioPlayingStop];
                [self animateButtonTouch:aButton];
            }
        }
            break;
        case 104:// Save
        {
            if (!self.isAudioPlaying && !self.isAudioRecording && [[NSFileManager defaultManager] fileExistsAtPath:self.audioFilePath]) {
                [self showSavingAlert];
            }
        }
            break;
        case 105:// Delete
        {
            if ([[NSFileManager defaultManager] fileExistsAtPath:self.audioFilePath]) {
                [self showRemovalAlert];
            }
        }
            break;
        default:
            break;
    }
}
-(void)animateButtonTouch:(UIButton*)aButton{
    [UIView animateWithDuration:0.5 animations:^{
        aButton.alpha=0;
    } completion:^(BOOL finished){
        aButton.alpha=1;
    }];
}
- (void)audioRecordingStart
{
    self.isAudioRecording=YES;
    [self.progressBarTimer invalidate];
    [self.audioProgress setHidden:YES];
    [self showRecordingIndicatorWithAnimation];
    self.recordingIndicator.hidden=NO;
    self.elapsedTimeIndicator.hidden=NO;
    [self showElapsedTimeIndicator];
    if (![self.audioRecorder prepareToRecord])
    {
        NSLog(@"Error: Prepare to record failed");
    }
    [self.audioRecorder record];
}
- (void)audioRecordingStop
{
    self.isAudioRecording=NO;
    self.isAudioPlaying=NO;
    [self.audioRecorder stop];
    self.recordingIndicator.hidden=YES;
    self.elapsedTimeIndicator.hidden=YES;
    [self.elapsedTimeIndicatorTimer invalidate];
    _elapsedTime=0;
    self.elapsedTimeIndicator.text=@"00:00:00";
    
}

- (void)audioPlayingStart
{
    self.isAudioPlaying=YES;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.audioFileURL error:nil];
    self.audioPlayer.delegate=self;
    [self.audioPlayer play];
    self.progressBarTimer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                             target:self
                                                           selector:@selector(updateProgress)
                                                           userInfo:nil
                                                            repeats:YES];
    [self.audioProgress setHidden:NO];
}
- (void)audioPlayingStop
{
    self.isAudioPlaying=NO;
    [self.progressBarTimer invalidate];
    [self.audioPlayer stop];
    self.audioProgress.progress= 0.0;
    self.audioProgress.hidden=YES;
}
-(void)showRemovalAlert{
    UIAlertView *anAlert = [[UIAlertView alloc] init];
    anAlert.tag=200;
    [anAlert setTitle:nil];
    [anAlert setMessage:@"Do you want to remove the recorded sound?"];
    [anAlert setDelegate:self];
    [anAlert addButtonWithTitle:@"Yes"];
    [anAlert addButtonWithTitle:@"No"];
    [anAlert show];
}
-(void)showSavingAlert{
    UIAlertView *anAlert = [[UIAlertView alloc] init];
    anAlert.tag=201;
    [anAlert setTitle:nil];
    [anAlert setMessage:@"Do you want to save the recorded sound?"];
    [anAlert setDelegate:self];
    [anAlert addButtonWithTitle:@"Yes"];
    [anAlert addButtonWithTitle:@"No"];
    [anAlert show];
}
-(void)deleteAudioFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSError *error;
    [fileManager removeItemAtURL:self.audioFileURL error:&error];
}

- (void)updateProgress
{
    float timeLeft = self.audioPlayer.currentTime/self.audioPlayer.duration;
    // upate the UIProgress
    self.audioProgress.progress= timeLeft;
}
-(void)showElapsedTimeIndicator{
    self.elapsedTimeIndicatorTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                                      target:self
                                                                    selector:@selector(updateElapsedTime)
                                                                    userInfo:nil
                                                                     repeats:YES];
    
}
- (void)updateElapsedTime{
    
    _elapsedTime += 1;
    double seconds = fmod(_elapsedTime, 60.0);
    double minutes = fmod(trunc(_elapsedTime / 60.0), 60.0);
    double hours = trunc(_elapsedTime / 3600.0);
    self.elapsedTimeIndicator.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%02.0f", hours, minutes, seconds];
}
-(void)saveAudioFile{
    
}

#pragma mark Delegate Handling
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
    self.isAudioPlaying=NO;
    self.isAudioRecording=NO;
    self.audioProgress.hidden=YES;

}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==200) {
        if (buttonIndex == 0) {
            [self audioPlayingStop];
            [self deleteAudioFile];
        }
    }
    else if (alertView.tag==201)
    {
        if (buttonIndex == 0) {
            [self saveAudioFile];
        }
    }
}
#pragma mark -

@end
