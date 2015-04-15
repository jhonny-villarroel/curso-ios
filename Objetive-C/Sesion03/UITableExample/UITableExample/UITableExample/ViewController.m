//
//  ViewController.m
//  UITableExample
//
//  Created by internet on 4/14/15.
//  Copyright (c) 2015 com.jbian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray * listofUsers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    listofUsers = [[NSArray alloc] initWithObjects:@"jhonny",@"richard",@"felipe", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [listofUsers count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableId = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableId];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableId];
    }
    cell.textLabel.text = [listofUsers objectAtIndex:indexPath.row];
    return cell;

}
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Selected index %li", indexPath.row);
    
    //[self performSegueWithIdentifier:@"nextsegue" sender:self];
    
    UIAlertView * alert= [[UIAlertView alloc]initWithTitle:@"Selected Item" message:@"you selecteed an Item " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}
@end
