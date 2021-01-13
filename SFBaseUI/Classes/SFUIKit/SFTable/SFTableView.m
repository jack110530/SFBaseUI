//
//  SFTableView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFTableView.h"
#import <SFCategory/NSObject+SFExtension.h>

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
    [self registerClass:cell forCellReuseIdentifier:[cell sf_reuseIdentifier]];
}

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells {
    for (Class cell in cells) {
        [self registerClass:cell forCellReuseIdentifier:[cell sf_reuseIdentifier]];
    }
}

/// 注册cell（nib）
/// @param cell cell类对象
- (void)sf_registerNibCell:(nullable Class<SFReusedProtocol>)cell {
    [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellReuseIdentifier:[cell sf_reuseIdentifier]];
}

/// 注册cell（nib）
/// @param cells cell类对象（数组）
- (void)sf_registerNibCells:(NSArray<Class<SFReusedProtocol>> *)cells {
    for (Class cell in cells) {
        [self registerNib:[UINib nibWithNibName:cell.sf_className bundle:nil] forCellReuseIdentifier:[cell sf_reuseIdentifier]];
    }
}


// MARK: 注册section
/// 注册section
/// @param section section类对象
- (void)sf_registerSection:(nullable Class<SFTableViewReusedProtocol>)section {
    [self registerClass:section forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
}

/// 注册section
/// @param sections section类对象（数组）
- (void)sf_registerSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections {
    for (Class section in sections) {
        [self registerClass:section forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
    }
}

/// 注册section（nib）
/// @param section section类对象
- (void)sf_registerNibSection:(nullable Class<SFTableViewReusedProtocol>)section {
    [self registerNib:[UINib nibWithNibName:section.sf_className bundle:nil] forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
}

/// 注册section（nib）
/// @param sections section类对象（数组）
- (void)sf_registerNibSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections {
    for (Class section in sections) {
        [self registerNib:[UINib nibWithNibName:section.sf_className bundle:nil] forHeaderFooterViewReuseIdentifier:[section sf_reuseIdentifier]];
    }
}

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UITableViewCell *)dequeueCell:(nullable Class<SFTableViewReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithIdentifier:[cell sf_reuseIdentifier] forIndexPath:indexPath];
}

/// 出队section
/// @param section section
- (nullable __kindof UITableViewHeaderFooterView *)dequeueSection:(nullable Class<SFTableViewReusedProtocol>)section {
    if (section) {
        return [self dequeueReusableHeaderFooterViewWithIdentifier:[section sf_reuseIdentifier]];
    }else{
        return nil;
    }
}

@end
