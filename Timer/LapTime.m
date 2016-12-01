//
//  LapTime.m
//  Timer
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "LapTime.h"


@implementation LapTime



{
    NSString *_color;
    //    NSUInteger _number;
    NSString *_number;
}


//- (instancetype)initWithColor:(NSString *)color andNumber:(NSUInteger)number
- (instancetype)initWithNumber:(NSString *)number
{
    self = [super init];
    if (self)
    {
        //        _color = color;
        _number = number;
        
     }
    return self;
}


- (instancetype)initWithRandomBet
{
    self = [super init];
    if (self)
    {
        //        int randomColor = arc4random() % 2;
        //        NSString *color = (randomColor == 0) ? @"red" : @"black";
        //        _color = color;
        //        _number = arc4random() % 39;
 
        int randomNumber=0;
        NSMutableArray *checker = [[NSMutableArray alloc] init];
        NSString *rn;
        for(int i = 0 ; i < 6 ; i++){
            randomNumber = arc4random() % 53 + 1;
            rn=[NSString stringWithFormat:@"%i", randomNumber];
            BOOL contains = [checker containsObject:rn];
            if (contains) { i=i-1; }
            else { [checker addObject:rn];}
            // NSLog(@"random number %@", rn);
        }
        NSString * stringToDisplay = [checker componentsJoinedByString:@"-"];
        _number = stringToDisplay;

        //self.currentTimerValue
//        NSString * stringToDisplay = TimerViewController.timeLabel.text;
//        _number = stringToDisplay;
        
    }
    return self;

}


- (NSString *)betText
{
    //    return [NSString stringWithFormat:@"%ld %@", (long)_number, _color];
    
    return [NSString stringWithFormat:@"%@", _number];
    
}

@end




