//
//  tradeRecord.h
//  moneyKnow
//
//  Created by pi on 22/04/2018.
//  Copyright © 2018 jayking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tradeRecord : NSObject

@property (nonatomic,assign) int ID;
//股票号码
@property (nonatomic,copy) NSString *stockNum;
//股票名称
@property (nonatomic,copy) NSString *stockName;
//成交价
@property (nonatomic,assign) float strikePrice;
//成交金额
@property (nonatomic,assign) float amount;
//交易时间
@property (nonatomic,copy) NSString *tradeDate;

@end
