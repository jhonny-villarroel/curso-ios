//
//  ViewController.m
//  ejemploSegue
//
//  Created by test on 4/10/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
} - (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SecondViewController * nextView = [segue destinationViewController];
    nextView._textToShow = self.textFileText.text;
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
  if ([[self.textFileText text] isEqualToString:@"jhonny"] &&
      [[self.textFieldPasswd text] isEqualToString:@"jhonny"]){
      return YES;
  }else{
      UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Login Paswd Incorrect" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
      [alert show];
      return NO;
    
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
