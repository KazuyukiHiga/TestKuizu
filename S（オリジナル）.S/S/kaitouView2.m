//
//  kaitouView.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "kaitouView2.h"
#import "ItimonIttouStartView2.h"
#import "SViewController.h"

@implementation kaitouView2
@synthesize tokutenlabel;
@synthesize kai;


int numseikai;


- (IBAction)top:(id)sender
{
    SViewController *controller = 
    [[SViewController alloc]
     initWithNibName:@"SViewController" bundle:nil];
    
    controller.modalTransitionStyle = 
    UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
    [controller release];
    
    id obj = [[ItimonIttouStartView2 alloc] init];
    [obj risetnum2];
}


-(void)setseiseki
{   id obj = [[ItimonIttouStartView2 alloc] init];
    numseikai  = [obj seisekisend];
}

-(void)show
{   
    [self setseiseki];
    NSString *toii = [NSString stringWithFormat:@"%d",numseikai];
    tokutenlabel.text = toii;
    
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
    [tokutenlabel release];
    [super dealloc];
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
    [tokutenlabel release];
    tokutenlabel = nil;
   // [self setTop:nil];
    [self setTokutenlabel:nil];
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
