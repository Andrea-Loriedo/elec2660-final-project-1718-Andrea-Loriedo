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
    //These are instance variables, != properties, although the properties below have the same name
    //They hold information about the various attributes of an object (in this case the user profile)
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

@property (retain, nonatomic) IBOutlet UILabel *status; //A label indicating when a new profile has been created (or not) and when a profile has been loaded (or not)
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker; //A picker view allowing the user to select the current date and time


- (IBAction)saveNewProfile:(id)sender; //A method that saves new user profile details in the users table in our SQL database
- (IBAction)loadProfile:(id)sender; //A method that retrieves a user's details from an input IDCode


- (IBAction)backgroundPressed:(id)sender; //Method that triggers an action when the view background is pressed

@end

