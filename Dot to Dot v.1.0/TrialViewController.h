//
//  TrialViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *StartButton;
@property (weak, nonatomic) IBOutlet UIButton *dot1;

- (IBAction)startButtonDragged:(id)sender;
- (IBAction)startButtonPressed:(id)sender;

@end
