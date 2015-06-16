//
//  Quiz.m
//  SinryouJyouhou
//
//  Created by 比嘉　和之 on 11/06/07.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import "Quiz.h"
#import "QuizItem.h"

@implementation Quiz

// プロパティとインスタンス変数の設定
@synthesize quizItemsArray;
@synthesize usedQuizItems;


// 初期化処理
- (id)init
{
    self = [super init];
    if (self)
    {
        // インスタンス変数の初期化
        quizItemsArray = nil;
        usedQuizItems = [[NSMutableArray alloc] init];
    }
    return self;
}

// 解放処理
- (void)dealloc
{
    [quizItemsArray release];
    [usedQuizItems release];
    [super dealloc];
}

// 次の問題を返すメソッド
- (QuizItem *)nextQuiz
{
    // 使用していない問題の配列を作成する
    NSMutableArray *tempArray;
    tempArray = [NSMutableArray arrayWithArray:self.quizItemsArray];
    [tempArray removeObjectsInArray:usedQuizItems];
    
    // 既にすべて出題済みのときは「nil」を返して終了
    if ([tempArray count] == 0)
        return nil;
    
    // 返す問題を決定する
    NSInteger ind = random() % [tempArray count];
    
    // 返す問題を取得する
    QuizItem *item = [tempArray objectAtIndex:ind];
    
    // 使用済みの配列に追加する
    [usedQuizItems addObject:item];
    
    // 取得した問題を返す
    return item;
}

// 出題済みの情報をクリアするメソッド
- (void)clear
{
    // 出題済みの配列を空にする
    [usedQuizItems removeAllObjects];
}

// データファイルからクイズデータを読み込むメソッド
- (BOOL)readFromFile:(NSString *)filePath
{
    
    
    id str = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if (!str)
        return NO;  // 読み込み失敗
    
    // 改行文字で分割する
    NSArray *lineArray = [str componentsSeparatedByString:@"\n"];
    if (!lineArray || [lineArray count] == 0)
        return NO; // ファイルの内容が正しくない
    
    // ファイルの内容を解析する
    NSMutableArray *newItemsArray = [NSMutableArray array];
    QuizItem *curItem = nil;
    NSMutableArray *curChoices = nil;
    
    for (NSString *line in lineArray)
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        // 空白行の時はブロックの終了
        if ([line length] == 0)
        {
            if (curItem && curChoices)
            {
                // 選択肢を設定
                [curItem setChoicesArray:curChoices];
                
                // 配列にクイズデータを追加
                [newItemsArray addObject:curItem];
            }
            
            // 解放する
            [curItem release];
            [curChoices release];
            curItem = nil;
            curChoices = nil;
        }
        else
        {
            // 作成中の「QuizItem」クラスのインスタンスがなければ確保する
            if (!curItem)
            {
                curItem = [[QuizItem alloc] init];
                curChoices = [[NSMutableArray alloc] init];
            }
            
            // プロパティ「question」が設定されていないときは
            // この行は問題文
            if (!curItem.question)
            {
                [curItem setQuestion:line];
            }
            else
            {
                // プロパティ「rightAnswer」が設定されていないときは
                // この行は正解
                if (!curItem.rightAnswer)
                {
                    [curItem setRightAnswer:line];
                }
                
                // 選択肢の配列に追加
                [curChoices addObject:line];
            }
        }
        
        [pool release];
    }
    
    // 最後のクイズデータを登録する
    if (curItem && curChoices)
    {
        // 選択肢を設定
        [curItem setChoicesArray:curChoices];
        
        // 配列にクイズデータを追加
        [newItemsArray addObject:curItem];
    }
    
    // インスタンス変数に設定する
    [self setQuizItemsArray:newItemsArray];
     // 解放する
    [curItem release];
    [curChoices release];
    
    return YES;
}

@end

