//
//  SFNewsModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsModel.h"
#import <YYModel/YYModel.h>

@implementation SFNewsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cellModels":[SFNewsModel class]};
}

#pragma mark - 模拟网络请求
+ (void)getDatasSuccess:(void(^)(NSArray<SFNewsModel *> *models))success {
    NSLog(@"数据加载中...");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"数据加载成功");
        // 网络请求的数据格式
        NSArray *response = @[
            @{@"title":@"111", @"desc":@"3hiUE溶解过一会看素芬53若ewsdgyu6rthdfft5ewrgsdf富商大贾", @"img":@"img1"},
            @{@"title":@"dfasdfasdfsafafds", @"desc":@"士大夫geyser3他未发生的广泛地三个地方", @"img":@"img2"},
            @{@"title":@"33sdfdsafasfasdfsa3", @"desc":@"三定方案填完4二十世纪枯竭的冯绍峰的味道反应热图书馆独一无二三个地方 炖粉条英文歌是", @"img":@""},
            @{@"title":@"4jytrgdfsv44", @"desc":@"索菲特玩5儿童单色光我放弃他因为如果", @"img":@""},
            @{@"title":@"5dsafasghjytgf55", @"desc":@"双方都", @"img":@"img4"},
            @{@"title":@"6nhgfdsrtyuiujhgfdtyuyfghjhgfdfghgfd66", @"desc":@"玩5也调味感染服务乳液融合土豆丝", @"img":@""},
            @{@"title":@"dfgjhgfbvdtyrdrf", @"desc":@"二外5也太华润苏果法人为", @"img":@""},
            @{@"title":@"ddd", @"desc":@"顺风达太猥琐", @"img":@""},
            @{@"title":@"sssssssssssssssss", @"desc":@"是大法官核反应堆天然色啊", @"img":@"img2"},
            @{@"title":@"ddddddd", @"desc":@"SADFGJHEGRWAF启动5热度发个图", @"img":@""},
            @{@"title":@"ddddd", @"desc":@"接电话发生过", @"img":@""},
            @{@"title":@"iuytrfvbre", @"desc":@"一用太热气", @"img":@""},
            @{@"title":@"ddfyurtydhgfbdvs65trgedshtregvdstgrf", @"desc":@"来科技园还挺热我出去下", @"img":@""},
            @{@"title":@"对光反射范德萨发给我特工人数", @"desc":@"9876543", @"img":@""},
            @{@"title":@"水电费人", @"desc":@"开奖号刚发的速运通", @"img":@""},
            @{@"title":@"史蒂夫我二姐一伙人图书馆的", @"desc":@"门板不趁现在", @"img":@"img8"},
            @{@"title":@"豆沙粉564野人谷发单人46阳光房大色堂", @"desc":@"一一头热非编辑", @"img":@""},
            @{@"title":@"文文的割发代首法国人", @"desc":@"-0987突然发VB能尽快i", @"img":@"img6"},
            @{@"title":@"很简单分公司二哥锋45657玉皇阁fdt", @"desc":@"765热电厂VB胡一套房", @"img":@""},
            @{@"title":@"2345投入翻到的我天天软文565789😯以晕refqdwerty6u7jytgdfsdrtrtssd", @"desc":@"科技化贵夫人67一", @"img":@""},
            @{@"title":@"十二宫5个人范德法特", @"desc":@"第三位456一公分の人", @"img":@"img5"},
        ];
        
        // 数据层-构造数据模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dic in response) {
            NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:dic];
            NSString *img = newDic[@"img"]?:@"";
            if ([img isEqualToString:@""]) {
                [newDic setObject:NSClassFromString(@"SFNewsCell1") forKey:@"cls"];
            }else{
                [newDic setObject:NSClassFromString(@"SFNewsCell2") forKey:@"cls"];
            }
//            [newDic setObject:[NSNumber numberWithFloat:UITableViewAutomaticDimension] forKey:@"height"];
            
            // 数据转模型
            SFNewsModel *model = [SFNewsModel yy_modelWithDictionary:newDic];
            [models addObject:model];
        }
        if (success) {
            success(models.copy);
        }
    });
}

@end
