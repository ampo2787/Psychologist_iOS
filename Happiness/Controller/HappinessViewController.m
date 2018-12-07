//
//  HappinessViewController.m
//  Happiness_02_201402356
//
//  Created by JihoonPark on 2018. 9. 12..
//  Copyright © 2018년 JihoonPark. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

#pragma mark - Declaration of Private methods

@interface HappinessViewController ()

+(CGFloat) happinessToSmileness:(int) happiness;

-(void) updateFaceView;

@end

#pragma mark - Constants

#define MAX_HAPPINESS   100
#define MIN_HAPPINESS   0
#define DEFAULT_HAPPINESS   50

#pragma mark - Implemetation of methods

@implementation HappinessViewController

#pragma mark - Class Methods
+(CGFloat) happinessToSmileness:(int)happiness{
    CGFloat ratioOfHappiness = (CGFloat)(happiness - MIN_HAPPINESS) / (CGFloat)(MAX_HAPPINESS - MIN_HAPPINESS);
    
    CGFloat smileness = ratioOfHappiness * 2.0 - 1.0;
    return smileness;
}

#pragma mark - Setter
-(void)setHappiness:(int) newHappiness {
    if(newHappiness < MIN_HAPPINESS){
        newHappiness = MIN_HAPPINESS;
    }
    else if (newHappiness > MAX_HAPPINESS){
        newHappiness = MAX_HAPPINESS;
    }
    _happiness = newHappiness;
    [self updateFaceView];
}

#pragma mark - View Refresh
-(void) updateFaceView{
    self.happinessSlider.value = self.happiness;
    self.happinessLabel.text = [NSString stringWithFormat:@"%d", self.happiness];
    [self.faceView setNeedsDisplay];
}

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.faceView reset];
    self.faceView.delegate = self;

    self.view.layer.backgroundColor = UIColor.lightGrayColor.CGColor;
    [self updateFaceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Implemetatin of <FaceViewDelegate> Protocol
-(CGFloat) smilenessForFaceView:(FaceView *)requestor{
    CGFloat smileness = 0.0;
    if(requestor == self.faceView){
        smileness = [[self class]happinessToSmileness:self.happiness];
    }
    return smileness;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)happinessSliderChanged:(UISlider *)sender {
    [self setHappiness:(int)sender.value];
}
@end
