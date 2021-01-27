//
//  UICollectionView+SFReuse.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/26.
//

#import "UICollectionView+SFReuse.h"
#import <objc/runtime.h>
#import "NSObject+SFExtension.h"
#import "SFReusedProtocol.h"

@interface UICollectionView ()
@property (nonatomic, strong) NSMutableSet *reuseIdentifierSet;
@end

@implementation UICollectionView (SFReuse)

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
        if ([cell sf_loadFromNib]) {
            [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellWithReuseIdentifier:[cell sf_reuseIdentifier]];
        }else{
            [self registerClass:cell forCellWithReuseIdentifier:[cell sf_reuseIdentifier]];
        }
        [self.reuseIdentifierSet addObject:[cell sf_reuseIdentifier]];
    }
}


// MARK: 注册header
/// 注册header
/// @param header header类对象
- (void)sf_registerHeader:(nonnull Class<SFReusedProtocol>)header {
    [self sf_registerHeaders:@[header]];
}

/// 注册header
/// @param headers header类对象（数组）
- (void)sf_registerHeaders:(NSArray<Class<SFReusedProtocol>> *)headers {
    for (Class header in headers) {
        if ([header sf_loadFromNib]) {
            [self registerNib:[UINib nibWithNibName:header.sf_className bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier]];
        }else{
            [self registerClass:header forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier]];
        }
        [self.reuseIdentifierSet addObject:[header sf_reuseIdentifier]];
    }
}


// MARK: 注册footer
/// 注册footer
/// @param footer footer类对象
- (void)sf_registerFooter:(nonnull Class<SFReusedProtocol>)footer {
    [self sf_registerFooters:@[footer]];
}

/// 注册footer
/// @param footers footer类对象（数组）
- (void)sf_registerFooters:(NSArray<Class<SFReusedProtocol>> *)footers {
    for (Class footer in footers) {
        if ([footer sf_loadFromNib]) {
            [self registerNib:[UINib nibWithNibName:footer.sf_className bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier]];
        }else{
            [self registerClass:footer forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier]];
        }
        [self.reuseIdentifierSet addObject:[footer sf_reuseIdentifier]];
    }
}


// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UICollectionViewCell *)sf_dequeueCell:(nullable Class<SFReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:[cell sf_reuseIdentifier] forIndexPath:indexPath];
}

/// 出队header
/// @param header header类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueHeader:(nullable Class<SFReusedProtocol>)header kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier] forIndexPath:indexPath];
    }else{
        return nil;
    }
}

/// 出队footer
/// @param footer footer类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueFooter:(nullable Class<SFReusedProtocol>)footer kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier] forIndexPath:indexPath];
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
