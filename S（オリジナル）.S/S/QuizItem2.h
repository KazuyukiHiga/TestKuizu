//
//  QuizItem.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuizItem2 : NSObject {
    NSString *question;    // 問題文
    NSString *rightAnswer; // 正解
    NSArray *choicesArray; // 選択肢の配列
    
}
// プロパティの定義
@property (retain, nonatomic) NSString *question;
@property (retain, nonatomic) NSString *rightAnswer;
@property (retain, nonatomic) NSArray *choicesArray;
@property (readonly, nonatomic) NSArray *randomChoicesArray;

// 答えがあっているかチェックするメソッド
- (BOOL)checkIsRightAnswer:(NSString *)answer;

@end
