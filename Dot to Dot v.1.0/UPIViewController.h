//
//  ViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 18/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

//Some basic SQL skills were learnt thanks to this techotopia.com page: http://www.techotopia.com/index.php/IOS_4_iPhone_Database_Implementation_using_SQLite#What_is_SQLite.3F

@interface UPIViewController : UIViewController {
    UITextField *name;
    UITextField *surname;
    UITextField *age;
    UITextField *IDCode;
    UIDatePicker *date;
    UILabel *status;
    NSString *databasePath;
    
    sqlite3 *userDataBase;
}


@property (retain, nonatomic) IBOutlet UITextField *name; //UITextField for the user to enter his name
@property (retain, nonatomic) IBOutlet UITextField *surname; //UITextField for the user to enter his surname
@property (retain, nonatomic) IBOutlet UITextField *age; //UITextField for the user to enter his age
@property (retain, nonatomic) IBOutlet UITextField *IDCode; //UITextField for the user/researcher to enter the ID Code
- (IBAction)date:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


- (IBAction)saveNewProfile:(id)sender;
- (IBAction)loadProfile:(id)sender;


- (IBAction)backgroundPressed:(id)sender; //Method that triggers and action when the view background is pressed

@end

