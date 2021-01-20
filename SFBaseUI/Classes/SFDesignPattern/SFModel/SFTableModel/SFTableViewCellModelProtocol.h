//
//  SFTableViewCellModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFTableViewCellModelProtocol <NSObject>

@required
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *estimatedHeight;

@end

NS_ASSUME_NONNULL_END
