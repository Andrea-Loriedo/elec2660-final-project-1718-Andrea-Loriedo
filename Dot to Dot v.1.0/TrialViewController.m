//
//  TrialViewController.m
//  Dot to Dot v.1.0
//
//  Created by Andrea on 1/12/17.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TrialViewController.h"

@interface TrialViewController (){
    
    NSMutableArray *positions; // Array containing NSDictionary with coordinates for each button the user will navigate to
    NSInteger buttonCount; // Counts how many times the dot has been pressed
    __weak IBOutlet UIButton *dot; //dot object is of type UIButton
    BOOL hasStarted;
    
}

@end

@implementation TrialViewController

@synthesize positions = _positions;
@synthesize dot = _dot;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dot.hidden = YES; //Hide the dot until the first touch is detected
    buttonCount = 0; // So far the button has been clicked 0 times
    positions = [[NSMutableArray alloc]init]; //Initialisation of the values array

    [self generateValuesArrayWithCoordiantes]; //Triggers the generateValuesArrayWithCoordiantes method as soon as the trial starts running
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generateValuesArrayWithCoordiantes{
    
    // for every number between 0 and 20, create an nsdictionary with your desired values for x and y
    CGPoint lastCoord = {0,0};
    // you need to have your set of coordinates stored somewhere, so that they can put into the button values dictionary
    for (int i = 0; i <= 40; i++) {
        
        float xCoord = 0;
        float yCoord = 0;
        
        if (i == 1){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 2){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 3){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 4){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 5){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 6){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 7){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 8){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 9){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 10){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 11){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 12){
            xCoord= 190;
            yCoord = 322;
        }
        else if (i == 13){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 14){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 15){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 16){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 17){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 18){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 19){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 20){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 21){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 22){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 23){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 24){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 25){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 26){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 27){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 28){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 29){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 30){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 31){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 32){
            xCoord = 190;
            yCoord = 322;
        }
        else if (i == 33){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 34){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 35){
            xCoord = 482;
            yCoord = 73;
        }
        else if (i == 36){
            xCoord = 681;
            yCoord = 613;
        }
        else if (i == 37){
            xCoord = 190;
            xCoord = 322;
        }
        else if (i == 38){
            xCoord = 766;
            yCoord = 322;
        }
        else if (i == 39){
            xCoord = 283;
            yCoord = 613;
        }
        else if (i == 40){
            xCoord = 482;
            yCoord = 73;
        }
        
        NSMutableDictionary *dotPositions = [[NSMutableDictionary alloc]init];
        // add the x and y values to the dictionary
        [dotPositions setValue:[NSNumber numberWithFloat:xCoord] forKey:@"x"];
        [dotPositions setValue:[NSNumber numberWithFloat:yCoord] forKey:@"y"];
        // set the distance travelled to 0. this will be updated as your view detects touches moved
        [dotPositions setValue:[NSNumber numberWithInt:0] forKey:@"distanceTravelled"];
        
        if (i>0) {
            // calculate the minimum distance required to get from this point to the previous point. not required for the first point
            CGFloat minDistance = [self distanceBetween:CGPointMake(xCoord, yCoord) and:lastCoord];
            [dotPositions setValue:[NSNumber numberWithFloat:minDistance] forKey:@"minDistance"];
        }
        lastCoord = CGPointMake(xCoord, yCoord);
        [positions addObject:dotPositions];
    }
}

#pragma mark Gesture Tracking Delegate Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // unhide the button
    dot.hidden = NO;
}

#pragma mark Gesture Tracking Data Source Methods

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (hasStarted) {
        // only necessary if the game has begun
        // get this and last touch location and the distance moved between them
        UITouch *touch = [touches anyObject];
        CGPoint touchLocation = [touch locationInView:self.view];
        CGPoint lastLocation = [touch previousLocationInView:self.view];
        CGFloat distanceMoved = [self distanceBetween:touchLocation and:lastLocation];
        
        // get the current course from values, and update the distanceTravelled to include the distance moved
        NSMutableDictionary *currentCourse = [positions objectAtIndex:buttonCount];
        CGFloat courseTravelled = [[currentCourse valueForKey:@"distanceTravelled"]floatValue];
        [currentCourse setValue:[NSNumber numberWithFloat:courseTravelled + distanceMoved] forKey:@"distanceTravelled"];
    }
}

-(CGFloat)distanceBetween:(CGPoint)point1 and:(CGPoint)point2{
    CGFloat xDist = (point1.x - point2.x);
    CGFloat yDist = (point1.y - point2.y);
    CGFloat totalDistance = sqrt((xDist * xDist) + (yDist * yDist));
    return totalDistance;
    
}


- (IBAction)button1Click:(UIButton *)sender {
}

- (IBAction)startButtonPressed:(id)sender {
    dot.hidden = NO;
}


@end
