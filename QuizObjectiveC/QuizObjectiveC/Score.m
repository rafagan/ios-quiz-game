//
//  Score.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "Score.h"

@implementation Score
@synthesize value;

- (id)init
{
    self = [super init];
    if (self) {
        self.value = 0;
    }
    return self;
}

@end
