//
//  PageViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 19/11/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "PageViewController.h"
#import "InstructionsViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController{
    NSArray *instructions; // Creates an array to store the instructions
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    instructions = @[@"Instructionspage1.png",@"Instructionspage2.png",@"Instructionspage3.png",@"Instructionspage4.png"];
    self.dataSource = self;
    
    InstructionsViewController *initialValue = (InstructionsViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObjects:initialValue, nil];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//helper method
-(UIViewController *) viewControllerAtIndex:(NSUInteger)index{
    InstructionsViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionsViewController"];
  
    viewController.storeImage = instructions[index];
    viewController.pageIndex = index;
    
    return viewController;
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

@end
