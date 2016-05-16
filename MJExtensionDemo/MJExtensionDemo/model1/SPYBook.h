//
//  SPYBook.h
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPYBox;

@interface SPYBook : NSObject

@property (nonatomic,copy) NSString *name,*publisher;
@property (nonatomic,strong) NSDate *publishedTime;
@property (nonatomic,strong) SPYBox *box;


@end
