//
//  ShowResultViewController.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *highScore;
@property (weak, nonatomic) IBOutlet UILabel *currentScore;
@property (weak, nonatomic) IBOutlet UIImageView *hiScoreImg;

- (IBAction)OnTouchBackToMenu:(id)sender;
@end
