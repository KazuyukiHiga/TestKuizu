//
//  kaitouView.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//test

#import <UIKit/UIKit.h>
@class ItimonIttouStartView;

@interface kaitouView : UIViewController {
    IBOutlet UILabel *mylabel;
    IBOutlet UILabel *mylabel1;
    ItimonIttouStartView *kai;
}
@property (nonatomic,retain) ItimonIttouStartView *kai;


-(void)setseiseki;

-(void)show;

-(IBAction)top;



@end
