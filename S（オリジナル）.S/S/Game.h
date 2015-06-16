//
//  Game.h
//  SotukenSInryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/30.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz1;

@interface Game : UIViewController {
    Quiz1 *_quiz; //クイズデータの管理用

}
- (IBAction)toi:(id)sender;
- (IBAction)startgame:(id)sender;

@end
