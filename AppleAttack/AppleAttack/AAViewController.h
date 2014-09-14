//
//  AAViewController.h
//  AppleAttack
//
//  Created by Stu on 21/10/13.
//  Copyright (c) 2013 AppGuy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


#define kOnOffToggle @ "onOff"
#define kDifficultyLevel @"difficulty"
#define KColour @"backgroundColour"

@interface AAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *Score;
@property   (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *appleButton;



@end
