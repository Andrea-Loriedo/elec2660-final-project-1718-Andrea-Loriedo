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
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0]; //Store the directory in docsDir
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"users.db"]];
    
    //Creates an NSFileManager instance and subsequently uses it to detect if the database file already exists
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String]; //If the database path doesn't exist yet, it will be converted to a UTF-8 string and then created
        
        if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK) //If the database path already exists...
        {
            char *errMsg;
            
            //This SQL statement creates a table in the users database, each row containing name, surname, age, and ID Code of the user (those are of type TEXT)
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS USERS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, SURNAME TEXT, AGE TEXT, IDCODE TEXT)";

            //If database, table, and statement are set properly, the SQL statement is executed and the database is closed
            if (sqlite3_exec(userDataBase, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                status.text = @"Failed to create table";
            }
            
            sqlite3_close(userDataBase);
            
        } else {
            status.text = @"Failed to open/create database";
        }
    }
    
    [super viewDidLoad];
}


 - (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.name = nil;
    self.surname = nil;
    self.age = nil;
    self.IDCode = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNewProfile:(id)sender {
    
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO USERS (name, surname, age, IDCode) VALUES (\"%@\", \"%@\", \"%@\", \"%@\")", name.text, surname.text, age.text, IDCode.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(userDataBase, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            status.text = @"New user added";
            name.text = @"";
            surname.text = @"";
            age.text = @"";
            IDCode.text = @"";
        } else {
            status.text = @"Failed to add user";
        }
        sqlite3_finalize(statement);
        sqlite3_close(userDataBase);
    }
    
}

- (IBAction)loadProfile:(id)sender {
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &userDataBase) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name, surname, age FROM users WHERE IDCode =\"%@\"", IDCode.text];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(userDataBase, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                status.text = @"User profile found";
                
                NSString *nameField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                name.text = nameField;
                
                NSString *surnameField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                surname.text = surnameField;
                
                NSString *ageField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                age.text = ageField;
                
                
                
            } else {
                status.text = @"User profile not found";
                name.text = @"";
                surname.text = @"";
                age.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(userDataBase);
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
@end
