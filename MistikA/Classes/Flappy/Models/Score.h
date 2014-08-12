//
//  Score.h
//  spritybird
//
//  Created by Alexis Creuzot on 16/02/2014.
//  Copyright (c) 2014 Alexis Creuzot. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBestScoreKey @"BestScore"
#define kTotalScoreKey @"TotalScore"
#define kTotalScoreLimit 369

@interface Score : NSObject

+ (void) registerScore:(NSInteger) score;
+ (void) setBestScore:(NSInteger) bestScore;
+ (NSInteger) bestScore;
+ (void)addToTotalScore:(NSInteger)score;
+ (NSInteger)totalScore;
+ (void)resetTotalScore;

@end
