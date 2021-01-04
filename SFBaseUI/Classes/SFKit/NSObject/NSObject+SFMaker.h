//
//  NSObject+SFMaker.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import <Foundation/Foundation.h>
#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SFMaker)

@property (nonatomic, weak) SFMaker *maker;
- (SFMaker *)make;
+ (SFMaker *)make;

@end

NS_ASSUME_NONNULL_END
