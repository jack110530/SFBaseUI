//
//  SFTableViewViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFTableView.h"
#import "SFTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewViewModel : NSObject
@property (nonatomic, strong) SFTableViewModel *tableModel;

#pragma mark - init
+ (instancetype)viewModelWithTableView:(SFTableView *)tableView;
- (instancetype)initWithTableView:(SFTableView *)tableView;


@end

NS_ASSUME_NONNULL_END
