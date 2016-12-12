//
//  ZDHoverLayout.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 2016/12/12.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "ZDHoverLayout.h"

@implementation ZDHoverLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArr = [super layoutAttributesForElementsInRect:rect];
    // 重新设置每个element的frame
    for (UICollectionViewLayoutAttributes *attribute in attributesArr) {
        [self reConfigAttributesFrame:attribute];
    }
    return attributesArr;
}

- (void)reConfigAttributesFrame:(UICollectionViewLayoutAttributes *)attriutes {
    // 需要悬停的位置的 Y 坐标
    // Warning：bounds与frame在此处差别较大
    CGFloat minY = CGRectGetMinY(self.collectionView.bounds) + self.collectionView.contentInset.top;
    // NSLog(@"%@", NSStringFromCGRect(self.collectionView.bounds));
    // 最终位置不能超过minY处的位置（要是比minY还小的话，cell就划出去了，不能悬停了）
    CGFloat finalY = MAX(minY, CGRectGetMinY(attriutes.frame));
    
    // 重新设置element的坐标
    CGPoint origin = attriutes.frame.origin;
    origin.y = finalY;
    attriutes.frame = (CGRect){origin, attriutes.frame.size};
    
    //根据IndexPath设置zIndex能确立顶部悬停的cell被后来的cell覆盖的层级关系(不设置的话层级关系是随机的)
    attriutes.zIndex = attriutes.indexPath.row;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
