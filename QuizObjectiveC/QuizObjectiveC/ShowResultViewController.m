//
//  ShowResultViewController.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "ShowResultViewController.h"
#import "MainViewController.h"
#import "DataSource.h"

@interface ShowResultViewController ()

@end

@implementation ShowResultViewController
@synthesize highScore,currentScore;

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
    NSInteger scr = [DataSource getMe].playerScore.value;
    [[[DataSource getMe] init] questions]; //Só pra ficar sem warn
    NSInteger hscr = [DataSource getMe].highScore.value;
    
    if(scr > hscr){
        [highScore setTextColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:1]];
        self.hiScoreImg.image = [UIImage imageNamed: @"GreenHighscore.png"];
        [[DataSource getMe].highScore setNewHighScore:scr];
    } else {
        [highScore setTextColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:1]];
        self.hiScoreImg.image = [UIImage imageNamed: @"RedHighscore.png"];
    }
    
    hscr = [DataSource getMe].highScore.value;
    highScore.text = [NSString stringWithFormat:@"%ld",(long)hscr];
    currentScore.text = [NSString stringWithFormat:@"%ld",(long)scr];
    [[DataSource getMe].music.me setVolume:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTouchBackToMenu:(id)sender {
    MainViewController *tela = [[MainViewController alloc] init];
    [tela setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:tela animated:YES completion:nil];
}
@end
