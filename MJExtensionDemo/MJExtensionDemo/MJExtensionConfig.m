//
//  MJExtensionConfig.m
//  MJExtensionDemo
//
//  Created by 1 on 16/5/12.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import "MJExtensionConfig.h"

#import "MJExtension.h"

#import "SPYPerson.h"

#import "SPYBook.h"
@implementation MJExtensionConfig
/**
 *  这个方法会在MJExtensionConfig加载进内存时调用一次
 */


+(void)load{
#pragma mark 如果使用NSObject来调用这些方法，代表所有继承自NSObject的类都会生效
#pragma mark NSObject中的ID属性对应着字典中的id
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 @"ID":@"id"
                 };
        
    }];
    
    
    
    
    
    
    
    [SPYPerson mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 //             @"ID":@"id",
                 @"desc":@"description",
                 @"nowName":@"name.newName",
                 @"oldName":@"name.oldName",
                 @"nameChangeTime":@"name.info[1].nameChangeTime",
                 @"cup":@"other.cup"
                 };
    }];
    
    
    
    
    #pragma mark MJBook的日期处理、字符串nil值处理

    [SPYBook mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
       
        if ([property.name isEqualToString:@"publisher"]) {
            if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]]) {
                return @"";
                
            }
        }else if (property.type.typeClass == [NSDate class]){
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            formatter.dateFormat = @"yyy-MM-dd";
            
            return [formatter dateFromString:oldValue];
            
        }
        
        
        return oldValue;

        
        
        
    }];
    
    
    
    
}




@end
