//
//  UsersDataModel.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 10/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import "UsersDataModel.h"
#import "UPIViewController.h"

@implementation UsersDataModel

/*NB: This data model is only a proof of concept:
 ideally, it would access the data extracted from the users database and prepare
 it for it to be displayed in the table view, but unfortunately, despite several attempts,
 I couldn't find a way to achieve this before the deadline. However, I will keep trying to find
 solutions to this, as well as for a few other lacks in this application.
 Thus, the data displayed in the table will only be an example of how the app should display it once finished.
*/

//Init method in which we will write all of our users data

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.usersArray = [NSMutableArray array];
        Users *ID000333 = [[Users alloc] init]; //Creation of an object corresponding to the ID Code "000333"
        //Definition of all the object's properties
        //Data to be extracted from the database
        ID000333.userName = @"Max";
        ID000333.userName = @"Williams";
        ID000333.userAge = @"12";
        ID000333.ID = @"ID";
        ID000333.userID= @"000333";
        ID000333.userDate = @"11-01-2018 14:27";
        //Data that was supposed to be recorded from the trial compleated by the user
        ID000333.userReactionTime = @"442 ms";
        ID000333.userMovementTime = @"892 ms";
        ID000333.userPathLength = @"123";
        ID000333.userMotorSkills = @"Normal"; //This user's motor skills are defined as "normal" in comparison to the ideal performance
        
        Users *ID537849 = [[Users alloc] init];
        ID537849.userName = @"Helen";
        ID537849.userName = @"Taylor";
        ID537849.userAge = @"15";
        ID537849.ID = @"ID";
        ID537849.userID= @"537849";
        ID537849.userDate = @"10-01-2018 12:15";
        ID537849.userReactionTime = @"405 ms";
        ID537849.userMovementTime = @"850 ms";
        ID537849.userPathLength = @"128";
        ID537849.userMotorSkills = @"Normal";
        
        Users *ID132435 = [[Users alloc] init];
        ID132435.userName = @"Michael";
        ID132435.userName = @"Johnson";
        ID132435.userAge = @"11";
        ID132435.ID = @"ID";
        ID132435.userID= @"132435";
        ID132435.userDate = @"06-01-2018 10:24";
        ID132435.userReactionTime = @"538 ms";
        ID132435.userMovementTime = @"1340 ms";
        ID132435.userPathLength = @"135";
        ID132435.userMotorSkills = @"Medium";
        
        Users *ID456778 = [[Users alloc] init];
        ID456778.userName = @"Alex";
        ID456778.userName = @"Fielding";
        ID456778.userAge = @"12";
        ID456778.ID = @"ID";
        ID456778.userID= @"456778";
        ID456778.userDate = @"05-01-2018 21:10";
        ID456778.userReactionTime = @"433ms";
        ID456778.userMovementTime = @"876 ms";
        ID456778.userPathLength = @"124";
        ID456778.userMotorSkills = @"Medium";
        
        [self.usersArray addObject:ID000333]; //Index 0
        [self.usersArray addObject:ID537849]; //Index 1
        [self.usersArray addObject:ID132435]; //Index 2
        [self.usersArray addObject:ID456778]; //Index 3
        
        
    }
    return self;
}

@end
