//
//  SecondViewController.h
//  ejemploSegue
//
//  Created by test on 4/10/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lableShowData;
@property (strong, nonatomic) NSString *_textToShow;
@end
