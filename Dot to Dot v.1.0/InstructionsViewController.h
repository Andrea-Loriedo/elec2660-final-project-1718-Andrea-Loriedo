//
//  InstructionsViewController.h
//  Dot to Dot v.1.0
//
//  Created by Andrea on 19/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *instructionsImages;

@property NSString *storeImage;
@property NSUInteger pageIndex;

@end
