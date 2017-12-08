//
//  TrialViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrialViewController : UIViewController

@property NSMutableArray *positions;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *dot;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;


- (IBAction)button1Click:(UIButton *)sender;
- (IBAction)startButtonPressed:(id)sender;

@end
