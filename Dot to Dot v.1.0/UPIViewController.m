//
//  ViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 18/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "UPIViewController.h"

@interface UPIViewController ()

@end

@implementation UPIViewController
@synthesize name, surname, age, IDCode, status;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    date = [[UIDatePicker alloc] init]; //Initialize date picker
    date.datePickerMode = UIDatePickerModeDate;
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //Finds the application's documents directory
    
    docsDir = [dirPaths objectAtIndex:0]; //Stores the directory in a string variable called docsDir
    
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"users.db"]]; // Builds the path to the "users.db" database file
    
    
    NSFileManager *filemgr = [NSFileManager defaultManager]; //Creates an NSFileManager instance, then uses it to detect if the database file already exists
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String]; //If the database path doesn't exist yet, it will be converted to a UTF-8 character string and then created before being passed to the function to open the database
        
        if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK) //If the database path already exists...
        {
            char *errMsg;
            
            //This SQL statement creates a table in the users database, each row containing name, surname, age, and ID Code of the user (those are of type TEXT)
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS USERS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, SURNAME TEXT, AGE TEXT, IDCODE TEXT)";

            //If database, table, and statement are set properly, the SQL statement is executed and the database is closed, otherwise, the error message "Failed to create table"/"Failed to open/create database" will be displayed by the "status" label
            if (sqlite3_exec(userDataBase, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                status.text = @"Failed to create table";
            }
            
            sqlite3_close(userDataBase); //The users database is closed
            
        } else {
            status.text = @"Failed to open/create database";
        }
    }
    
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNewProfile:(id)sender {
    
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String]; //Database path conversion to a UTF-8 character string
    
    if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK)
    {
        //If the database file is opened correctly, the text will be extracted from the name, surname, age and IDcode text fields, an SQL INSERT statement will be constructed and executed, and the user information will be added as a record to the users database
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USERS (name, surname, age, IDCode) VALUES (\"%@\", \"%@\", \"%@\", \"%@\")", name.text, surname.text, age.text, IDCode.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(userDataBase, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            status.text = @"New user added";
            
        } else {
            status.text = @"Failed to add user";
        }
        sqlite3_finalize(statement);
        sqlite3_close(userDataBase);
    }
    
}

- (IBAction)loadProfile:(id)sender {
    
    const char *dbpath = [databasePath UTF8String];  //Database path conversion to a UTF-8 character string
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK)
    {
        //If the dababase path is opened correctly, a SQL SELECT statement is prepared to get the user details from the row that contains the input IDCode
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name, surname, age FROM users WHERE IDCode =\"%@\"", IDCode.text];
        
        const char *query_stmt = [querySQL UTF8String]; //
        
        if (sqlite3_prepare_v2(userDataBase, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {   //If a row of the table matching the IDCode is found, a SQLITE_ROW result is returned
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                status.text = @"User profile found"; //If a SQLITE_ROW result is returned, the status label displays this message
                
                //If a SQLITE_ROW result is returned, the name, surname and age text fields will display the user details corresponding to the input IDCode
                
                NSString *nameField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                name.text = nameField;
                
                NSString *surnameField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                surname.text = surnameField;
                
                NSString *ageField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                age.text = ageField;
                
                
            } else {
                
                status.text = @"User profile not found"; //If a SQLITE_ROW result is returned, the status label displays this message
                //The name, surname and age text fields will be empty
                name.text = @"";
                surname.text = @"";
                age.text = @"";
            }
            sqlite3_finalize(statement); //The SQL statement is finalized
        }
        sqlite3_close(userDataBase); //The users database is closed
    }
    
}

- (IBAction)backgroundPressed:(id)sender { //hides the keyboard when the background is pressed
    if([self.name isFirstResponder]){ //Switch first responder in order to hide the keyboard if the text field is the original first responder (repeat for each text field)
       [self.name resignFirstResponder];
    }
    if([self.surname isFirstResponder]){
       [self.surname resignFirstResponder];
    }
    if([self.age isFirstResponder]){
       [self.age resignFirstResponder];
    }
    if([self.IDCode isFirstResponder]){
       [self.IDCode resignFirstResponder];
    }
}
- (IBAction)date:(id)sender {
   // NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   // [formatter setDateFormat:@"dd/mm/yy"];
    NSDate *chosenDate = [self.datePicker date];
    NSLog(@"%@", [NSString stringWithFormat: @"%@", chosenDate]);
   
}
@end
