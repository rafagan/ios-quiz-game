//
//  GameViewController.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController
{
    AVAudioPlayer *sfxRight, *sfxError;
}

@property (weak, nonatomic) IBOutlet UIButton *answerOne;
@property (weak, nonatomic) IBOutlet UIButton *answerTwo;
@property (weak, nonatomic) IBOutlet UIButton *answerThree;
@property (weak, nonatomic) IBOutlet UIButton *answerFour;
@property (weak, nonatomic) IBOutlet UILabel *question;

@property (weak, nonatomic) IBOutlet UIScrollView *answersScroll;
@property (weak, nonatomic) IBOutlet UIScrollView *questionScroll;
- (IBAction)OnSwipe:(id)sender;

@end
