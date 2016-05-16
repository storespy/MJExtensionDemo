//
//  SPYPerson.h
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SPYCup.h"

@interface SPYPerson : NSObject
/*
 @"id":@"20",
 @"description":@"zhc.com",
 @"name":@{
 @"newName":@"spy",
 @"oldName":@"songpeiying",
 @"info":@[
 @"test_demo",
 @{@"nameChangeTime":@"2016-05-11"}
 ]
 },
 @"other":@{
 @"cup":@{@"name":@"cat",
 @"price":@"10￥"}
 }
 */

@property (nonatomic,copy) NSString *ID; // 需要  id  --> ID

@property (nonatomic,copy) NSString *desc; // description --> desc

@property (nonatomic,copy) NSString *nowName;
@property (nonatomic,copy) NSString *oldName;

@property (nonatomic,copy) NSString *nameChangeTime;

@property (nonatomic,strong) SPYCup *cup;


@property (nonatomic,strong) NSArray *books;

@end
