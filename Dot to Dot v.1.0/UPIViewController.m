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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundPressed:(id)sender { //hides the keyboard when the background is pressed
    if([self.nameTextField isFirstResponder]){
       [self.nameTextField resignFirstResponder];
    }
    if([self.surnameTextField isFirstResponder]){
       [self.surnameTextField resignFirstResponder];
    }
    if([self.ageTextField isFirstResponder]){
       [self.ageTextField resignFirstResponder];
    }
    if([self.idCodeTextField isFirstResponder]){
       [self.idCodeTextField resignFirstResponder];
    }
}
@end
