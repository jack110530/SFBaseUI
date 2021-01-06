//
//  SFFunc.h
//  SFMacro_Example
//
//  Created by 黄山锋 on 2020/12/20.
//  Copyright © 2020 jack110530. All rights reserved.
//

#ifndef SFFunc_h
#define SFFunc_h


// MARK: NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif


// MARK: 懒加载
#define SFLazyLoad(class, property, handle) \
- (class *)property {\
if (!_##property) {\
handle;\
}\
return _##property;\
}\


// MARK: 字符串拼接
#define SFStringFormat(fmt, ...) [NSString stringWithFormat:fmt, __VA_ARGS__]


// MARK: 本地化
#define SFLocalizedString(key) NSLocalizedStringFromTable(key, @"Localizable", nil)


// MARK: 判空处理
// 字符串是否为空
#define SFStringIsEmpty(str) ([str isEqualToString:@"null"] || [str isEqualToString:@"Null"] || [str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// 数组是否为空
#define SFArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
// 字典是否为空
#define SFDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
// 是否是空对象
#define SFObjectIsEmpty(_object) (_object == nil || [_object isKindOfClass:[NSNull class]] || ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) || ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


// MARK: weakself & strongself
// 弱引用
#undef  SFWeak
#define SFWeak(...)     @weakify(__VA_ARGS__)
#define SFWeakSelf      SFWeak(self);
// 强引用
#undef  SFStrong
#define SFStrong(...)   @strongify(__VA_ARGS__)
#define SFStrongSelf    SFStrong(self);


// MARK: 字体
#define SFFontSizeScale         (SFIsIPhone6Plus ? 1.2 : 1.0)
#define SFFontSize(value)       (value*SFFontSizeScale)
#define SFFont(value)           [UIFont systemFontOfSize:SFFontSize(value)]
#define SFFontBold(value)       [UIFont boldSystemFontOfSize:SFFontSize(value)]
#define SFFontRegular(value)    [UIFont fontWithName:@"PingFangTC-Regular" size:SFFontSize(value)]
#define SFFontThin(value)       [UIFont fontWithName:@"PingFangTC-Thin" size:SFFontSize(value)]
#define SFFontMedium(value)     [UIFont fontWithName:@"PingFangTC-Medium" size:SFFontSize(value)]
#define SFFontSemibold(value)   [UIFont fontWithName:@"PingFangTC-Semibold" size:SFFontSize(value)]
#define SFFontLight(value)      [UIFont fontWithName:@"PingFangTC-Light" size:SFFontSize(value)]
#define SFFontUltralight(value) [UIFont fontWithName:@"PingFangTC-Ultralight" size:SFFontSize(value)]


// MARK: 颜色
// 注意：这个宏，依赖于YYCategory
#define SFColorHex(value)       [UIColor colorWithHexString:value]



// MARK: 单例写法
#define SFSingleton_h(name)  +(instancetype)shared##name;

#if __has_feature(objc_arc) // arc环境
#define SFSingleton_m(name)  +(instancetype)shared##name{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone{\
return self;\
}
#else // 非arc环境

#define SFSingleton_m(name)  +(instancetype)shared##name{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
+ (id)copyWithZone:(nullable NSZone *)zone{\
return self;\
}\
+ (oneway void)release {\
}\
\
+ (instancetype)autorelease {\
return self;\
}\
\
+ (instancetype)retain {\
return self;\
}\
\
+ (NSUInteger)retainCount {\
return 1;\
}
#endif


#endif /* SFFunc_h */
