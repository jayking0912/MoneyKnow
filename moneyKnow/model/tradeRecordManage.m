//
//  tradeRecordManage.m
//  moneyKnow
//
//  Created by pi on 22/04/2018.
//  Copyright © 2018 jayking. All rights reserved.
//

#import "tradeRecordManage.h"
#import <sqlite3.h>
#import "tradeRecord.h"

@implementation tradeRecordManage

// static的作用：能保证_db这个变量只被IWStudentTool.m直接访问
static sqlite3 *_db;

// 初始化数据库（这个方法只在首次调用该类时调用）
+ (void)initialize
{
    // 0.获得沙盒中的数据库文件名
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tradeRecord.sqlite"];
    
    // 1.创建(打开)数据库（如果数据库文件不存在，会自动创建）
    int result = sqlite3_open(filename.UTF8String, &_db);
    if (result == SQLITE_OK) {
        NSLog(@"成功打开数据库");
        
        // 2.创表
        const char *sql = "create table if not exists t_Record (id integer primary key autoincrement, stockNum text, stockName text, strikePrice REAL, amount REAL, tradeDate text);";
        char *errorMesg = NULL;
        int result = sqlite3_exec(_db, sql, NULL, NULL, &errorMesg);
        if (result == SQLITE_OK) {
            NSLog(@"成功创建t_Record表");
        } else {
            NSLog(@"创建t_Record表失败:%s", errorMesg);
        }
    } else {
        NSLog(@"打开数据库失败");
    }
}

//添加一条记录
+ (BOOL)addOneTradeRecord : (tradeRecord *) tradeRecord{
    NSString *sql = [NSString stringWithFormat:@"insert into t_Record (stockNum, stockName, strikePrice, amount, tradeDate) values(%@, %@, %f, %f, %@);", tradeRecord.stockNum, tradeRecord.stockName, tradeRecord.strikePrice, tradeRecord.amount, tradeRecord.tradeDate];
    
    char *errorMesg = NULL;
    // sql.UTF8String: 将OC的sql转为C语句
    int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMesg);
    
    return result == SQLITE_OK;
}

//查询所有
+ (NSArray *) AllTradeRecord{
    // 0.定义数组
    NSMutableArray *tradeRecordArray = nil;
    
    // 1.定义sql语句
    const char *sql = "select id, stockNum, stockName, strikePrice, amount, tradeDate from t_Record;";
    // 2.定义一个stmt存放结果集
    sqlite3_stmt *stmt = NULL;
    
    // 3.检测SQL语句的合法性
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"查询语句是合法的");
        tradeRecordArray = [NSMutableArray array];
        
        // 4.执行SQL语句，从结果集中取出数据
        while (sqlite3_step(stmt) == SQLITE_ROW) { // 真的查询到一行数据
            // 获得这行对应的数据
            
            tradeRecord *tradeRecord = [tradeRecord init];
            
            // 获得第0列的id
            tradeRecord.ID = sqlite3_column_int(stmt, 0);
            
            // 获得第1列的stockNum
            const unsigned char *stockNum = sqlite3_column_text(stmt, 1);
            tradeRecord.stockNum = [NSString stringWithUTF8String:(const char *)stockNum];
            
            // 获得第2列的stockName
            const unsigned char *stockName = sqlite3_column_text(stmt, 2);
            tradeRecord.stockName = [NSString stringWithUTF8String:(const char *)stockName];
            
            
            
            student.age = sqlite3_column_int(stmt, 2);
            
            // 添加到数组
            [students addObject:student];
        }
    } else {
        NSLog(@"查询语句非合法");
    }
    
    return tradeRecord;
}

@end
