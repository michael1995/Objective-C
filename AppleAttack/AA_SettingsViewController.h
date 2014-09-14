//
//  AA_SettingsViewController.h
//  AppleAttack
//
//  Created by Stu on 28/10/13.
//  Copyright (c) 2013 AppGuy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOnOffToggle @ "onOff"
#define kDifficultyLevel @"difficulty"
#define KColour @"backgroundColour"

@interface AA_SettingsViewController : UIViewController < UIPickerViewAccessibilityDelegate, UIPickerViewDataSource>



@property (weak, nonatomic) IBOutlet UISlider *levelSlider;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UIPickerView *colourPicker;









@end
