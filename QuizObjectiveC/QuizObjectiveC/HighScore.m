//
//  HighScore.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "HighScore.h"

@implementation HighScore
@synthesize value;

- (id)init
{
    self = [super init];
    if (self) {
        self.value = 0;
    }
    return self;
}

- (BOOL)setNewHighScore:(NSInteger)newValue
{
    if(newValue > self.value) {
        self.value = newValue;
        return YES;
    }
    
    return NO;
}

@end