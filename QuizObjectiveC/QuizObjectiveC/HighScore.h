//
//  HighScore.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighScore : NSObject

@property (nonatomic) NSInteger value;

- (BOOL)setNewHighScore:(NSInteger)newValue;

@end
