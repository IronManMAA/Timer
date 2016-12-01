//
//  SetTimerViewController.h
//  Timer
//
//  Created by Marco Almeida on 11/14/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerViewController.h"

@interface SetTimerViewController : UIViewController
@property (nonatomic) id<TimeSetDelegate> delegate;
//id is a bucket or container where you can place anything <> means a filter the object placed inside the id bucket must conform

@end
