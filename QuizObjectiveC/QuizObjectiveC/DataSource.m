//
//  DataSource.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "DataSource.h"
#import "Question.h"

@implementation DataSource

@synthesize questions,highScore,playerScore,music;
static DataSource *datasource;

+(DataSource *)getMe
{
    static DataSource *datasource  = nil;
    if (!datasource) {
        datasource = [[super allocWithZone:nil]init];
        datasource.HighScore = [[HighScore alloc]init];
        datasource.music = [[GameMusic alloc]init];
    }
    return datasource;
}

+(id)allocWithZone:(NSZone *)zone
{
    return datasource;
}

- (id)init
{
    self = [super init];
    if (self) {
        playerScore = [[Score alloc]init];
        questions = [[NSMutableArray alloc]init];
        NSArray* answers = [[NSArray alloc]initWithObjects:
                            @"Metódo de instância e método de classe",
                            @"Método de classe e método de instância",
                            @"Método de cópia e método de implementação",
                            @"Método de interface e método de implementação", nil];
        [questions addObject:[Question createWithContent:@"\nOs métodos precedidos por + e - correspondem, respectivamente, a:"
                                              andAnswers:answers withCorrectAnswerId:1]];
        
        answers = [[NSArray alloc]initWithObjects:
                   @"Para declarar uma propriedade",
                   @"Para sintetizar um método",
                   @"Para sobrescrever um método herdado pela classe pai",
                   @"Para sintetizar uma propriedade", nil];
        [questions addObject:[Question createWithContent:@"\nPara que\nserve a tag @synthesize?"
                                              andAnswers:answers withCorrectAnswerId:3]];
        
        answers = [[NSArray alloc]initWithObjects:
                   @"Automatic Reference Counting",
                   @"Aromatic Reference Counting",
                   @"Automatic Resize Counter",
                   @"Autoresizable Respawn Countable", nil];
        [questions addObject:[Question createWithContent:@"\nQual é o significado da sigla ARC?"
                                              andAnswers:answers withCorrectAnswerId:0]];
        
        answers = [[NSArray alloc]initWithObjects:
                   @"Ambas são Orientadas a objetos",
                   @"Ambas são um superset da linguagem C",
                   @"Ambas não possuem Garbage Collection",
                   @"Nenhuma das duas possui Garbage Collection", nil];
        [questions addObject:[Question createWithContent:@"\nQual alternativa abaixo não representa uma semelhança entre a linguagem Objective-C e a linguagem C++?"                   andAnswers:answers withCorrectAnswerId:3]];
        
        answers = [[NSArray alloc]initWithObjects:
                   @"1997, NeXT",
                   @"1998, NeXT",
                   @"1997, Apple",
                   @"1997, IBM", nil];
        [questions addObject:[Question createWithContent:@"\nQuando e qual empresa foi responsável pela adesão do Objective-C como linguagem de programação oficial da Apple?"                   andAnswers:answers withCorrectAnswerId:0]];
    }
    return self;
}

@end
