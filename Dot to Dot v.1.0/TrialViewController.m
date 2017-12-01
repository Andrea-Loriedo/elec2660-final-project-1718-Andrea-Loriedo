//
//  TrialViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TrialViewController.h"

@interface TrialViewController ()

@end

@implementation TrialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    
    [self.view addGestureRecognizer:gestureRecognizer];
    _dot1.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//cf StackOverflow
- (void)handleDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    UIView *draggedView = [self.view hitTest:point withEvent:nil];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if ([draggedView isKindOfClass:[UIButton class]] && !self.StartButton) {
            self.StartButton = (UIButton *)draggedView;
            NSLog(@"startButton Drag Enter: %ld", (long)self.StartButton.tag);
            
            // send enter event to your button
            [self.StartButton sendActionsForControlEvents:UIControlEventTouchDragEnter];
            _dot1.hidden = NO;
        }
        
        if (self.StartButton && ![self.StartButton isEqual:draggedView]) {
            NSLog(@"startButton Drag Exit: %ld", (long)self.StartButton.tag);
            
            // send exit event to your button
            [self.StartButton sendActionsForControlEvents:UIControlEventTouchDragExit];
            self.StartButton = nil;
        }
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.StartButton = nil;
    }
    /*if ([draggedView isKindOfClass:[UIButton class]] && !self.dot1) { //dot1
        self.dot1 = (UIButton *)draggedView;
        NSLog(@"dot1 Drag Enter: %ld", (long)self.dot1.tag);
        
        // send enter event to your button
        [self.dot1 sendActionsForControlEvents:UIControlEventTouchDragEnter];
    }
    
    if (self.dot1 && ![self.dot1 isEqual:draggedView]) {
        NSLog(@"dot1 Drag Exit: %ld", (long)self.dot1.tag);
        
        // send exit event to your button
        [self.dot1 sendActionsForControlEvents:UIControlEventTouchDragExit];
        self.dot1 = nil;
    }
      else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
      self.dot1= nil;
  } */
}

 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

*/
- (IBAction)startButtonDragged:(id)sender {
}
@end
    
