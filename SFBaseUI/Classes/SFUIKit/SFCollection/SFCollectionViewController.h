//
//  SFCollectionViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFViewController.h"
#import "SFCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFCollectionViewController : SFViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionViewLayout *layout;
@property (nonatomic,strong,readonly) SFCollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
