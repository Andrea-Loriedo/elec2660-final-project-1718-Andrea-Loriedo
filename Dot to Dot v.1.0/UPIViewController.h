//
//  ViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 18/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField; //UITextField for the user to enter his name
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField; //UITextField for the user to enter his surname
@property (weak, nonatomic) IBOutlet UITextField *ageTextField; //UITextField for the user to enter his age
@property (weak, nonatomic) IBOutlet UITextField *idCodeTextField; //UITextField for the user/researcher to enter the ID Code



- (IBAction)backgroundPressed:(id)sender; //Method that triggers and action when the view background is pressed

@end

