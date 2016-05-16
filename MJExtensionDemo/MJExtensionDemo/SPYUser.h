//
//  SPYUser.h
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    SexMale,
    SexFemale
} Sex;
@interface SPYUser : NSObject

/*
 @"name":@"spy",
 @"icon":@"head.png",
 @"email":@"350867726@qq.com",
 @"height":@1.55,
 @"sex":@(SexFemale),

 */

@property (nonatomic,copy) NSString *name,*icon,*email;

@property (nonatomic,strong) NSNumber *height;   // %@   NSNumber 类型，用strong  存储到字典中，解析后是打包的数据

@property (nonatomic,assign) Sex sex;  // %d 枚举用  assign


@end
