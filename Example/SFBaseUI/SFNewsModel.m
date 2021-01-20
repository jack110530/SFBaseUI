//
//  SFNewsModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsModel.h"
#import <YYModel/YYModel.h>


@interface SFNewsModel ()


@end

@implementation SFNewsModel

@synthesize sf_viewCls;
@synthesize sf_viewModelCls;


#pragma mark - 模拟网络请求
+ (void)getWithPage:(NSInteger)page datasSuccess:(void(^)(NSArray<SFNewsModel *> *models))success {
    // 模拟数据库数据
    NSArray *db_datas = @[
        @{@"title":@"111", @"desc":@"3hiUE溶解过一会看素芬53若ewsdgyu6rthdfft5ewrgsdf富商大贾", @"img":@"img1", @"focus":@"0"},
        @{@"title":@"dfasdfasdfsafafds", @"desc":@"士大夫geyser3他未发生的广泛地三个地方", @"img":@"img2", @"focus":@"0"},
        @{@"title":@"33sdfdsafasfasdfsa3", @"desc":@"三定方案填完4二十世纪枯竭的冯绍峰的味道反应热图书馆独一无二三个地方 炖粉条英文歌是", @"img":@"", @"focus":@"0"},
        @{@"title":@"4jytrgdfsv44", @"desc":@"索菲特玩5儿童单色光我放弃他因为如果", @"img":@"", @"focus":@"0"},
        @{@"title":@"5dsafasghjytgf55", @"desc":@"双方都", @"img":@"img4", @"focus":@"0"},
        @{@"title":@"6nhgfdsrtyuiujhgfdtyuyfghjhgfdfghgfd66", @"desc":@"玩5也调味感染服务乳液融合土豆丝", @"img":@"", @"focus":@"0"},
        @{@"title":@"dfgjhgfbvdtyrdrf", @"desc":@"二外5也太华润苏果法人为", @"img":@"", @"focus":@"0"},
        @{@"title":@"ddd", @"desc":@"顺风达太猥琐", @"img":@"", @"focus":@"0"},
        @{@"title":@"sssssssssssssssss", @"desc":@"是大法官核反应堆天然色啊", @"img":@"img2", @"focus":@"0"},
        @{@"title":@"ddddddd", @"desc":@"SADFGJHEGRWAF启动5热度发个图", @"img":@"", @"focus":@"0"},
        @{@"title":@"ddddd", @"desc":@"接电话发生过", @"img":@"", @"focus":@"0"},
        @{@"title":@"iuytrfvbre", @"desc":@"一用太热气", @"img":@"", @"focus":@"0"},
        @{@"title":@"ddfyurtydhgfbdvs65trgedshtregvdstgrf", @"desc":@"来科技园还挺热我出去下", @"img":@"", @"focus":@"0"},
        @{@"title":@"对光反射范德萨发给我特工人数", @"desc":@"9876543", @"img":@"", @"focus":@"0"},
        @{@"title":@"水电费人", @"desc":@"开奖号刚发的速运通", @"img":@"", @"focus":@"0"},
        @{@"title":@"史蒂夫我二姐一伙人图书馆的", @"desc":@"门板不趁现在", @"img":@"img8", @"focus":@"0"},
        @{@"title":@"豆沙粉564野人谷发单人46阳光房大色堂", @"desc":@"一一头热非编辑", @"img":@"", @"focus":@"0"},
        @{@"title":@"文文的割发代首法国人", @"desc":@"-0987突然发VB能尽快i", @"img":@"img6", @"focus":@"0"},
        @{@"title":@"很简单分公司二哥锋45657玉皇阁fdt", @"desc":@"765热电厂VB胡一套房", @"img":@"", @"focus":@"0"},
        @{@"title":@"2345投入翻到的我天天软文565789😯以晕refqdwerty6u7jytgdfsdrtrtssd", @"desc":@"科技化贵夫人67一", @"img":@"", @"focus":@"0"},
        @{@"title":@"十二宫5个人范德法特", @"desc":@"第三位456一公分の人", @"img":@"img5", @"focus":@"0"},
    ];
    
    NSInteger pageSize = 3;
    
    NSLog(@"数据加载中...");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"数据加载成功");
        // 网络请求的数据格式
        NSInteger location = page*pageSize;
        NSInteger length = pageSize;
        if (location+length >= db_datas.count) {
            length = db_datas.count - page*pageSize;
        }
        if (length <= 0) {
            if (success) {
                success(@[]);
            }
            return;
        }
        NSArray *response = [db_datas subarrayWithRange:NSMakeRange(location, length)];
        
        // 数据层-构造数据模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dic in response) {
            NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithDictionary:dic];
            NSString *img = newDic[@"img"]?:@"";
            if ([img isEqualToString:@""]) {
                [newDic setObject:NSClassFromString(@"SFNewsCell1") forKey:@"sf_viewCls"];
                [newDic setObject:NSClassFromString(@"SFNewsCell1ViewModel") forKey:@"sf_viewModelCls"];
            }else{
                [newDic setObject:NSClassFromString(@"SFNewsCell2") forKey:@"sf_viewCls"];
                [newDic setObject:NSClassFromString(@"SFNewsCell2ViewModel") forKey:@"sf_viewModelCls"];
            }
            [newDic setObject:[NSNumber numberWithFloat:UITableViewAutomaticDimension] forKey:@"height"];
            [newDic setObject:[NSNumber numberWithFloat:50] forKey:@"estimatedHeight"];
            
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
