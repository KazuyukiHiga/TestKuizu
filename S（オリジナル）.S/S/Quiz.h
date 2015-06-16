//
//  Quiz.h
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizItem;
@interface Quiz : NSObject {
    NSArray *quizItemsArray;       // クイズデータの配列
    NSMutableArray *usedQuizItems; // 出題済みの配列
}
// プロパティの定義
@property (retain, nonatomic) NSArray *quizItemsArray;
@property (readonly, nonatomic) NSMutableArray *usedQuizItems;


// 次の問題を返すメソッド
- (QuizItem *)nextQuiz;

// 出題済みの情報をクリアするメソッド
- (void)clear;

// データファイルからクイズデータを読み込むメソッド
- (BOOL)readFromFile:(NSString *)filePath;

@end
