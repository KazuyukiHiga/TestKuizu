//
//  SViewController.m
//  S
//
//  Created by 比嘉　和之 on 11/07/15.
//  Copyright 2011 名桜大学. All rights reserved.
//test

#import "SViewController.h"
#import "ItimonIttouView.h"
#import "KategoriView.h"
#import "Game.h"
#import "kaitouView.h"
#import "ScoreView.h"


@implementation SViewController

- (void)dealloc
{
    [mybutton1 release];
    [mybutton2 release];
    [mybutton3 release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



- (void)viewDidLoad
{   
    //広告表示
   //TGAView *banner = [TGAView requestWithKey:"5S5HxnW0P04u" Position:420];
    //[self.view addSubview:banner];

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [mybutton1 release];
    mybutton1 = nil;
    [mybutton2 release];
    mybutton2 = nil;
    [mybutton3 release];
    mybutton3 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)itimonittou:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishedHelpButtonAnimation)];
    
    mybutton1.alpha = 0.0;
    mybutton1.transform = CGAffineTransformMakeScale(5.0, 5.0);
    
    [UIView commitAnimations];
    
}

- (IBAction)kategori:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishedHelpButtonAnimation1)];
    
    mybutton2.alpha = 0.0;
    mybutton2.transform = CGAffineTransformMakeScale(5.0, 5.0);
    
    [UIView commitAnimations];
}

- (IBAction)minigame:(id)sender {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishedHelpButtonAnimation2)];
    
    mybutton3.alpha = 0.0;
    mybutton3.transform = CGAffineTransformMakeScale(5.0, 5.0);
    
    [UIView commitAnimations];

}

- (void)finishedHelpButtonAnimation
{
    ItimonIttouView *controller = [[ItimonIttouView alloc]initWithNibName:@"ItimonIttouView" bundle:nil];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (void)finishedHelpButtonAnimation1
{
    KategoriView *controller = [[KategoriView alloc]initWithNibName:@"KategoriView" bundle:nil];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (void)finishedHelpButtonAnimation2
{
    Game *controller = [[Game alloc]initWithNibName:@"Game" bundle:nil];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}




- (void)viewWillAppear:(BOOL)animated
{
    mybutton1.alpha = 1.0;
    mybutton1.transform = CGAffineTransformIdentity;
    
    
    mybutton2.alpha = 1.0;
    mybutton2.transform = CGAffineTransformIdentity;
    
    
    mybutton3.alpha = 1.0;
    mybutton3.transform = CGAffineTransformIdentity;
    
}

@end
