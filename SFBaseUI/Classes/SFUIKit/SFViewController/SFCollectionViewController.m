//
//  SFCollectionViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionViewController.h"

@interface SFCollectionViewController ()
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation SFCollectionViewController


- (instancetype)initWithLayout:(UICollectionViewLayout *)layout {
    if (self = [super init]) {
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    return self;
}

- (void)loadView {
    self.view = self.collectionView;
}



@end
