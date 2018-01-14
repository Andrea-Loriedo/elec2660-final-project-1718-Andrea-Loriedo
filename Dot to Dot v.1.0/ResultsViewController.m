//
//  ResultsViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 11/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Replacing the view labels with the data from the data model
    
    self.idCodeLabel.text = self.users.userID;
    self.nameLabel.text = self.users.userName;
    self.surnameLabel.text = self. users.userSurname;
    self.ageLabel.text = self.users.userAge;
    self.dateLabel.text = self.users.userDate;
    self.reactionTimeLabel.text = self.users.userReactionTime;
    self.movementTimeLabel.text = self.users.userMovementTime;
    self.pathLengthLabel.text = self.users.userPathLength;
    self.motorSkillsLabel.text = self.users.userMotorSkills;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
