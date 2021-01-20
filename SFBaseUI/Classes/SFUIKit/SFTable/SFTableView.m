//
//  SFTableView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFTableView.h"
#import <SFCategory/SFCategory.h>

@interface SFTableView ()
@property (nonatomic, strong) NSMutableSet *reuseIdentifierSet;
@end

@implementation SFTableView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self customUI];
    }
    return self;
}

#pragma mark - custom ui
- (void)customUI {
    // 自定义UI
    self.backgroundColor = [UIColor clearColor];
    self.separatorInset = UIEdgeInsetsZero;
    self.estimatedRowHeight = 44;
    self.rowHeight = UITableViewAutomaticDimension;
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
        [self registerClass:cell forCellReuseIdentifier:[cell sf_reuseIdentifier]];
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
        [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellReuseIdentifier:[cell sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[cell sf_reuseIdentifier]];
    }
}


// MARK: 注册section
/// 注册section
/// @param section section类对象
- (void)sf_registerSection:(nullable Class<SFTableViewReusedProtocol>)section {
    [self sf_registerSections:@[section]];
}

/// 注册section
/// @param sections section类对象（数组）
- (void)sf_registerSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections {
    for (Class section in sections) {
        [self registerClass:section forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[section sf_reuseIdentifier]];
    }
}

/// 注册section（nib）
/// @param section section类对象
- (void)sf_registerNibSection:(nullable Class<SFTableViewReusedProtocol>)section {
    [self sf_registerNibSections:@[section]];
}

/// 注册section（nib）
/// @param sections section类对象（数组）
- (void)sf_registerNibSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections {
    for (Class section in sections) {
        [self registerNib:[UINib nibWithNibName:section.sf_className bundle:nil] forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
        [self.reuseIdentifierSet addObject:[section sf_reuseIdentifier]];
    }
}

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UITableViewCell *)sf_dequeueCell:(nullable Class<SFTableViewReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [cell sf_reuseIdentifier];
    if (![self.reuseIdentifierSet containsObject:reuseIdentifier]) {
        if (cell.sf_loadFromNib) {
            [self sf_registerNibCell:cell];
        }else{
            [self sf_registerCell:cell];
        }
    }
    return [self dequeueReusableCellWithIdentifier:[cell sf_reuseIdentifier] forIndexPath:indexPath];
}

/// 出队section
/// @param section section
- (nullable __kindof UITableViewHeaderFooterView *)sf_dequeueSection:(nullable Class<SFTableViewReusedProtocol>)section {
    if (section) {
        NSString *reuseIdentifier = [section sf_reuseIdentifier];
        if (![self.reuseIdentifierSet containsObject:reuseIdentifier]) {
            [self sf_registerSection:section];
        }
        return [self dequeueReusableHeaderFooterViewWithIdentifier:[section sf_reuseIdentifier]];
    }else{
        return nil;
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
