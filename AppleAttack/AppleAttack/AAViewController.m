//
//  AAViewController.m
//  AppleAttack
//
//  Created by Stu on 21/10/13.
//  Copyright (c) 2013 AppGuy. All rights reserved.
//

#import "AAViewController.h"

@interface AAViewController ()

@property (nonatomic) float interval;
@property (nonatomic) Boolean playing;
@property (nonatomic) int scoreCount;
@property (nonatomic) AVAudioPlayer *audioMove;
@property (nonatomic) AVAudioPlayer *audioHit;
@property (nonatomic) BOOL soundOn;

@end

@implementation AAViewController

@synthesize Score;
@synthesize timer;
@synthesize appleButton;
@synthesize interval = _interval;
@synthesize playing = _playing;
@synthesize scoreCount = _scoreCount;
@synthesize audioMove = _audioMove;
@synthesize audioHit = _audioHit;
@synthesize soundOn = _soundOn;

-(void) viewWillAppear:(BOOL)animated   {
    
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    
    self.interval = [userDefaults floatForKey:kDifficultyLevel ];
    NSData *colour = [userDefaults objectForKey:KColour];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colour];
    self.view.backgroundColor = color;
    
    self.soundOn = [userDefaults boolForKey:kOnOffToggle];
    
}

- (IBAction)playButton:(UIButton *)sender {
    
    [self.timer invalidate];
    _playing = FALSE;
    _scoreCount = 0;
    self.Score.text = [NSString stringWithFormat:@"%d",_scoreCount];
    
    if (!_playing){
        _playing = TRUE;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(moveButton:) userInfo:nil repeats:YES];
        
               
    }
    
}
- (IBAction)Settings:(UIButton *)sender {
    [timer invalidate];
    self.playing = FALSE;
}

/**- (IBAction)ChangeGameSpeed:(UISlider *)sender {
    
    [self.timer invalidate];
    
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(moveButton:) userInfo:nil repeats:YES];
    
    
}*/



- (void) moveButton:(NSTimer *) timer
{
    float avilableWidth = self.view.bounds.size.width;
    float avilableHeight = self.view.bounds.size.height;
    
    float btnx = random()% (int) (avilableWidth-150);
    float btny = random()% (int) (avilableHeight-150);
    [appleButton setFrame:CGRectMake(btnx, btny, 35, 35)];
    
}


- (IBAction)pauseButton:(id)sender {
    _playing = false;
    [self.timer invalidate];
    
}



- (IBAction)appleButton:(UIButton *)sender {
    _scoreCount++;
      self.Score.text = [NSString stringWithFormat:@"%d",_scoreCount];
    [self moveButton:timer];
    if (self.soundOn)[self.audioHit play];
    
}

- (IBAction)NewGame:(id)sender {
    
   
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.interval = 1;
    _playing = FALSE;
    _scoreCount = 0;
    self.Score.text = [NSString stringWithFormat:@"%d",_scoreCount];
    NSURL *urlHit = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/PUNCH.wav", [[NSBundle mainBundle] resourcePath]]];
    //use the url and load the files in Audio player
    NSError *error;
    self.audioHit = [[AVAudioPlayer alloc] initWithContentsOfURL:urlHit error:&error];
    self.audioHit.numberOfLoops = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
