//
//  NSObject+SFMaker.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "NSObject+SFMaker.h"
#import <objc/runtime.h>

@interface NSObject (SFMaker)

@end

@implementation NSObject (SFMaker)

#pragma mark - AssociatedObject
- (void)setMaker:(SFMaker *)maker {
    objc_setAssociatedObject(self, @selector(maker), maker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (SFMaker *)maker {
    SFMaker *maker = objc_getAssociatedObject(self, @selector(maker));
    if (!maker) {
        maker = [[SFMaker alloc]init];
        self.maker = maker;
        maker.obj = self;
    }
    return maker;
}

#pragma mark - func
- (SFMaker *)begin {
    return self.maker;
}
+ (SFMaker *)begin {
    NSObject *obj = [[self alloc]init];
    return obj.maker;
}



@end
