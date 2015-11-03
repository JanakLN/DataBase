//
//  AllDataVC.m
//  DataBase
//
//  Created by Ketan Raval on 03/11/15.
//  Copyright © 2015 zetrixweb. All rights reserved.
//

#import "AllDataVC.h"
#import "Database.h"
static NSString *CellIdentifier = @"AllDataCC";
@implementation AllDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    allData = [[NSMutableArray alloc] init];
    allData=[[Database shareDatabase] SelectAllFromTable:@"select * from emp"];
    NSLog(@"%@",allData);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure Cell
    UILabel *label1 = (UILabel *)[cell.contentView viewWithTag:1];
    [label1 setText:[NSString stringWithFormat:@"%@", [[allData valueForKey:@"name"] objectAtIndex:indexPath.row]]];
    UILabel *label2 = (UILabel *)[cell.contentView viewWithTag:2];
    [label2 setText:[NSString stringWithFormat:@"%@", [[allData valueForKey:@"email"] objectAtIndex:indexPath.row]]];
    UILabel *label3 = (UILabel *)[cell.contentView viewWithTag:3];
    [label3 setText:[NSString stringWithFormat:@"%@",[[allData valueForKey:@"num"] objectAtIndex:indexPath.row]]];
    UILabel *label4 = (UILabel *)[cell.contentView viewWithTag:4];
    [label4 setText:[NSString stringWithFormat:@"%@", [[allData valueForKey:@"sal"] objectAtIndex:indexPath.row]]];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
