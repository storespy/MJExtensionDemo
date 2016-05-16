//
//  SPYState.h
//  MJExtensionDemo
//


//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SPYType.h"
#import "SPYDetail.h"

@interface SPYState : NSObject

@property (nonatomic,copy) NSString *banner;
@property (nonatomic,strong) SPYType *type;
@property (nonatomic,strong) SPYDetail *detail;

@end

