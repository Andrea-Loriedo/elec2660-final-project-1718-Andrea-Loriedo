//
//  ViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 18/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *idCodeTextField;



- (IBAction)backgroundPressed:(id)sender;

@end

