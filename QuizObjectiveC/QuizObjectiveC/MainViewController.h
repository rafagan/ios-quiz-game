//
//  MainViewController.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *highScore;

- (IBAction)OnTouchCredits:(id)sender;
- (IBAction)OnTouchUpStart:(id)sender;

@end
