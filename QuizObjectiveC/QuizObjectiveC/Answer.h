//
//  Answer.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject

@property (nonatomic,strong) NSString *content;

+ (Answer*) createWithContent:(NSString*)answer;

@end
