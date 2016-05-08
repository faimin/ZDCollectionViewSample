//
//  ZDTagLayout.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 16/5/7.
//  Copyright © 2016年 Fate.D.Bourne. All rights reserved.
//

#import "ZDTagLayout.h"

@interface ZDTagLayout ()

@end

@implementation ZDTagLayout

- (void)prepareLayout {
    [super prepareLayout];
    
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributeArr = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *mutAttributeArr = @[].mutableCopy;
    
    CGFloat frameX = 0.0, lastCenterY = 0.0;
    for (UICollectionViewLayoutAttributes *attribute in attributeArr) {
        CGRect frame = attribute.frame;
        CGFloat centerY = CGRectGetMidY(frame);
        //每行最左边的第一个item
        if (CGRectGetMinX(frame) == self.sectionInset.left || (fabs(centerY-lastCenterY) > 1)) {
            frameX = self.sectionInset.left;
            lastCenterY = centerY;
        }
        //更新frame，然后从新赋值给attribute
        frame.origin.x = frameX;
        attribute.frame = frame;
        [mutAttributeArr addObject:attribute];
        
        //下一个item的frame的x坐标
        frameX = CGRectGetMaxX(frame) + self.minimumInteritemSpacing;
    }
    return mutAttributeArr.copy;
}


@end
