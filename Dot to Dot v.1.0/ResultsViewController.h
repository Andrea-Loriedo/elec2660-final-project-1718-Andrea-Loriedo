//
//  ResultsViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 11/1/18.
//  Copyright © 2018 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Users.h"

@interface ResultsViewController : UIViewController

//Properties for the labels that will be replaced with the data pushed from the data model when the app is working

@property (weak, nonatomic) IBOutlet UILabel *idCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *surnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *reactionTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *movementTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pathLengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *motorSkillsLabel;

@property (strong, nonatomic) Users *users;

@end
