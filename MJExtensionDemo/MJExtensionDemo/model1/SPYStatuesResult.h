//
//  SPYStatuesResult.h
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPYStatuesResult : NSObject

/*
 @"totalNumber" : @"2016",
 @"previousCursor" : @"1234567890",
 @"nextCursor" : @"0987654321"

 */

@property (nonatomic,strong) NSMutableArray *statuses;

@property (nonatomic,strong) NSArray *ads;

@property (nonatomic,strong) NSNumber *totalNumber;
@property (nonatomic,assign) long long previousCursor;
@property (nonatomic,assign) long long nextCursor;

@end
