//
//  GameStart.h
//  SotukenSInryouJyouhou
//
//  Created by 比嘉　和之 on 11/07/01.
//  Copyright 2011 名桜大学. All rights reserved.
//tset

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@class Quiz1;
@class Game;
@interface GameStart : UIViewController
<UIActionSheetDelegate>{
    IBOutlet UILabel *Score;
    int timeCount;
    Quiz1 *quiz;
    IBOutlet UITextView *MondaiTextView;
    IBOutlet UIButton *mybutton1;
    IBOutlet UIButton *mybutton2;
    UIButton *topbutton;
    UILabel *scoalabel;
    SystemSoundID seikaioto;
    SystemSoundID matigaioto;
    IBOutlet UIImageView *myimageview;
    IBOutlet UIButton *rankingubutton;
    IBOutlet UIImageView *myimagetopview;
    IBOutlet UILabel *timelabel;

}
@property (retain, nonatomic)Quiz1 *quiz;
@property (retain, nonatomic)UITextView *MondaiTextView;
@property (retain, nonatomic)UIButton *mybutton1;
@property (retain, nonatomic)UIButton *mybutton2;
@property (nonatomic, retain) IBOutlet UIButton *topbutton;
@property (nonatomic, retain) IBOutlet UILabel *scoalabel;


- (IBAction)top:(id)sender;

-(IBAction)answer:(id)sender;

-(void)showNextQuiz;

-(void)nextQuiz:(id)sender;

- (IBAction)rankingu:(id)sender;

//-(void)cleabutton;

-(void)animation;

-(void)settime:(NSTimer *)timer;

-(void)data:(id)sender;

//-(void)writedata:(id)sender;


@end
