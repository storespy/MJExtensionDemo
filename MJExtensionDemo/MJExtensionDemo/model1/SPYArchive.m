//
//  SPYArchive.m
//  MJExtensionDemo
//
//  Created by 1 on 16/5/12.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import "SPYArchive.h"
#import "MJExtension.h"

@implementation SPYArchive

/**
 归档的实现
 */

MJExtensionCodingImplementation


// NSCoding 实现 归档 解档
+ (NSArray *)mj_ignoredCodingPropertyNames{
    
//    return @[@"name"]; //返回 name 就不会对name进行归档
    return nil;
    

}

@end
