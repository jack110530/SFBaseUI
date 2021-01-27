//
//  UITableView+SFReuse.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/25.
//

#import "UITableView+SFReuse.h"
#import <objc/runtime.h>
#import "NSObject+SFExtension.h"
#import "SFReusedProtocol.h"

@interface UITableView ()
@property (nonatomic, strong) NSMutableSet *reuseIdentifierSet;
@end

@implementation UITableView (SFReuse)


#pragma mark - 重用队列
// MARK: 注册cell
/// 注册cell
/// @param cell cell类对象
- (void)sf_registerCell:(nonnull Class<SFReusedProtocol>)cell {
    [self sf_registerCells:@[cell]];
}

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells {
    for (Class cell in cells) {
        NSString *reuseIdentifier = [self getUsefulReuseIdentifierWithCls:cell];
        if ([cell sf_loadFromNib]) {
            [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellReuseIdentifier:reuseIdentifier];
        }else{
            [self registerClass:cell forCellReuseIdentifier:reuseIdentifier];
        }
        [self.reuseIdentifierSet addObject:reuseIdentifier];
    }
}


// MARK: 注册section
/// 注册section
/// @param section section类对象
- (void)sf_registerSection:(nonnull Class<SFReusedProtocol>)section {
    [self sf_registerSections:@[section]];
}

/// 注册section
/// @param sections section类对象（数组）
- (void)sf_registerSections:(NSArray<Class<SFReusedProtocol>> *)sections {
    for (Class section in sections) {
        NSString *reuseIdentifier = [self getUsefulReuseIdentifierWithCls:section];
        if ([section sf_loadFromNib]) {
            [self registerNib:[UINib nibWithNibName:section.sf_className bundle:nil] forHeaderFooterViewReuseIdentifier:reuseIdentifier];
        }else{
            [self registerClass:section forHeaderFooterViewReuseIdentifier:reuseIdentifier];
        }
        [self.reuseIdentifierSet addObject:reuseIdentifier];
    }
}


// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UITableViewCell *)sf_dequeueCell:(nullable Class<SFReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath {
    if (cell) {
        NSString *reuseIdentifier = [self getUsefulReuseIdentifierWithCls:cell];
        if (![self.reuseIdentifierSet containsObject:reuseIdentifier]) {
            [self sf_registerCell:cell];
        }
        return [self dequeueReusableCellWithIdentifier:[cell sf_reuseIdentifier] forIndexPath:indexPath];
    }else{
        return nil;
    }
}

/// 出队section
/// @param section section
- (nullable __kindof UITableViewHeaderFooterView *)sf_dequeueSection:(nullable Class<SFReusedProtocol>)section {
    if (section) {
        NSString *reuseIdentifier = [self getUsefulReuseIdentifierWithCls:section];
        if (![self.reuseIdentifierSet containsObject:reuseIdentifier]) {
            [self sf_registerSection:section];
        }
        return [self dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    }else{
        return nil;
    }
}


#pragma mark - func
- (NSString *)getUsefulReuseIdentifierWithCls:(nonnull Class<SFReusedProtocol>)cls {
    return [cls sf_reuseIdentifier]?:cls.sf_className;
}


#pragma mark - getter
- (NSMutableSet *)reuseIdentifierSet {
    NSMutableSet *set = objc_getAssociatedObject(self, @selector(reuseIdentifierSet));
    if (!set) {
        set = [NSMutableSet set];
        objc_setAssociatedObject(self, @selector(reuseIdentifierSet), set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return set;
}


@end
