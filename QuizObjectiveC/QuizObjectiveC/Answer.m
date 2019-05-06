//
//  Answer.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "Answer.h"

@implementation Answer

@synthesize content;

+ (Answer*) createWithContent:(NSString*)_answer
{
    Answer* answer = [[Answer alloc]init];
    answer.content = _answer;
    return answer;
}

@end
