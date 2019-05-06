//
//  Question.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "Question.h"

@implementation Question

static NSInteger idGenerator = 0;
static NSMutableArray* repeated = nil;

@synthesize content,answers,correctAnswer;

+ (Question*)createWithContent:(NSString*)_content
                    andAnswers:(NSArray*)_answers
           withCorrectAnswerId:(NSInteger)_correctAnswer {
    Question* question = [[Question alloc]init];
    
    question.questionId = idGenerator++;
    question.content = _content;
    question.answers = _answers;
    question.correctAnswer = _correctAnswer;
    
    if(repeated == nil)
        repeated = [[NSMutableArray alloc]init];
    [repeated addObject:[NSNumber numberWithBool:NO]];
    
    return question;
}

- (BOOL)alreadAnswered {
    return [repeated[self.questionId] boolValue];
}

- (void)setAnswered {
    repeated[self.questionId] = [NSNumber numberWithBool:YES];
}

- (BOOL)rightAnswer:(NSInteger)answer {
    return self.correctAnswer == answer;
}

@end
