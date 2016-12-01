//
//  ViewController.h
//  Timer
//
//  Created by Marco Almeida on 11/14/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeSetDelegate
- (void) timeValueWasChosen:(NSInteger)timeValue;

@end

@interface TimerViewController : UIViewController


@end

