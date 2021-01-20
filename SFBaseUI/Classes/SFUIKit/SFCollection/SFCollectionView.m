//
//  SFCollectionView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionView.h"
#import "SFCollectionViewCell.h"
#import "SFCollectionReusableView.h"
#import <SFCategory/SFCategory.h>

@interface SFCollectionView ()
@property (nonatomic, strong) NSMutableSet *reuseIdentifierSet;
@end

@implementation SFCollectionView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self customUI];
    }
    return self;
}

#pragma mark - custom ui
- (void)customUI {
    // 自定义UI
    self.backgroundColor = [UIColor whiteColor];
    [self sf_registerHeader:[SFCollectionReusableView class]];
    [self sf_registerFooter:[SFCollectionReusableView class]];
}

#pragma mark - custom layout
- (void)layoutSubviews {
    // 自定义布局
    [super layoutSubviews];
}

#pragma mark - 重用队列
// MARK: 注册cell
/// 注册cell
/// @param cell cell类对象
- (void)sf_registerCell:(nullable Class<SFReusedProtocol>)cell {
    [self sf_registerCells:@[cell]];
}

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells {
    for (Class cell in cells) {
        [self registerClass:cell forCellWithReuseIdentifier:[cell sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[cell sf_reuseIdentifier]];
    }
}

/// 注册cell（nib）
/// @param cell cell类对象
- (void)sf_registerNibCell:(nullable Class<SFReusedProtocol>)cell {
    [self sf_registerNibCells:@[cell]];
}

/// 注册cell（nib）
/// @param cells cell类对象（数组）
- (void)sf_registerNibCells:(NSArray<Class<SFReusedProtocol>> *)cells {
    for (Class cell in cells) {
        [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellWithReuseIdentifier:[cell sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[cell sf_reuseIdentifier]];
    }
}

// MARK: 注册header
/// 注册header
/// @param header header类对象
- (void)sf_registerHeader:(nullable Class<SFCollectionViewReusedProtocol>)header {
    [self sf_registerHeaders:@[header]];
}

/// 注册header
/// @param headers header类对象（数组）
- (void)sf_registerHeaders:(NSArray<Class<SFCollectionViewReusedProtocol>> *)headers {
    for (Class header in headers) {
        [self registerClass:header forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[header sf_reuseIdentifier]];
    }
}

/// 注册header（nib）
/// @param header header类对象
- (void)sf_registerNibHeader:(nullable Class<SFCollectionViewReusedProtocol>)header {
    [self sf_registerNibHeaders:@[header]];
}

/// 注册header（nib）
/// @param headers header类对象（数组）
- (void)sf_registerNibHeaders:(NSArray<Class<SFCollectionViewReusedProtocol>> *)headers {
    for (Class header in headers) {
        [self registerNib:[UINib nibWithNibName:header.sf_className bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[header sf_reuseIdentifier]];
    }
}

// MARK: 注册footer
/// 注册footer
/// @param footer footer类对象
- (void)sf_registerFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer {
    [self sf_registerFooters:@[footer]];
}

/// 注册footer
/// @param footers footer类对象（数组）
- (void)sf_registerFooters:(NSArray<Class<SFCollectionViewReusedProtocol>> *)footers {
    for (Class footer in footers) {
        [self registerClass:footer forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[footer sf_reuseIdentifier]];
    }
}

/// 注册footer（nib）
/// @param footer footer类对象
- (void)sf_registerNibFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer {
    [self sf_registerNibFooters:@[footer]];
}

/// 注册footer（nib）
/// @param footers footer类对象（数组）
- (void)sf_registerNibFooters:(NSArray<Class<SFCollectionViewReusedProtocol>> *)footers {
    for (Class footer in footers) {
        [self registerNib:[UINib nibWithNibName:footer.sf_className bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[footer sf_reuseIdentifier]];
    }
}

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UICollectionViewCell *)sf_dequeueCell:(nullable Class<SFCollectionViewReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:[cell sf_reuseIdentifier] forIndexPath:indexPath];
}

/// 出队header
/// @param header header类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueHeader:(nullable Class<SFCollectionViewReusedProtocol>)header kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[header sf_reuseIdentifier] forIndexPath:indexPath];
    }else{
        return [self sf_dequeuePlaceHeaderOrFooterWithKind:kind indexPath:indexPath];
    }
}

/// 出队footer
/// @param footer footer类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[footer sf_reuseIdentifier] forIndexPath:indexPath];
    }else{
        return [self sf_dequeuePlaceHeaderOrFooterWithKind:kind indexPath:indexPath];
    }
}

/// 出队占位header/footer
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeuePlaceHeaderOrFooterWithKind:(NSString *)kind indexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[SFCollectionReusableView sf_reuseIdentifier] forIndexPath:indexPath];
    }else{
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[SFCollectionReusableView sf_reuseIdentifier] forIndexPath:indexPath];
    }
}

#pragma mark - getter
- (NSMutableSet *)reuseIdentifierSet {
    if (!_reuseIdentifierSet) {
        _reuseIdentifierSet = [NSMutableSet set];
    }
    return _reuseIdentifierSet;
}


@end
