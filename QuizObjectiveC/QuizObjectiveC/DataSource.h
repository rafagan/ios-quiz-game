//
//  DataSource.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HighScore.h"
#import "Score.h"
#import "GameMusic.h"

@interface DataSource : NSObject
@property (nonatomic,strong) NSMutableArray* questions;
@property (nonatomic,strong) HighScore* highScore;
@property (nonatomic,strong) Score* playerScore;
@property (nonatomic,strong) GameMusic* music;

+(DataSource *)getMe;
@end
