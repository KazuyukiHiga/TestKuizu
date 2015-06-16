//
//  KategoriView.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/18.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KategoriView : UIViewController 
    <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *myTableView;
    NSArray *myData1;
    NSArray *myData2;
}
-(IBAction)top;

@end
