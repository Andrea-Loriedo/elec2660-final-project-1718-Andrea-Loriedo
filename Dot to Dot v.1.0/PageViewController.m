//
//  PageViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 19/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "PageViewController.h"
#import "InstructionsViewController.h"
#import "TrialViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController{
    NSArray *instructions; // Creates an array to store the instructions
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Adding the image names to the instructions array
    instructions = @[@"Instructionspage1.png",@"Instructionspage2.png",@"Instructionspage3.png",@"startTrial"];
    
    self.dataSource = self; //Setting the controller as the data source
    
    InstructionsViewController *initialValue = (InstructionsViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObjects:initialValue, nil];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//helper method
-(UIViewController *) viewControllerAtIndex:(NSUInteger)index{
    InstructionsViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionsViewController"];
    //Instantiating the instructions view controller using its identifier
  
    viewController.storeImage = instructions[index]; //Passing the instructions array index values to the storeImage property
    viewController.pageIndex = index; //Defining the integer pageIndex as the current index value
    
    return viewController; //Returns te view controller associated with the "InstructionsViewController" identifier string
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((InstructionsViewController *) viewController).pageIndex;
    
    if (index == 0 || index == NSNotFound){
    return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerAfterViewController:(UIViewController *)viewController {
            NSUInteger index = ((InstructionsViewController *) viewController).pageIndex;
    if (index == NSNotFound){
        
        return nil;
}
    index++;
    if (index == instructions.count){ //if the index is equal to the number of elements in the array
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 /*    if ([[segue identifier]isEqualToString:@"ShowTrialView"]) {
         
     TrialViewController *destinationViewController = [segue destinationViewController];
     }
     
 

     @end */
 }

@end
     
