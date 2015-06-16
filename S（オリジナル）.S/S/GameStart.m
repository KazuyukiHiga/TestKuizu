//
//  GameStart.m
//  SotukenSInryouJyouhou
//
//  Created by 比嘉　和之 on 11/07/01.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "GameStart.h"
#import "Game.h"
#import "Quiz1.h"
#import "QuizItem2.h"
#import "ScoreView.h"
#import <AudioToolbox/AudioToolbox.h>



//次の出題までの待ち時間
static const NSTimeInterval kNetuizIntaval11 = 0.5;

// クイズの出題数
//static const NSInteger kQuizCount11 = 30;

//制限時間
static const NSInteger ttime = 62;



//正解数
int seikai1;

@implementation GameStart


@synthesize quiz;
@synthesize MondaiTextView;
@synthesize mybutton1;
@synthesize mybutton2;
@synthesize topbutton;
@synthesize scoalabel;


-(id)init
{
    self = [super initWithNibName:@"GameStart" bundle:nil];
    
    if(self)
    {
        quiz = nil;
        
        
        //効果音読み込み
        
        NSBundle *bundle1 = [NSBundle mainBundle];
        NSString *path1;
        NSURL *url;
        
        //正解時の効果音
        path1 = [bundle1 pathForResource:@"quiz1" ofType:@"wav"];
        url = [NSURL fileURLWithPath:path1];
        AudioServicesCreateSystemSoundID((CFURLRef)url,&seikaioto);
        
        //不正解時の効果音
        path1 = [bundle1 pathForResource:@"quiz2" ofType:@"wav"];
        url = [NSURL fileURLWithPath:path1];
        AudioServicesCreateSystemSoundID((CFURLRef)url,&matigaioto);
        
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(seikaioto);
    
    [quiz release];
    [mybutton1 release];
    [mybutton2 release];
    [myimageview release];
    [timelabel release];
    [myimagetopview release];
    [timelabel release];
    [topbutton release];
    [scoalabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self animation];
    MondaiTextView.alpha = 0.8;
    seikai1 = 0;
    myimagetopview.image = [UIImage imageNamed:@"sinryoukun12.png"];
    //制限時間
    timeCount = ttime;
    timelabel.alpha = 0.8;
    rankingubutton.hidden = YES;
    [self showNextQuiz];
    
}     

// 次の問題を表示する
- (void)showNextQuiz
{
    // クイズ情報を取得する
    QuizItem2 *iitem = [self.quiz nextQuiz];
    
    
    // 問題文を設定する
    self.MondaiTextView.text = iitem.question;
    
    // 選択肢を取得する
    NSArray *choices = iitem.randomChoicesArray;
    
    // ボタンを配列にする
    NSArray *buttons = [NSArray arrayWithObjects:
                        self.mybutton1,
                        self.mybutton2,
                        nil];
    
    // ボタンのラベルに選択肢を設定する
    NSUInteger i;
    
   for (i = 0; i < [choices count] && i < [buttons count]; i++)
    {
        NSString *str = [choices objectAtIndex:i];
        //UIButton *button = [buttons objectAtIndex:i];
        
        //[button setTitle:str forState:UIControlStateNormal];
        if (str == @"○")
        {
           [mybutton1 setTitle:@"○" forState:UIControlStateNormal];
             [mybutton2 setTitle:@"×" forState:UIControlStateNormal];
        }
       else
        {
           [mybutton1 setTitle:@"○" forState:UIControlStateNormal];
           [mybutton2 setTitle:@"×" forState:UIControlStateNormal];
        }
    
    // ビューの表示を更新する
        [self.view setNeedsDisplay];
   // [self cleabutton];
    
    
    }
}


-(IBAction)answer:(id)sender
{
    
    
    // タップされたボタンのラベルを取得する
    
    NSString *str = [[sender titleLabel] text];
    
    // 出題された問題の情報を取得する
    QuizItem2 *item11 = [self.quiz.usedQuizItems lastObject];
    
    //ボタンを無表示にする
    self.mybutton1.enabled = NO;
    self.mybutton2.enabled = NO;
    
    //正解か判定
    if([item11 checkIsRightAnswer:str])
    {        
        //効果音再生
        AudioServicesPlaySystemSound(seikaioto);
        
        myimageview.image = [UIImage imageNamed:@"sinruyu1.png"];
        myimageview.hidden = NO;
        
          
        //正解数を増やす
        seikai1 = seikai1 + 100;
        NSString *scoa = [[NSString stringWithFormat:@"%d",seikai1]init];
               
        //時間を置おいてから次の問題を呼び出す
        [self performSelector:@selector(nextQuiz:)
                   withObject:nil
                   afterDelay:kNetuizIntaval11];
        
        //スコアセット
        Score.text = scoa;
    }
    else
    {
               
        
        //効果音再生
        AudioServicesPlaySystemSound(matigaioto);
        
         myimageview.image = [UIImage imageNamed:@"sinruyu.png"];
        myimageview.hidden = NO;

           
        //バイブレーション
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
        [self performSelector:@selector(nextQuiz:)
                   withObject:nil
                   afterDelay:kNetuizIntaval11];
        
     }
    
    //表示を更新する
    [self.view setNeedsDisplay];
    
}

//時間を置いて呼ばれるメソッド
-(void)nextQuiz:(id)sender
{
    /*//出題終えたら解答画面に移動
    //if ([self.quiz.usedQuizItems count] == kQuizCount11) 
    if (ttime <= 0) 
    {
        myimageview.image = [UIImage imageNamed:@"sinruyu2.png"];
        myimageview.hidden = NO;
        rankingubutton.hidden = NO;
        self.mybutton1.enabled = NO;
        self.mybutton2.enabled = NO;
        RankingView *controller = 
        [[RankingView alloc]
         initWithNibName:@"RankingView" bundle:nil];
        
        controller.modalTransitionStyle = 
        UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];    
        [controller release];
         
    }
     
    else{
     //ボタンを有効にする
        self.mybutton1.enabled = YES;
        self.mybutton2.enabled = YES;
        
        [self showNextQuiz];
        
    }
     */
    myimagetopview.image = [UIImage imageNamed:@"sinryoukun12.png"];
    myimageview.hidden = YES;
    
    self.mybutton1.enabled = YES;
    self.mybutton2.enabled = YES;
    
    [self showNextQuiz];

    
    
}

- (IBAction)rankingu:(id)sender 
{
    ScoreView *controller = 
    [[ScoreView alloc]
     initWithNibName:@"ScoreView" bundle:nil];
    
    controller.modalTransitionStyle = 
    UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    

}


- (void)viewDidUnload
{
    [mybutton1 release];
    mybutton1 = nil;
    [mybutton2 release];
    mybutton2 = nil;
    [myimageview release];
    myimageview = nil;
    [timelabel release];
    timelabel = nil;
   // seikai1 = 0;
    [myimagetopview release];
    myimagetopview = nil;
    [timelabel release];
    timelabel = nil;
    [self setTopbutton:nil];
    [self setScoalabel:nil];
    [super viewDidUnload];
    [MondaiTextView release];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}



- (IBAction)top:(id)sender {
    Game *controller = 
    [[Game alloc]
     initWithNibName:@"Game" bundle:nil];
    
    controller.modalTransitionStyle = 
    UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];    
    [controller release];

}

/*-(void)cleabutton
{
    mybutton1 = nil;
    mybutton2 = nil;
}
*/

-(void)animation
{
    NSArray *anime = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"san.png"],
                      [UIImage imageNamed:@"ni.png"],
                      [UIImage imageNamed:@"iti.png"],nil];
    
    myimageview.animationImages = anime;
    //アニメーション速度
    myimageview.animationDuration = 2.0;
    //アニメーション回数
    myimageview.animationRepeatCount = 1;
    
    //アニメーション開始
    [myimageview startAnimating];
    
    //ボタン無効
   // mybutton1.hidden = YES;
   // mybutton2.hidden = YES;
     
    
   // timeCount = ttime;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(settime:) userInfo:nil repeats:YES];
   
    //アニメーショん終了
    //[myimageview stopAnimating];
    
    
}



//時間表時、0になると終了
-(void)settime:(NSTimer *)timer
{
    timeCount--;
    NSString *time = [[NSString stringWithFormat:@"%d", timeCount]init];
    timelabel.text = time;
   //制限時間が０になったら
   if (timeCount <= 0) {
        //終了画面表示
        myimagetopview.image = [UIImage imageNamed:@"sinruyu2.png"];
        //ランキングボタン表示
       rankingubutton.hidden = NO;
        
        //ボタン無効
        self.mybutton1.enabled = NO;
        self.mybutton2.enabled = NO;
        self.mybutton1.hidden = YES;
        self.mybutton2.hidden = YES;
       
       MondaiTextView.hidden = YES;
       Score.hidden = YES;
       timelabel.hidden = YES;
       scoalabel.hidden = YES;
       topbutton.hidden =YES;
       

        [self data:nil];
    }
   

}

/*//得点をテキストファイルに記録
-(void)writedata:(id)sender
{   
   
    NSBundle *bundle = [NSBundle mainBundle];
    NSString  *path;
    path = [bundle pathForResource:@"save" ofType:@"txt"];
    NSString *st = [NSString stringWithFormat:@"%d",seikai1];
    id stt = [NSMutableString stringWithCapacity:10];
    [stt appendString:st];
  
    
    [st writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //NSString *sstr;
    //sstr = [str ]
    
    
}
 */


-(void)data:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:seikai1 forKey:@"tokuten"];
    [defaults synchronize];
}

@end



