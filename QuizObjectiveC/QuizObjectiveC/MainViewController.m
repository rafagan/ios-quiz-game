//
//  MainViewController.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "MainViewController.h"
#import "CreditsViewController.h"
#import "GameViewController.h"
#import "DataSource.h"

@interface MainViewController ()

@end

@implementation MainViewController

static BOOL musicStarted = NO;

@synthesize highScore;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        srand((unsigned int)time(NULL));
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSInteger tmp = [DataSource getMe].highScore.value;
    highScore.text = [NSString stringWithFormat:@"%ld",(long)tmp];
    
    if(musicStarted) {
        [[DataSource getMe].music.me setVolume:1];
        return;
    }
    
    [[DataSource getMe].music.me play];
    musicStarted = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTouchCredits:(id)sender {
    CreditsViewController *tela = [[CreditsViewController alloc] init];
    [tela setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:tela animated:YES completion:nil];
}

- (IBAction)OnTouchUpStart:(id)sender {
    [[DataSource getMe].music.me setVolume:0.1];
    
    GameViewController *tela = [[GameViewController alloc] init];
    [tela setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:tela animated:YES completion:nil];
}
@end
