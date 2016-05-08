//
//  TagLayout.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 16/2/2.
//  Copyright © 2016年 Fate.D.Bourne. All rights reserved.
//

#import "TagLayout.h"

@implementation TagLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获得super已经计算好的布局属性（在super已经算好的基础上，再去做一些改进）
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat offsetX = 0.0f;
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if (attribute.frame.origin.x == self.sectionInset.left) {
            offsetX = self.sectionInset.left;
        }
        else {
            CGRect frame = attribute.frame;
            frame.origin.x = offsetX;
            attribute.frame = frame;
        }
        
        offsetX += CGRectGetWidth(attribute.frame) + self.minimumInteritemSpacing;
    }
    
    return attributes;
}

@end












































