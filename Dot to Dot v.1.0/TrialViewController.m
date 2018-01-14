//
//  TrialViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TrialViewController.h"

@interface TrialViewController (){
    
    NSInteger buttonCount; // Counts how many times the dot has been pressed
    BOOL TrialHasStarted; //TRUE when the first dot is reached by the user / otherwise FALSE
}

@end

@implementation TrialViewController

@synthesize positions, dot; //Synthesizing these instance variables tells the compiler to automaticaly generate accessor methods for them

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    [self.view addGestureRecognizer:gestureRecognizer]; //Adds the drag gesture recognizer to the view
    
    self.finishButton.userInteractionEnabled = false; //Disables the user interaction with the "finish" button as we don't need it until the trial has finished
    self.finishButton.hidden = YES; //Hides the finish button because we don't want to display it until the end of the trial
    dot.hidden = YES; //Hide the dot until the first touch is detected
    buttonCount = 0; //So far the button has been clicked 0 times
    positions = [[NSMutableArray alloc]init]; //Initialisation of the positions array

    [self generateValuesArrayWithCoordiantes]; //Triggers the generateValuesArrayWithCoordiantes method as soon as the trial starts running
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//I couldn't quite figure out how to get the "touch drag enter" gesture to work properly, but this method found on stackoverflow.com helped.
//Complete reference: https://stackoverflow.com/questions/31916979/how-touch-drag-enter-works/31918268

- (void)handleDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    UIView *draggedView = [self.view hitTest:point withEvent:nil];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if ([draggedView isKindOfClass:[UIButton class]] && !self.dot) {
            self.dot = (UIButton *)draggedView;
            NSLog(@"Button Drag Enter: %ld", (long)self.dot.tag);
            
            //Send enter event to the dot button
            [self.dot sendActionsForControlEvents:UIControlEventTouchDragEnter];
            
        }
        
        if (self.dot && ![self.dot isEqual:draggedView]) {
            NSLog(@"Button Drag Exit: %ld", (long)self.dot.tag);
            
            //Send exit event to the dot button
            [self.dot sendActionsForControlEvents:UIControlEventTouchDragExit];
            self.dot = nil;
        }
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.dot = nil;
    }
}

-(void)generateValuesArrayWithCoordiantes{
    
    //For every number between 0 and 13, create an NSDictionary with the values for x and y
    CGPoint lastCoord = {695,482}; //The dot coordinates are initialized
    
    for (int i = 0; i <= 13; i++) {
        
        float xCoord = 0; //Dot "x" coordinate
        float yCoord = 0; //Dot "y" coordinate
        
        //The dot repeats the same pattern until 13 moves have been reached (this can change depending on the trial requirements)
        
        if (i == 0){
            xCoord = 695;
            yCoord = 482;
        }
        else if (i == 1){
            xCoord = 155;
            yCoord = 681;
        }
        else if (i == 2){
            xCoord = 446;
            yCoord = 190;
        }
        else if (i == 3){
            xCoord = 446;
            yCoord = 766;
        }
        else if (i == 4){
            xCoord = 155;
            yCoord = 283;
        }
        else if (i == 5){
            xCoord = 695;
            yCoord = 482;
        }
        else if (i == 6){
            xCoord = 155;
            yCoord = 681;
        }
        else if (i == 7){
            xCoord = 446;
            yCoord = 190;
        }
        else if (i == 8){
            xCoord = 446;
            yCoord = 766;
        }
        else if (i == 9){
            xCoord = 155;
            yCoord = 283;
        }
        else if (i == 10){
            xCoord = 695;
            yCoord = 482;
        }
        else if (i == 11){
            xCoord = 155;
            yCoord = 681;
        }
        else if (i == 12){
            xCoord = 446;
            yCoord = 190;
        }
        else if (i == 13){
            xCoord = 446;
            yCoord = 766;
        }

        
        NSMutableDictionary *dotPositions = [[NSMutableDictionary alloc]init]; //dotPositions mutable dictionary is initialized
        //Add the x and y values to the dictionary
        [dotPositions setValue:[NSNumber numberWithFloat:xCoord] forKey:@"x"];
        [dotPositions setValue:[NSNumber numberWithFloat:yCoord] forKey:@"y"];
        //Set the distance travelled to 0. This will be updated as the view detects touches moved
        [dotPositions setValue:[NSNumber numberWithInt:0] forKey:@"distanceTravelled"];
        
        if (i>0) {
            // calculate the minimum distance required to get from this point to the previous point. Not required for the first point
            CGFloat minDistance = [self distanceBetween:CGPointMake(xCoord, yCoord) and:lastCoord];
            [dotPositions setValue:[NSNumber numberWithFloat:minDistance] forKey:@"minDistance"];
        }
        lastCoord = CGPointMake(xCoord, yCoord); //Last dot coordinates recorded
        [positions addObject:dotPositions]; //dotPositions object added to the positions array
    }
}

#pragma mark Gesture Tracking Data Source Methods

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dot.hidden = NO; //Show the dot button
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // Get this and last touch location and the distance moved between them
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    CGPoint lastLocation = [touch previousLocationInView:self.view];
    CGFloat distanceMoved = [self distanceBetween:touchLocation and:lastLocation];
    
    NSLog(@"MOVED %.2f", distanceMoved);
    
    //Get the current course from values, and update distanceTravelled to include the distance moved
    NSMutableDictionary *currentCourse = [positions objectAtIndex:buttonCount];
    CGFloat courseTravelled = [[currentCourse valueForKey:@"distanceTravelled"]floatValue];
    [currentCourse setValue:[NSNumber numberWithFloat:courseTravelled + distanceMoved] forKey:@"distanceTravelled"];
    
    //Detect if the touch is inside the button frame
    for (UITouch *t in touches) {
        CGPoint touchPoint = [t locationInView:self.view];
        
        CGPoint testPoint = [self.view convertPoint:touchPoint toView:dot];
        if ([dot pointInside:testPoint withEvent:event]) {
            [self DotDragEnter:dot];
            return;
        }
    }
}

-(CGFloat)distanceBetween:(CGPoint)point1 and:(CGPoint)point2{
    
    CGFloat xDist = (point1.x - point2.x);
    CGFloat yDist = (point1.y - point2.y);
    CGFloat totalDistance = sqrt((xDist * xDist) + (yDist * yDist)); //Calculate the total distance
    return totalDistance;
    
}

#pragma mark Gesture Tracking Delegate Methods


- (IBAction)DotDragEnter:(UIButton *)sender {
    if (!TrialHasStarted) { //"Not" operator - evaluates to false
        NSLog(@"It Has Begun");
        TrialHasStarted = true;
    }
    buttonCount = buttonCount + 1;
    
    NSLog(@"Dot n: %li", buttonCount);
    
    if (buttonCount == 13){
        // The button has been clicked 40 times, compare the minDistance of the dictionaries, to the actualDistance of the dictionaries

        dot.hidden = YES; //Also solves a crash issue
        self.dot.userInteractionEnabled = NO; //Disables user interaction with the dot
        self.finishButton.hidden = NO; //"Finish" button is revealed
        self.finishButton.userInteractionEnabled = YES; //User interaction with "Finish" button is enabled
        NSLog(@"Trial over");
        return;
    }
    
    CGRect lastFrame = sender.frame; //Get the last frame of the button
    
    NSMutableDictionary *nextButtonValues = [positions objectAtIndex:buttonCount];
    
    CGRect nextFrame = CGRectMake([[nextButtonValues valueForKey:@"x"]floatValue], [[nextButtonValues valueForKey:@"y"]floatValue], lastFrame.size.width, lastFrame.size.height);
    
    sender.userInteractionEnabled = NO; //Disable user interaction so we don't get undesired clicks
    
    [UIView animateWithDuration:0.1 animations:^{ //Animate the button move to the next location
        
        [sender setFrame:nextFrame]; //The dot button frame is updated
 
        sender.userInteractionEnabled = YES; //Enable user interaction again
    }];
}


- (IBAction)startButtonPressed:(UIButton *)sender {
    dot.hidden = NO; //The first dot is revealed as the "start" button is pressed
    self.startButton.hidden = YES; //As soon as it's pressed, the start button disappears
    sender.userInteractionEnabled = NO; //User interaction with the "start" button is disabled so as to avoid accidental clicks
}

@end
