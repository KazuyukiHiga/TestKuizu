//
//  QuizItem.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "QuizItem2.h"


@implementation QuizItem2



// インスタンス変数とプロパティの設定
@synthesize question;
@synthesize rightAnswer;
@synthesize choicesArray;

// 初期化処理
- (id)init
{
    self = [super init];
    if (self)
    {
        // インスタンス変数を初期化
        question = nil;
        rightAnswer = nil;
        choicesArray = nil;
    }
    return self;
}

// 解放処理
- (void)dealloc
{
    [question release];
    [rightAnswer release];
    [choicesArray release];
    [super dealloc];
}

// 選択肢を入れ替えた配列を返す
- (NSArray *)randomChoicesArray
{
   /* // 並び替えた選択肢の格納先の配列
    NSMutableArray *newArray = [NSMutableArray array];
    */
    
    // 取り出す前の選択肢を格納した配列
    NSMutableArray *remainArray;
    remainArray = [NSMutableArray arrayWithArray:self.choicesArray];
    
  /*  // すべて取り出すまで繰り返す
    while ([remainArray count] > 0)
    {

        NSInteger ind;
        ind = [remainArray count];
        
        // 配列から取り出して、並び替えた配列に格納する
        [newArray addObject:[remainArray objectAtIndex:ind]];
        
        // 取り出す前の配列から削除する
        [remainArray removeObjectAtIndex:ind];
    }
   */
    
    return remainArray;
}

// 答えがあっているかチェックするメソッド
- (BOOL)checkIsRightAnswer:(NSString *)answer
{
    // プロパティ「rightAnswer」と文字列を比較して一致すれば正解
    return [self.rightAnswer isEqualToString:answer];
    
}




@end

