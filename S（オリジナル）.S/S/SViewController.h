//
//  SViewController.h
//  S
//
//  Created by 比嘉　和之 on 11/07/15.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SViewController : UIViewController {
    
    IBOutlet UIButton *mybutton1;
    IBOutlet UIButton *mybutton2;
    IBOutlet UIButton *mybutton3;
    IBOutlet UILabel *mylabel;
}
- (IBAction)itimonittou:(id)sender;
- (IBAction)kategori:(id)sender;
- (IBAction)minigame:(id)sender;

@end
