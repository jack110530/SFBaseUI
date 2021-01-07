//
//  SFCollectionViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionViewController.h"
#import <SFMacro/SFFunc.h>
#import <Masonry/Masonry.h>

@interface SFCollectionViewController ()
@property (nonatomic,strong) SFCollectionView *collectionView;
@end

@implementation SFCollectionViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - config UI
- (void)customUI {
    [super customUI];
    self.layout = [[UICollectionViewFlowLayout alloc]init];
}


#pragma mark - customLayout
- (void)viewWillLayoutSubviews {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super viewWillLayoutSubviews];
}


#pragma mark - setter
- (void)setLayout:(UICollectionViewLayout *)layout {
    _layout = layout;
    if (self.collectionView) {
        [self.collectionView removeFromSuperview];
    }
    self.collectionView = [[SFCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}



@end
