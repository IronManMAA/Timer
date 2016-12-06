//
//  ViewController.m
//  Timer
//
//  Created by Marco Almeida on 11/14/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "TimerViewController.h"
#import "SetTimerViewController.h"
#import "LapTime.h"

@interface TimerViewController () <TimeSetDelegate>


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
// IBOutlet is used to change the attributes of the label object e.g. size, color, location, etc.
// IBAction is used to define actions or handle content. We use methods for this.
@property (assign) NSInteger currentTimerValue;
@property (assign) NSInteger originalTimerValue;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSMutableArray *bets;
@property (nonatomic) NSMutableArray *timelaps;
@property (weak, nonatomic) IBOutlet UITableView *bettingTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *betPickerView;
@property (weak, nonatomic) IBOutlet UILabel *spinLabel;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any initiolize and additional setup after loading the view, typically from a nib.
    
    self.currentTimerValue = 0;
    self.originalTimerValue = 0;
    self.bets = [[NSMutableArray alloc] init];
    self.timelaps = [[NSMutableArray alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action  Handlers

- (IBAction)startTimer:(UIButton *)sender
{
if (!self.timer)
    {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
    selector:@selector(timerFired) userInfo:nil repeats: YES];
    }
    else
    {
        [self.timer invalidate];
        self.timer = nil;
        // stop timer and set it to nothing
    }
}

- (IBAction)stopTimer:(UIButton *)sender
{
    [self.timer invalidate];
    self.timer = nil;
    // stop timer and set it to nothing

}

//- (IBAction)LapTime:(UIButton *)sender
//{
/// get time place in table view
/// keep timer running
    
//    self.timeLabel.text = [NSString stringWithFormat:@"%ld secs",(long)self.currentTimerValue];

    
//}

- (IBAction)LapTime:(UIButton *)sender
{
    // These two lines are logically equivalent to the combined line at 91
    //    Bet *aBet = [[Bet alloc] initWithRandomBet];
    //    [self.bets addObject:aBet];
    
//    [self.bets addObject:[[LapTime alloc] initWithRandomBet]];

// bets;
    [self.bets addObject:[NSString stringWithFormat:@"%ld secs",(long)self.currentTimerValue]];
    [self.bettingTableView reloadData];

}


- (IBAction)resetTimer:(UIButton *)sender
    {
        [self.timer invalidate];
        self.timer = nil;
        self.currentTimerValue = 0;
        self.timeLabel.text = [NSString stringWithFormat:@"%ld secs",(long)self.currentTimerValue];
    }


#pragma mark - Time set delegate
- (void) timeValueWasChosen:(NSInteger)timeValue
{
    self.originalTimerValue = timeValue;
    if (self.timer)
    {
        // if self timer value exist, stop timer
        [self.timer invalidate];
        self.timer = nil;
    }
    self.currentTimerValue =self.originalTimerValue;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld sec",(long)self.currentTimerValue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
if ([segue.identifier isEqualToString:@"SetTimeSeque"])
   {
       SetTimerViewController *setTimerVC=[segue destinationViewController];
       setTimerVC.delegate=self;
   }
}


#pragma mark - Misc.
    
-(void)timerFired
{
        self.currentTimerValue = self.currentTimerValue +1;
        self.timeLabel.text = [NSString stringWithFormat:@"%ld secs",(long)self.currentTimerValue];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LapTimeCell" forIndexPath:indexPath];
    
// Configure the cell...
    
    NSString *aBet = self.bets[indexPath.row];



    cell.textLabel.text = aBet;
    
    
// NSLog(@"random number %ld",(long)self.currentTimerValue);
// NSString *m=[NSString stringWithFormat:@"%@",cell.textLabel.text];
// NSLog(@"random number %@",m);
    
    return cell;
}





@end
