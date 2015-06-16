//
//  ItimonIttouView.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz;
@interface ItimonIttouView : UIViewController {
    Quiz *_quiz; //クイズデータの管理用
    IBOutlet UILabel *mylabel1;
    NSString *dispStr;
}
@property (nonatomic,retain) NSString *dispStr;

-(IBAction)startQuiz:(id)sender;


-(IBAction)top;

-(int)gazouzousin;
-(void)numclea;
@end
