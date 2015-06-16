//
//  kaitouView.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "kaitouView.h"
#import "ItimonIttouStartView.h"
#import "SViewController.h"

@implementation kaitouView
@synthesize kai;


int numseikai;
int num24;

-(IBAction)showbutton
{
    [self show];
}

-(IBAction)top
{
    SViewController *controller = 
    [[SViewController alloc]
     initWithNibName:@"SViewController" bundle:nil];
    
    controller.modalTransitionStyle = 
    UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
    [controller release];
    
    id obj = [[ItimonIttouStartView alloc] init];
    [obj risetnum2];
    
}

-(void)setseiseki
{   id obj = [[ItimonIttouStartView alloc] init];
    numseikai  = [obj seisekisend];
    
}

-(void)show
{   
    [self setseiseki];
    NSString *toii = [NSString stringWithFormat:@"%d",numseikai];
    mylabel.text = toii;
    
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
    [super dealloc];
    [mylabel1 release];
    [mylabel release];
    [kai release];
    
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
    [self show];
    
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
