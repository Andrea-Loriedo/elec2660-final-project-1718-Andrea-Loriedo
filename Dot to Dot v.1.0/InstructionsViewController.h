//
//  InstructionsViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 19/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *instructionsImages; //UIImageView for the images showing the trial instructions
@property (weak, nonatomic) IBOutlet UIButton *startTrialButton; //UIButton linking the instructions view to the user personal information view


@property NSString *storeImage; // Property of type NSString that will store the image names
@property NSUInteger pageIndex; //Integer acting as an index to number the istructions page

@end
