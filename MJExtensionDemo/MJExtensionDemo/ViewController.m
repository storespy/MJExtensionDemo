//
//  ViewController.m
//  MJExtensionDemo
//
//  Created by 1 on 16/5/11.
//  Copyright © 2016年 com.taojin.iphone. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"

#import "SPYUser.h"

#import "SPYState.h"
#import "SPYType.h"
#import "SPYDetail.h"

#import "SPYStatuesResult.h"
#import "SPYAd.h"

#import "SPYPerson.h"
#import "SPYCup.h"

#import "SPYReplaceName.h"

#import "SPYBook.h"

#import "SPYArchive.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self dicToModel];
    
    
    
    [self jsonToModel];
    
    [self mutiDicToModel];
    
    
    [self dicToArrayToDic];
    
    [self dicToModelIdReplace];
    
    [self dicArrayToModelArray];
    
    [self modelToDic];
    
    [self modelArrayToDicArray];
    
    [self coreData];
    
    [self coding];
    
    [self replaceKeyFromPropertyName];
    
    [self newValueFromOldValue];
    
    [self logAllProperties];
  }

#pragma mark -  字典 --> 模型  mj_objectWithKeyValues
- (void)dicToModel{
    
    NSDictionary *dict = @{
                           @"name":@"spy",
                           @"icon":@"head.png",
                           @"email":@"350867726@qq.com",
                           @"height":@1.55, // NSNumber
                           @"sex":@(SexFemale),   // 在 SPYUser中定义的枚举类型
                           };
    
    SPYUser *user = [SPYUser mj_objectWithKeyValues:dict];
    MJExtensionLog(@"字典 --> 模型\n name = %@  \n icon = %@ \n email = %@ \n height = %@ \n sex = %d",user.name,user.icon,user.email,user.height,user.sex);
}

#pragma mark -  json --> 模型  mj_objectWithKeyValues
- (void)jsonToModel{
    
    
    // NSNumber
    // 在 SPYUser中定义的枚举类型
    NSString *jsonStr = @"{\"name\":\"spy\",\"icon\":\"head.png\",\"email\":\"350867726@qq.com\",\"height\":1.55,\"sex\":1}";
    
    SPYUser *user = [SPYUser mj_objectWithKeyValues:jsonStr];
    MJExtensionLog(@"json --> 模型\n name = %@  \n icon = %@ \n email = %@ \n height = %@ \n sex = %d",user.name,user.icon,user.email,user.height,user.sex);
    
}

#pragma mark -  复杂字典 --> 模型  mj_objectWithKeyValues
- (void)mutiDicToModel{
    
    
    // 分别为一重， 二重，三重
    NSDictionary *dict = @{
                           @"banner":@"产品代码",
                           @"type":@{
                                @"privated":@"定增",
                                @"pledge":@"股票"
                                },
                           @"detail":@{
                                 @"compony":@"zhc_baidu_jingdong_souhu",
                                 @"user":@{
                                      @"name":@"500人",
                                      @"icon":@"新地中心"
                                      }
                                }
                           };
    
    SPYState *state = [SPYState mj_objectWithKeyValues:dict];
    
    MJExtensionLog(@"一重\n state.banner = %@ \n satte.type = %@ \n state.detail = %@",state.banner,state.type,state.detail);
    
    NSString *compony = state.detail.compony;
    NSString *name  = state.detail.user.name;
    NSString *icon = state.detail.user.icon;
    MJExtensionLog(@"二重三重\n state.detail.compony = %@ \n state.detail.user.name = %@ \n state.detail.user.icon = %@",compony,name,icon);
    
    
}

#pragma mark -  字典 --> 数组 --> 字典 --> 模型  mj_objectWithKeyValues

- (void)dicToArrayToDic{
    
//    @{@[@{},@{}],@[@{},@{}],@"":@"",@"":@""};
    
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"banner":@"产品代码",
                               
                                       @"type":@{
                                               @"privated":@"定增",
                                               @"pledge":@"股票"
                                               },
                                     },
                                   @{
                                       @"banner":@"产品名称",
                                       
                                       @"type":@{
                                               @"privated":@"定增1",
                                               @"pledge":@"股票1"
                                               },
                                    }
                                   ],
                           @"ads" : @[
                                   @{
                                      @"image":@"ads0.png",
                                      @"url":@"http://www.jianshu.com"
                                    },
                                   @{
                                       @"image":@"ads1.png",
                                       @"url":@"http://www.jianshu_spy.com"

                                    }
                                    ],
                           @"totalNumber" : @"2016",
                           @"previousCursor" : @"1234567890",
                           @"nextCursor" : @"0987654321"
                                          };

    
    
    SPYStatuesResult *stateResult = [SPYStatuesResult mj_objectWithKeyValues:dict];
    
    NSLog(@"一重 \n totalNumber = %@ \n previousCursour = %lld \n nextCursor = %lld",stateResult.totalNumber,stateResult.previousCursor,stateResult.nextCursor);
    
    for (SPYState *state in stateResult.statuses) {
        
        NSString *banner =  state.banner;
        NSString *privated = state.type.privated;
        NSString *pledge = state.type.pledge;
        
        MJExtensionLog(@"数组一 \n state.banner = %@ \n state.type.privated = %@ \n state.type.pledge = %@",banner,privated,pledge);
        
    }
    
    
    for (SPYAd *ad in stateResult.ads) {
        NSString *image = ad.image;
        NSString *url = ad.url;
        
        MJExtensionLog(@"数组二 \n ad.image = %@ \n ad.url = %@",image,url);
    }
    
    
}


#pragma mark - 字典-->模型 （key 替换 id  ID）
- (void)dicToModelIdReplace{
    
    NSDictionary *dict = @{
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
                                         @"price":@10}
                                   }
                           };
    
    
    
    SPYPerson *person = [SPYPerson mj_objectWithKeyValues:dict];
    
    MJExtensionLog(@"字典-->模型 （key 替换 id  ID）\n ID = %@\n desc = %@ \n nowName = %@ \n oldName = %@ \n nameChangeTime = %@ \n ",person.ID,person.desc,person.nowName,person.oldName,person.nameChangeTime);
    
    MJExtensionLog(@"字典-->模型 （key 替换 id  ID） \n name = %@\n price = %f \n",person.cup.name,person.cup.price);
    
    
    
    
}

#pragma mark - 字典数组-->模型数组  mj_objectArrayWithKeyValuesArray
- (void)dicArrayToModelArray{
    
    NSArray *dictArray = @[
                           @{
                               @"name":@"500人",
                               @"icon":@"新地中心"
                            },
                           @{
                               @"name":@"1000人",
                               @"icon":@"雨花台"
                            }
                           ];
    
    
    NSArray *userArray = [SPYUser mj_objectArrayWithKeyValuesArray:dictArray];
    
    
    for (SPYUser *user in userArray) {
        MJExtensionLog(@"字典数组-->模型数组\n name = %@ \n icon = %@",user.name,user.icon);
    }
    
    
}

#pragma mark - 模型-->字典  mj_keyValues
- (void)modelToDic{
    
    
    //1. 新建模型 并 将模型转换为字典
    SPYType *type = [[SPYType alloc] init];
    type.privated = @"dz";
    type.pledge = @"gp";
    
    SPYState *state = [[SPYState alloc] init];
    state.type = type;
    state.banner = @"头视图";
    
    
    NSDictionary *stateDic = state.mj_keyValues;
    MJExtensionLog(@"模型-->字典  stateDic = %@",stateDic);
    MJExtensionLog(@"模型-->字典 banner = %@",[state mj_keyValuesWithKeys:@[@"banner"]]);
    
    
    
    //2. 新建多级映射模型
    SPYCup *cup = [[SPYCup alloc] init];
    cup.name = @"big cup";
    cup.price = 30.0;
    
    SPYPerson *person= [[SPYPerson alloc] init];
    person.ID = @"30";
    person.desc = @"beautiful";
    person.nowName = @"spy_";
    person.oldName = @"songpeiying_";
    person.nameChangeTime = @"2016_05_11_";
    person.books = @[@"等风来",@"等雨来",@"风雨来"];
    person.cup = cup;
    
    NSDictionary *personDic = person.mj_keyValues;
    MJExtensionLog(@"多级映射模型 personDic = %@",personDic);
    MJExtensionLog(@"多级映射模型 cup nowName oldName %@",[personDic mj_keyValuesWithIgnoredKeys:@[@"cup",@"nowName",@"oldName"]]);
    // 传入改方法后，不会收，上边字典-->模型中字典结构的影响
    [SPYPerson mj_referenceReplacedKeyWhenCreatingKeyValues:NO];
    MJExtensionLog(@"模型转字典时，字典的key参考replacedKeyFromPropertyName等方法:\n%@", person.mj_keyValues);

    
}

#pragma mark - 模型数组-->字典数组
- (void)modelArrayToDicArray{
    
        SPYUser *user = [[SPYUser alloc] init];
        user.name = @"spy";
        user.icon = @"spy.png";

    
    SPYUser *user1 = [[SPYUser alloc] init];
    user1.name = @"spy11______";
    user1.icon = @"spy.png11______";
    
    NSArray *usersArr = @[user,user1];
    NSArray *dictArray = [SPYUser mj_keyValuesArrayWithObjectArray:usersArr];
    MJExtensionLog(@"模型数组-->字典数组 dictArray = %@",dictArray);
    
}

#pragma mark - CoreData
- (void)coreData{
    
    NSDictionary *dict = @{@"name":@"spy",
                           @"icon":@"head.png",
                           @"email":@"350867726@qq.com",
                           @"height":@1.55, // NSNumber
                           @"sex":@(SexFemale),   // 在 SPYUser中定义的枚举类型
                           };
    
    
    NSManagedObjectContext *context = nil;
    SPYUser *user = [SPYUser mj_objectWithKeyValues:dict context:context];
    
    [context save:nil];
    
    MJExtensionLog(@" name = %@  \n icon = %@ \n email = %@ \n height = %@ \n sex = %d",user.name,user.icon,user.email,user.height,user.sex);
 
}

#pragma mark - NSCoding 归档
- (void)coding{
    
    SPYArchive *cup = [[SPYArchive alloc] init];
    cup.name = @"big cup";
    cup.price = 30.0;
    
      NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"cup.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:cup toFile:file];
    //解档
    SPYCup *decodeCup = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    MJExtensionLog(@"NSCoding 归档  name = %@, price = %f",decodeCup.name,decodeCup.price);
   
    NSLog(@"沙河路径 %@   临时路径 = %@", NSHomeDirectory(),NSTemporaryDirectory());
}

#pragma mark - 统一转换属性名（例如驼峰转换下划线）
- (void)replaceKeyFromPropertyName{
    
    NSDictionary *dict = @{
                           @"nick_name":@"漫长当下",
                           @"sale_price":@"300"
                           };
    
    SPYReplaceName *reN = [SPYReplaceName mj_objectWithKeyValues:dict];
    MJExtensionLog(@"统一转换属性名（例如驼峰转换下划线） \n nick_nae = %@ \n sale_price = %f",reN.nickName,reN.salePrice);
    

}

#pragma mark - date
- (void)newValueFromOldValue{
    
    NSDictionary *dict = @{
                           @"name":@"date",
                           @"publishedTime":@"2016-05-12"
                           };
    
    SPYBook *book = [SPYBook mj_objectWithKeyValues:dict];
    
    MJExtensionLog(@"date     name = %@ , publisher = %@, publishedTime = %@",book.name,book.publisher,book.publishedTime);
    
    
}
-(void)logAllProperties
{
    SPYUser *user = [[SPYUser alloc] init];
    user.name = @"MJ";
    user.sex = SexMale;
    user.icon = @"test.png";
    
    MJExtensionLog(@"%@", user);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
