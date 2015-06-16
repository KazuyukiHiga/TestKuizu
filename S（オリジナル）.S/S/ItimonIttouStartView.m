//
//  ItimonIttouStartView.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "ItimonIttouStartView.h"
#import "ItimonIttou2.h"
#import "QuizItem.h"
#import "Quiz.h"
#import <AudioToolbox/AudioToolbox.h>
#import "kaitouView.h"
#import "ItimonIttouView.h"



// クイズの出題数
static const NSInteger kQuizCount = 10;

//次の出題までの待ち時間
static const NSTimeInterval kNetuizIntaval = 2.0;


//問
int num2 = 1;

//正解数
int seikai;

int numm;
int nume;



@implementation ItimonIttouStartView



@synthesize quiz;
@synthesize questionTextView;
@synthesize answerButton1;
@synthesize answerButton2;
@synthesize answerButton3;
@synthesize answerButton4;




-(id)init
{
    self = [super initWithNibName:@"ItimonIttouStartView" bundle:nil];
    
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


-(IBAction)top
{   
    seikai = 0;
    num2 = 1;
    id ob = [[Quiz alloc] init];
    [ob clear];
    [self dismissModalViewControllerAnimated:YES];
    
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
    [questionTextView release];
    [answerButton1 release];
    [answerButton2 release];
    [answerButton3 release];
    [answerButton4 release];
    [mylabel1 release];
    [myimageview release];
    [testview release];
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
    [self imageview];
    [self showNextQuiz];
    NSString *toi1 = [NSString stringWithFormat:@"問%d",num2];
    mylabel1.text = toi1;
    seikai = 0;
    num2 = 1;
    id ob = [[Quiz alloc] init];
    [ob clear];
    questionTextView.alpha = 0.7;
    answerButton1.alpha = 0.8;
    answerButton2.alpha = 0.8;
    answerButton3.alpha = 0.8;
    answerButton4.alpha = 0.8;

    testview.alpha = 0.8;
    testview.hidden = YES;
    
    [ob release];
    
}

-(void)imageview
{   
    id obbb = [[ItimonIttouView alloc]init];
  
    numm = [obbb gazouzousin];
    
         
       switch (numm) {
        case 1:
            myimageview.image = [UIImage imageNamed:@"1400-800.jpg"];
            break;
        case 2:
            myimageview.image = [UIImage imageNamed:@"oki_003.jpg"];
            break;
        case 3:
            myimageview.image = [UIImage imageNamed:@"_C036584_R.jpg"];
            break;
        case 4:
            myimageview.image = [UIImage imageNamed:@"529-800.jpg"];
            break;
        case 5:
            myimageview.image = [UIImage imageNamed:@"oki_048.jpg"];
            break;
        case 6:
            myimageview.image = [UIImage imageNamed:@"578-800.jpg"];
            break;
                    
        default: myimageview.image = [UIImage imageNamed:@"_C026577_R.jpg"];
            break;
       }
  
}
     
          



    

// 次の問題を表示する
- (void)showNextQuiz
{
    // クイズ情報を取得する
    QuizItem *item = [self.quiz nextQuiz];
    
    
    // 問題文を設定する
    self.questionTextView.text = item.question;
    
    // 選択肢を取得する
    NSArray *choices = item.randomChoicesArray;
    
    // ボタンを配列にする
    NSArray *buttons = [NSArray arrayWithObjects:
                        self.answerButton1,
                        self.answerButton2,
                        self.answerButton3,
                        self.answerButton4,
                        nil];
    
    // ボタンのラベルに選択肢を設定する
    NSUInteger i;
    
    for (i = 0; i < [choices count] && i < [buttons count]; i++)
    {
        NSString *str = [choices objectAtIndex:i];
        UIButton *button = [buttons objectAtIndex:i];
        
        [button setTitle:str forState:UIControlStateNormal];
    }
    
    // ビューの表示を更新する
    [self.view setNeedsDisplay];
    
    
}



-(IBAction)answer:(id)sender
{

    //ボタンを無表示にする
    self.answerButton1.enabled = NO;
    self.answerButton2.enabled = NO;
    self.answerButton3.enabled = NO;
    self.answerButton4.enabled = NO;
    
    // タップされたボタンのラベルを取得する
    
    NSString *str = [[sender titleLabel] text];
    
    // 出題された問題の情報を取得する
    QuizItem *item = [self.quiz.usedQuizItems lastObject];
    
    //正解か判定
    if([item checkIsRightAnswer:str])
    {
        //正解ならば先頭に丸をつける
        [sender setTitle:[NSString stringWithFormat:@"○ %@", str]forState:UIControlStateNormal];
        
        //効果音再生
        AudioServicesPlaySystemSound(seikaioto);
        
       //正解の表示
        [self actionsheet];
        
         //○表示
        testview.image = [UIImage imageNamed:@"sinryoukun7.png"];
        testview.hidden = NO;
        
        //正解数を増やす
        seikai++;
        
        if ([self.quiz.usedQuizItems count] == kQuizCount)  {
            [self seisekisend];
        }
        
    }
    else
    {
        //不正解なので×を先頭に追加する
        [sender setTitle:[NSString stringWithFormat:@"× %@", str]forState:
         UIControlStateNormal];
        
        //効果音再生
        AudioServicesPlaySystemSound(matigaioto);
        
         //バイブレーション
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
       
        //正解の表示
        [self actionsheet];
        
        //×の表示
        testview.image = [UIImage imageNamed:@"sinryoukun6.png"];

        testview.hidden = NO;

       
    }
    
    //表示を更新する
   // [self.view setNeedsDisplay];
    
}



//時間を置いて呼ばれるメソッド
-(void)nextQuiz:(id)senfer
{
    //出題終えたら解答画面に移動
    if ([self.quiz.usedQuizItems count] == kQuizCount) {
        kaitouView *controller = 
        [[kaitouView alloc]
         initWithNibName:@"kaitouView" bundle:nil];
        
        controller.modalTransitionStyle = 
        UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];    
        [controller release];
        [self seisekisend];
    }
    else{
        //ボタンを有効にする
        self.answerButton1.enabled = YES;
        self.answerButton2.enabled = YES;
        self.answerButton3.enabled = YES;
        self.answerButton4.enabled = YES;
        
        //問を一つ増やす
        num2 ++;
        [self showNextQuiz];
        [self nokori];
        
    }
}

//問題数
-(void)nokori;
{   
    
    NSString *toi1 = [NSString stringWithFormat:@"問%d",num2];
    mylabel1.text = toi1;
    
}


-(int)seisekisend
{   
    return seikai;
    
}

//正解数をリセット
-(void)risetnum2
{
    num2 = 1;
    seikai = 0;
}



- (void)viewDidUnload
{
    [myimageview release];
    myimageview = nil;
    [testview release];
    testview = nil;    
    [questionTextView release];
    questionTextView = nil;
    [answerButton1 release];
    answerButton1 = nil;
     [answerButton2 release];
    answerButton2 = nil;
    [answerButton3 release];
    answerButton3 = nil;
     [answerButton4 release];
    answerButton4 = nil;
     [mylabel1 release];
    [super viewDidUnload];

}

-(void)actionsheet
{      
    QuizItem *item = [self.quiz.usedQuizItems lastObject];
    NSString *sese = [NSString stringWithFormat:@"正解        %@",[item rightAnswer]];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:sese delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"次の問題", nil];
    
    [actionSheet showInView:self.view];

}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self nextQuiz:nil];
    testview.hidden = YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




@end
