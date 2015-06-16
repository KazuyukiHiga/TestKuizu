//
//  KategoriView.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/18.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "KategoriView.h"
#import "ItimonIttou2.h"




@implementation KategoriView

-(IBAction)top
{
    [self dismissModalViewControllerAnimated:YES];
}

//セクションの数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//テーブルの行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //if (section == 0) {
    return myData1.count;
    
    //}
    /*else{
     return myData2.count;
     
     }*/
}

//ヘッダのタイトル
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // if (section == 0) {
    return @"診療情報管理基礎系";
    //}
    /*else{
     return @"医学基礎系";
     }*/
}

//行に表示するデータ
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //if(indexPath.section == 0){        
    cell.textLabel.text = [myData1 objectAtIndex:indexPath.row ];    
    //}/*else{
    //cell.textLabel.text = [myData2 objectAtIndex:indexPath.row ];    
    
    // }*/
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItimonIttou2 *detailViewController = 
    [[ItimonIttou2 alloc]
     initWithNibName:@"ItimonIttou2" bundle:nil];
    
    //if(indexPath.section == 0){        
    detailViewController.dispStr = [myData1 objectAtIndex:indexPath.row];
    
    /*}
     else{   detailViewController.dispStr = [myData2 objectAtIndex:indexPath.row];
     }*/
    
    detailViewController.modalTransitionStyle = 
    UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:detailViewController animated:YES];    
    [detailViewController release];
    
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
    
    myData1 = [[NSArray alloc] initWithObjects:
               @"病院基礎知識1",@"病院基礎知識2",@"病院基礎知識3",@"医療IT分野",@"医療統計分野",@"医療歴史",@"医療法律",nil];
    
    /* myData2 = [[NSArray alloc] initWithObjects:
     @"外国の医学",@"人体構造・機能論",@"臨床医学総論",@"臨床医学各論I",@"臨床医学各論II",@"臨床医学各論III",@"臨床医学各論IV",@"臨床医学各論V",@"臨床医学各論VI",@"臨床医学各論VII",@"臨床医学各論VII",@"臨床医学各論VIII",nil];
     */
    myTableView.dataSource = self;
    myTableView.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [myData1 release];
    // [myData2 release];
    [myTableView release];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
