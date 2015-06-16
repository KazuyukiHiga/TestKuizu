//
//  ItimonIttouStartView.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//test

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@class Quiz;
@class itimonittouView;
@interface ItimonIttouStartView : UIViewController
<UIActionSheetDelegate>{
    Quiz *quiz;
    IBOutlet UIImageView *testview;
    itimonittouView *itimon;
    IBOutlet UITextView *questionTextView;
    IBOutlet UIButton *answerButton1;
    IBOutlet UIButton *answerButton2;
    IBOutlet UIButton *answerButton3;
    IBOutlet UIButton *answerButton4;
    IBOutlet UILabel *mylabel1;
    SystemSoundID seikaioto;
    SystemSoundID matigaioto;
    IBOutlet UIImageView *myimageview;
}

@property (retain, nonatomic)Quiz *quiz;
@property (retain, nonatomic)UITextView *questionTextView;
@property (retain, nonatomic)UIButton *answerButton1;
@property (retain, nonatomic)UIButton *answerButton2;
@property (retain, nonatomic)UIButton *answerButton3;
@property (retain, nonatomic)UIButton *answerButton4;



-(IBAction)top;

-(IBAction)answer:(id)sender;

-(void)showNextQuiz;

-(void)nextQuiz:(id)senfer;

-(void)nokori;

-(int)seisekisend;

-(void)risetnum2;

-(void)actionsheet;

-(void)imageview;


@end
