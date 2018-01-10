//
//  TrialViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrialViewController : UIViewController{
    NSMutableArray *positions; // Instance variable for the NSMutableArray containing the NSDictionary with the coordinates for each position of the button the user will move to
    __weak IBOutlet UIButton *dot; //Instance variable for the dot object
    
}

@property NSMutableArray *positions; //Array of NSMutableDictionary containing the coordinates for the dot
@property (weak, nonatomic) IBOutlet UIButton *startButton; //Start button (a button using a custom image)
@property (weak, nonatomic) IBOutlet UIButton *dot; //Green dot sprite (a button using a custom image)
@property (weak, nonatomic) IBOutlet UIButton *finishButton; //Finish button (a button using a custom image)

- (IBAction)DotDragEnter:(UIButton *)sender; //Method triggered when the user slides his finger onto the dot
- (IBAction)startButtonPressed:(id)sender; //Method triggered as soon as the start button is pressed

@end
