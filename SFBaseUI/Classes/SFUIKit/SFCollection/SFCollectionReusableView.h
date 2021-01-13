//
//  SFCollectionReusableView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "SFCustomUIProtocol.h"
#import "SFCollectionViewReusedProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface SFCollectionReusableView : UICollectionReusableView<SFCustomUIProtocol,SFCollectionViewReusedProtocol>

@end

NS_ASSUME_NONNULL_END
