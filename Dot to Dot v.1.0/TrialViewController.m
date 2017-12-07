//
//  TrialViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TrialViewController.h"

@interface TrialViewController (){
    
    NSMutableArray *values; // Array containing NSDictionary with coordinates for each button the user will navigate to
    NSInteger buttonCount; // Counts how many times the dot has been pressed
    __weak IBOutlet UIButton *button; //dot object is of type UIButton
    BOOL hasStarted;
    
}

@end

@implementation TrialViewController

@synthesize values = _value;
@synthesize button = _button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    button.hidden = YES; //Hide the button until the first touch is detected
    buttonCount = 0; // So far the button has been clicked 0 times
    values = [[NSMutableArray alloc]init]; //Initialisation of the values array

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Click:(UIButton *)sender {
}

- (IBAction)startButtonPressed:(id)sender {
    button.hidden = NO;
}


@end
