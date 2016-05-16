//
//  SPYReplaceName.m
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import "SPYReplaceName.h"

#import "MJExtension.h"

@implementation SPYReplaceName

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    
    
    
    return [propertyName mj_underlineFromCamel];  // 驼峰转换为下划线
}

@end
