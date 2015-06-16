//
//  Game.m
//  SotukenSInryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/30.
//  Copyritestght 2011 名桜大学. All rights reserved.
//

#import "Game.h"
#import "SViewController.h"
#import "GameStart.h"
#import "Quiz1.h"

@implementation Game

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

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)toi:(id)sender {
    SViewController *controller = 
    [[SViewController alloc]
     initWithNibName:@"SViewController" bundle:nil];
    
    controller.modalTransitionStyle = 
    UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];    
    [controller release];

}

- (IBAction)startgame:(id)sender {
       
    // クイズデータが読み込まれていないときは読み込む
    if (!_quiz)
    {
        // インスタンス作成
        _quiz = [[Quiz1 alloc] init];
        
        
        // クイズデータのファイルパスを取得する
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path;
        
        path = [bundle pathForResource:@"MondaiDataminigame"ofType:@"txt"];
        
        //ファイルから読み込む
        [_quiz readFromFile:path];
    }
    
    // 2回目以降の場合があるので、出題済みの情報をクリアする
    [_quiz clear];
    
    // クイズ出題画面用のビューコントローラを取得する
    GameStart *viewController;
    viewController = [[GameStart alloc] init];
    
    // クイズ情報を設定する
    [viewController setQuiz:_quiz];
    
    //クイズ出題画面を表示する
    [self presentModalViewController:viewController
                            animated:YES];
    [viewController release];
    //[self riset:nil];
    
}



@end
