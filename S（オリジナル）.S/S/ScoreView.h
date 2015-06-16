//
//  ScoreView.h
//  S
//
//  Created by 比嘉 和之 on 11/07/30.
//  Copyright 2011年 名桜大学. All rights reserved.
//test

#import <UIKit/UIKit.h>

@interface ScoreView : UIViewController {
    UILabel *tokutenlabel;
    UIImageView *myimage;
    UILabel *kansou;
    IBOutlet UIButton *topbutton;
    
}

- (IBAction)Top:(id)sender;
- (void)anime;
-(void)setlabel:(id)sender;


@property (nonatomic, retain) IBOutlet UILabel *tokutenlabel;
@property (nonatomic, retain) IBOutlet UIImageView *myimage;
@property (nonatomic, retain) IBOutlet UILabel *kansou;

@end
