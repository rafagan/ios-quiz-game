//
//  GameMusic.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "GameMusic.h"

@implementation GameMusic
@synthesize me;

- (id)init
{
    self = [super init];
    if (self) {
        NSError *error;
        NSString *musicName = [[NSBundle mainBundle] pathForResource:@"Music" ofType:@"mp3"];
        NSURL *urlPath = [NSURL fileURLWithPath:musicName];
        me = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPath error:&error];
        [me setVolume:1];
        [me setNumberOfLoops:-1];
        [me prepareToPlay];
    }
    return self;
}

@end
