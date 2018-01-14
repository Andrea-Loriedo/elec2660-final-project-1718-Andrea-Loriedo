//
//  Users.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 10/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject

//This class contains properties for all the data that is to be displayed in the tableview

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userSurname;
@property (nonatomic, strong) NSString *userAge;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userDate;
@property (nonatomic, strong) NSString *userReactionTime;
@property (nonatomic, strong) NSString *userMovementTime;
@property (nonatomic, strong) NSString *userPathLength;
@property (nonatomic, strong) NSString *userMotorSkills;

@end
