//
//  TableViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 8/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[UsersDataModel alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section {
    return 1; //There is only one section in our table view, and it's the one containing all the users IDs and the corresponding data
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    NSInteger numberOfRows = 0;
    
    if ( section == 0) {
        numberOfRows = self.data.usersArray.count; //The table will contain as many rows as the number of elements in the users array
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 0){
        
        Users *tempUsers = [self.data.usersArray objectAtIndex:indexPath.row]; //Temporary object to set the cell properties
        
        cell.textLabel.text = tempUsers.ID; //The "text" label in the cell will display the string "ID'
        cell.detailTextLabel.text = tempUsers.userID; //The "detail" label in the cell will display the User ID and the corresponding data when clicked
        
    }
    
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"ShowResultsData"]){
        
        ResultsViewController *destinationViewController = [segue destinationViewController];
        
        NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
        
        if (indexpath.section == 0){
            
            Users *tempUsers = [self.data.usersArray objectAtIndex:indexpath.row];
            destinationViewController.users = tempUsers;
            
        }
        
    }
    
}


@end
