//
//  TableViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 8/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsersDataModel.h"
#import "ResultsViewController.h"

@interface TableViewController : UITableViewController

@property (strong, nonatomic) UsersDataModel *data; //Property to reference the Users DataModel in this View Controller

@end
