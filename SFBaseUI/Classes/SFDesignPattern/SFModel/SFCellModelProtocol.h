//
//  SFCellModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFCellModelProtocol <NSObject>

@required
@property (nonatomic, strong) NSNumber *sf_height;
@property (nonatomic, strong) NSNumber *sf_estimatedHeight;




@end

NS_ASSUME_NONNULL_END
