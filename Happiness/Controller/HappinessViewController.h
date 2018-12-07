//
//  HappinessViewController.h
//  Happiness_02_201402356
//
//  Created by JihoonPark on 2018. 9. 12..
//  Copyright © 2018년 JihoonPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceView.h"

@interface HappinessViewController : UIViewController <FaceViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *happinessLabel;
@property (weak, nonatomic) IBOutlet FaceView *faceView;
@property (weak, nonatomic) IBOutlet UISlider *happinessSlider;
@property (nonatomic) int happiness;

- (IBAction)happinessSliderChanged:(UISlider *)sender;

@end
