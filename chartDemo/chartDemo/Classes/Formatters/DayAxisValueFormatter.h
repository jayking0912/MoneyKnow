//
//  DayAxisValueFormatter.h
//  ChartsDemo
//  Copyright © 2016 dcg. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ChartsDemo-Swift.h"
#import "chartDemo-Bridging-Header.h"

@interface DayAxisValueFormatter : NSObject <IChartAxisValueFormatter>

- (id)initForChart:(BarLineChartViewBase *)chart;

@end
