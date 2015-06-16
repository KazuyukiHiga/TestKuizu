//
//  ItimonIttou2.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/20.
//  Copyright 2011 名桜大学. All rights reserved.
//test

#import "ItimonIttou2.h"
#import "ItimonIttouStartView2.h"
#import "Quiz.h"
#import "KategoriView.h"
#import "ItimonIttouView.h"

int numi;

@implementation ItimonIttou2
@synthesize dispStr;

-(int)gazouzousin
{
    return numi;
}
-(void)numclea
{
    numi = 0;
}
-(IBAction)startQuiz:(id)sender
{ 
    if (numi >= 7) {
        [self numclea];
    }
    numi++;

     // クイズデータが読み込まれていないときは読み込む
    if (!_quiz)
    {
        
        // インスタンス作成
        _quiz = [[Quiz alloc] init];
        
        
        // クイズデータのファイルパスを取得する
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path;
        
        if (mylabel1.text == @"病院基礎知識1") {
           path = [bundle pathForResource:@"MondaiData1.1" ofType:@"txt"];
        }
        
        if (mylabel1.text == @"病院基礎知識2") {
            path = [bundle pathForResource:@"MondaiData1.2" ofType:@"txt"];
        }
            
        if (mylabel1.text == @"病院基礎知識3") {
            path = [bundle pathForResource:@"MondaiData1.3" ofType:@"txt"];
        }
        if (mylabel1.text == @"医療IT分野") {
            path = [bundle pathForResource:@"MondaiData1.4" ofType:@"txt"];
        }
        if (mylabel1.text == @"医療統計分野") {
                path = [bundle pathForResource:@"MondaiData1.5" ofType:@"txt"];
        }
        if (mylabel1.text == @"医療歴史") {
                    path = [bundle pathForResource:@"MondaiData1.6" ofType:@"txt"];
        }
        if (mylabel1.text == @"医療法律") {
                path = [bundle pathForResource:@"MondaiData1.7" ofType:@"txt"];
        }
        /*
        if (mylabel1.text == @"医療概論") {
            path = [bundle pathForResource:@"MondaiData2.1" ofType:@"txt"];
        }
        
        if (mylabel1.text == @"人体構造・機能論") {
            path = [bundle pathForResource:@"MondaiData2.2" ofType:@"txt"];
        }
        
        if (mylabel1.text == @"臨床医学総論") {
            path = [bundle pathForResource:@"MondaiData2.3" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論I") {
            path = [bundle pathForResource:@"MondaiData1.4" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論II") {
            path = [bundle pathForResource:@"MondaiData2.5" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論III") {
            path = [bundle pathForResource:@"MondaiData2.6" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論IV") {
            path = [bundle pathForResource:@"MondaiData2.7" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論V") {
            path = [bundle pathForResource:@"MondaiData2.8" ofType:@"txt"];
        }
        
        if (mylabel1.text == @"臨床医学各論VI") {
            path = [bundle pathForResource:@"MondaiData2.9" ofType:@"txt"];
        }
        
        if (mylabel1.text == @"臨床医学各論VII") {
            path = [bundle pathForResource:@"MondaiData2.10" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論VII") {
            path = [bundle pathForResource:@"MondaiData2.11" ofType:@"txt"];
        }
        if (mylabel1.text == @"臨床医学各論VIII") {
            path = [bundle pathForResource:@"MondaiData2.12" ofType:@"txt"];
        }
       */
        
        // ファイルから読み込む
        [_quiz readFromFile:path];
    }
    
    // 2回目以降の場合があるので、出題済みの情報をクリアする
    [_quiz clear];
    
    // クイズ出題画面用のビューコントローラを取得する
    ItimonIttouStartView2 *viewController;
    viewController = [[ItimonIttouStartView2 alloc] init];
    
    
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
