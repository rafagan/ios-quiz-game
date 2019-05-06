//
//  GameViewController.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "GameViewController.h"
#import "DataSource.h"
#import "Question.h"
#import "MainViewController.h"
#import "ShowResultViewController.h"

@interface GameViewController ()
{
    Question* currentQuestion;
}

- (Question*)getRandomQuestion;
- (void)nextQuestion:(NSInteger)option;

@end;

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentQuestion = [self getRandomQuestion];
    self.question.text = currentQuestion.content;
    
    [self.answerOne setTitle:currentQuestion.answers[0] forState:UIControlStateNormal];
    [self.answerTwo setTitle:currentQuestion.answers[1] forState:UIControlStateNormal];
    [self.answerThree setTitle:currentQuestion.answers[2] forState:UIControlStateNormal];
    [self.answerFour setTitle:currentQuestion.answers[3] forState:UIControlStateNormal];
    
    self.answerOne.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answerTwo.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answerThree.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answerFour.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answerOne.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.answerTwo.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.answerThree.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.answerFour.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.question sizeToFit];
    self.question.textAlignment = NSTextAlignmentCenter;
    
    [self.answersScroll setScrollEnabled:YES];
    [self.answersScroll setContentSize:CGSizeMake(200, 300)];
    [self.questionScroll setScrollEnabled:YES];
    [self.questionScroll setContentSize:CGSizeMake(200, self.question.frame.size.height)];
    
    NSError *error;
    NSString *musicName = [[NSBundle mainBundle] pathForResource:@"Right" ofType:@"mp3"];
    NSURL *urlPath = [NSURL fileURLWithPath:musicName];
    sfxRight = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPath error:&error];
    [sfxRight setVolume:1];
    [sfxRight prepareToPlay];
    
    musicName = [[NSBundle mainBundle] pathForResource:@"Error" ofType:@"mp3"];
    urlPath = [NSURL fileURLWithPath:musicName];
    sfxError = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPath error:&error];
    [sfxError setVolume:1];
    [sfxError prepareToPlay];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTouchAnswerOne:(id)sender {
    [self nextQuestion:0];
}

- (IBAction)OnTouchAnswerTwo:(id)sender {
    [self nextQuestion:1];
}

- (IBAction)OnTouchAnswerThree:(id)sender{
    [self nextQuestion:2];
}

- (IBAction)OnTouchAnswerFour:(id)sender{
    [self nextQuestion:3];
}

- (Question*)getRandomQuestion {
    Question* result;
    NSMutableArray* questions = [DataSource getMe].questions;
    
    if(questions.count == 0) return nil;
    do {
        result = questions[rand()% questions.count];
    } while([result alreadAnswered]);
    [[DataSource getMe].questions removeObject:result];
    return result;
}

- (void)nextQuestion:(NSInteger)option {
    if ([currentQuestion rightAnswer:option] ) {
        [DataSource getMe].playerScore.value++;
        [sfxRight play];
    } else {
        [sfxError play];
    }
    
    if([[DataSource getMe].questions count] == 0)
    {
        ShowResultViewController *tela = [[ShowResultViewController alloc] init];
        [tela setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:tela animated:YES completion:nil];
    }
    
    [currentQuestion setAnswered];
    GameViewController *tela = [[GameViewController alloc] init];
    [tela setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:tela animated:YES completion:nil];
}

- (IBAction)OnSwipe:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Abandonar o jogo"
                                                    message:@"Você tem certeza que deseja sair do jogo?"
                                                   delegate:self
                                          cancelButtonTitle:@"Não"
                                          otherButtonTitles:@"Sim",nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != 1) {
        return;
    }
    
    MainViewController *tela = [[MainViewController alloc] init];
    [tela setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:tela animated:YES completion:nil];
}
@end
