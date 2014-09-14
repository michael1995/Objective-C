//
//  AA_SettingsViewController.m
//  AppleAttack
//
//  Created by Stu on 28/10/13.
//  Copyright (c) 2013 AppGuy. All rights reserved.
//

#import "AA_SettingsViewController.h"

@interface AA_SettingsViewController ()





@end

@implementation AA_SettingsViewController 
{
    NSMutableArray *colours;
    NSData *colour;
    float interval;
    BOOL soundenabled;
}

@synthesize colourPicker;
@synthesize levelSlider;
@synthesize toggleSwitch;

-(void) viewWillDisappear:(BOOL)animated{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    
    [userdefaults   setBool:toggleSwitch.on forKey:kOnOffToggle];
    [userdefaults setFloat:interval forKey:kDifficultyLevel];
    [userdefaults setObject:colour forKey:KColour];
    
    
    
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *colourselected = [colours objectAtIndex:row];
    if ([colourselected isEqualToString:@"Red"])    
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor redColor]];
    else if ([colourselected isEqualToString:@"Blue"])
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blueColor]];
    else if ([colourselected isEqualToString:@"White"])
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor whiteColor]];
    else if ([colourselected isEqualToString:@"Green"])
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor greenColor]];
    else if ([colourselected isEqualToString:@"Yellow"])
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor yellowColor]];
    else if ([colourselected isEqualToString:@"Black"])
        colour = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]];
    

    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [colours objectAtIndex:row];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [colours count];
}

- (IBAction)changeGameLevel:(UISlider *)sender {
    
    interval = sender.maximumValue - sender.value  + sender.minimumValue;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    colours = [[NSMutableArray alloc]init];
    [colours addObject:@"Red"];
    [colours addObject:@"Blue"];
    [colours addObject:@"White"];
    [colours addObject:@"Green"];
    [colours addObject:@"Yellow"];
    [colours addObject:@"Black"];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    interval = levelSlider.maximumValue - [userdefaults floatForKey:kDifficultyLevel] + levelSlider.minimumValue;
    
    levelSlider.value = interval;
    //set toggle switch
    toggleSwitch.on = [userdefaults boolForKey:kOnOffToggle];
    //set picker
    colour = [userdefaults objectForKey:KColour];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colour ];
    
    
    
    if (color>0) {
        NSInteger index;
        if ([color isEqual:[UIColor redColor]]) {
            index = 0;
        }
        else if ([color isEqual:[UIColor blueColor]]) {
            index = 1;
        }
        else if ([color isEqual:[UIColor whiteColor]]) {
            index = 2;
        }
        else if ([color isEqual:[UIColor greenColor]]) {
            index = 3;
        }
        else if ([color isEqual:[UIColor yellowColor]]) {
            index = 4;
        }

        else {
            index = 5;
        }
        
        [colourPicker selectRow:index inComponent:0 animated:YES];
    }
    
    
    
    
}

- (IBAction)sliderChanged:(UISlider*)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
    [userDefaults setFloat:levelSlider.value forKey:kDifficultyLevel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
