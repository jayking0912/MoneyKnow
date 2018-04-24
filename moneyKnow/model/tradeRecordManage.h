//
//  tradeRecordManage.h
//  moneyKnow
//
//  Created by pi on 22/04/2018.
//  Copyright © 2018 jayking. All rights reserved.
//

#import <Foundation/Foundation.h>
@class tradeRecord;

@interface tradeRecordManage : NSObject

//添加

//添加一条记录
+ (BOOL)addOneTradeRecord : (tradeRecord *) tradeRecord;

//删除

//修改

//查询

//查询所有
+ (NSArray *) AllTradeRecord;



@end
