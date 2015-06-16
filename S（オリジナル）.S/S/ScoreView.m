//
//  ScoreView.m
//  S
//
//  Created by 比嘉 和之 on 11/07/30.
//  Copyright 2011年 名桜大学. All rights reserved.
//test

#import "ScoreView.h"
#import "SViewController.h"

@implementation ScoreView
@synthesize tokutenlabel;
@synthesize myimage;
@synthesize kansou;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self setlabel:nil];
    [self anime];    
    topbutton.alpha = 0.8;
}

- (void)viewDidUnload
{
    [self setTokutenlabel:nil];
    [self setMyimage:nil];
    [topbutton release];
    topbutton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//得点データを読み込み設定
- (IBAction)Top:(id)sender {
    
    SViewController *controller = [[SViewController alloc]initWithNibName:@"SViewController" bundle:nil];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];

}

- (void)anime
{
    NSArray *anime = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"sinruyu5.png"],
                      [UIImage imageNamed:@"sinruyu7.png"],
                      nil];
    
    myimage.animationImages = anime;
    
    //アニメーション速度
    myimage.animationDuration = 2.0;
    
    //アニメーション回数
    myimage.animationRepeatCount = 5;
    
    //アニメーション開始
    [myimage startAnimating];
    
       // timeCount = ttime;
   // [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(settime:) userInfo:nil repeats:YES];
    
    //アニメーショん終了
    //[myimageview stopAnimating];
    
    
}



-(void)setlabel:(id)sender
{
    
    NSUserDefaults *defults = [NSUserDefaults standardUserDefaults];
    NSString *dStr = [defults stringForKey:@"tokuten"];
    tokutenlabel.font = [UIFont systemFontOfSize:80];
    tokutenlabel.text = dStr;
    
    
    int d = [dStr intValue];
    if (d >= 0 && d<= 300) {
        kansou.text = @"もっと頑張りましょう";
    }
    if (d >= 301 && d<= 700) {
        kansou.text = @"よく出来ました。";
    }
    if(d >= 701){
        kansou.text = @"大変良く出来ました。";
    }
    /*
     NSBundle *bundle = [NSBundle mainBundle];
     NSString *path;
     
     path = [bundle pathForResource:@"save" ofType:@"txt"];
     
     tokutenlabel.text = path;
     */
    
}


- (void)dealloc {
    [tokutenlabel release];
    [myimage release];
    [kansou release];
    [topbutton release];
    [super dealloc];
}
@end
