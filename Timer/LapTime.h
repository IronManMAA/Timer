//
//  LapTime.h
//  Timer
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LapTime : NSObject

//- (instancetype)initWithColor:(NSString *)color andNumber:(NSUInteger)number;
- (instancetype)initWithNumber:(NSString *)number;

- (instancetype)initWithRandomBet;
- (NSString *)betText;

@end
