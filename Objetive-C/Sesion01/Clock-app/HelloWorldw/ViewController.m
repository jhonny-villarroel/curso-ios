//
//  ViewController.m
//  HelloWorldw
//
//  Created by test on 4/8/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myB;

@end

@implementation ViewController


- (IBAction)startClock:(UIButton *)sender {

    [self checkTime:self];
}
- (IBAction)stopClock:(UIButton *)sender {
    
    NSLog(@"Hello World");
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(checkTime:) object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) checkTime:(id) sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm:ss a"];
    
    [self.myLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(checkTime:) withObject:nil afterDelay:1.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
