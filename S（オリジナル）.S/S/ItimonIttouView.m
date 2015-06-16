//
//  ItimonIttouView.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "ItimonIttouView.h"
#import "ItimonIttouStartView.h"
#import "Quiz.h"
#import "ItimonIttou2.h"

int num = 0;
@implementation ItimonIttouView
@synthesize dispStr;

-(int)gazouzousin
{
    return num;
}
-(void)numclea
{
    num = 0;
}

-(IBAction)startQuiz:(id)sender
{       
    if (num >= 7) {
        [self numclea];
    }
    num++;
    // クイズデータが読み込まれていないときは読み込む
    if (!_quiz)
    {
        // インスタンス作成
        _quiz = [[Quiz alloc] init];
        
        
        // クイズデータのファイルパスを取得する
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path;
        
        path = [bundle pathForResource:@"MondaiData2.2" ofType:@"txt"];
    
        // ファイルから読み込む
        [_quiz readFromFile:path];
    }
    
    // 2回目以降の場合があるので、出題済みの情報をクリアする
    [_quiz clear];
    
    // クイズ出題画面用のビューコントローラを取得する
    ItimonIttouStartView *viewController;
    viewController = [[ItimonIttouStartView alloc] init];
    
    
    // クイズ情報を設定する
    [viewController setQuiz:_quiz];
    
   
    // クイズ出題画面を表示する
    [self presentModalViewController:viewController
                            animated:YES];
    [viewController release];
   
}

-(IBAction)top
{
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
    [_quiz release];
    [mylabel1 release];
    [dispStr release];
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
    mylabel1.text = dispStr;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [mylabel1 release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
