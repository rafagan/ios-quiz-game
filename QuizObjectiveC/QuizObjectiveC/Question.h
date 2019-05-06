//
//  Question.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSArray *answers;
@property (nonatomic) NSInteger correctAnswer;
@property (nonatomic) NSInteger questionId;

+ (Question*)createWithContent:(NSString*)content
                    andAnswers:(NSArray*)answers
           withCorrectAnswerId:(NSInteger)correctAnswer;

- (BOOL)alreadAnswered;
- (void)setAnswered;
- (BOOL)rightAnswer:(NSInteger)answer;

@end