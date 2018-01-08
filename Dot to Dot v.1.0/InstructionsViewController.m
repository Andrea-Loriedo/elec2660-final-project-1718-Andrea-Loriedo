//
//  InstructionsViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 19/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.instructionsImages.image = [UIImage imageNamed: self.storeImage]; //Sets the images stored in the 'storeImage' property as the set of images to be displayed in the Image View as soon as the view loads. Here the image names are passed to the instructionsImages.image object.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
