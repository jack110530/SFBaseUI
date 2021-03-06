//
//  SFCollectionViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFCollectionViewController : SFViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong,readonly) UICollectionView *collectionView;
- (instancetype)initWithLayout:(UICollectionViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
