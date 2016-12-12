//
//  ZDManagerController.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 16/2/2.
//  Copyright © 2016年 Fate.D.Bourne. All rights reserved.
//

#import "ZDManagerController.h"

@interface ZDManagerController ()

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ZDManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configuration

- (void)setup {
    
}

#pragma mark - Property

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"Line", @"Circle", @"Tag", @"Hover"];
    }
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[self viewcontrollerWithIdentifier:@"LineCollectionViewController"] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[self viewcontrollerWithIdentifier:@"CircleCollectionViewController"] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[self viewcontrollerWithIdentifier:@"TagCollectionViewController"] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[self viewcontrollerWithIdentifier:@"HoverCollectionViewController"] animated:YES];
            break;
        default:
            break;
    }
}

#pragma mark - Private Method

- (__kindof UIViewController *)viewcontrollerWithIdentifier:(NSString *)identifier {
    if (!identifier || [identifier length] == 0) {
        return nil;
    }
    UIViewController *viewcontroller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:identifier];
    return viewcontroller;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
