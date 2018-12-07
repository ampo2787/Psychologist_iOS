//
//  PsychologistViewController.m
//  Psychologist_03_201402356
//
//  Created by JihoonPark on 2018. 9. 28..
//  Copyright © 2018년 JihoonPark. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController ()

@end

@implementation PsychologistViewController

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"심리 상담";
}

#pragma mark - Segue Handler
#define HAPPINESS_BAD   10
#define HAPPINESS_SOSO  50
#define HAPPINESS_GOOD  90

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[HappinessViewController class]]){
        HappinessViewController *happinessViewController = (HappinessViewController*) segue.destinationViewController;
        
        if([sender isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *) sender;
            happinessViewController.title = button.titleLabel.text;
            
            if([segue.identifier isEqualToString:@"segueBad"]){
                happinessViewController.happiness = HAPPINESS_BAD;
            }
            else if([segue.identifier isEqualToString:@"segueSoso"]){
                happinessViewController.happiness = HAPPINESS_SOSO;
            }else{
                happinessViewController.happiness = HAPPINESS_GOOD;
            }
            
        }
    }
}

@end
