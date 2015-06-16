//
//  kaitouView.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItimonIttouStartView;

@interface kaitouView2 : UIViewController {
    ItimonIttouStartView *kai;
    IBOutlet UILabel *tokutenlabel;
}
@property (nonatomic,retain) ItimonIttouStartView *kai;


-(void)setseiseki;

-(void)show;

@property (nonatomic, retain) IBOutlet UILabel *tokutenlabel;

- (IBAction)top:(id)sender;


@end
