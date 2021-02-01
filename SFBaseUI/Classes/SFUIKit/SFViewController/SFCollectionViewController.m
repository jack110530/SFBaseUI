//
//  SFCollectionViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionViewController.h"
#import <Masonry/Masonry.h>

@interface SFCollectionViewController ()
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation SFCollectionViewController


- (instancetype)initWithLayout:(UICollectionViewLayout *)layout {
    if (self = [super init]) {
        [self customCollectionViewWithLayout:layout];
    }
    return self;
}
- (void)customCollectionViewWithLayout:(UICollectionViewLayout *)layout {
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.collectionView) {
        UICollectionViewLayout *layout = [[UICollectionViewLayout alloc]init];
        [self customCollectionViewWithLayout:layout];
    }
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



@end
