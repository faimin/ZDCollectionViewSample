//
//  ZDWaterFlowLayout.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 16/5/7.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "ZDWaterFlowLayout.h"

static NSUInteger const defaultColumnCount = 3;    ///< 列数
static UIEdgeInsets const defaultEdgeInsets = {10, 10, 10, 10};
static CGFloat const defaultcColumnMargin = 10.f;   ///< 列间距
static CGFloat const defaultRowMargin = 10.f;      ///< 行间距

@interface ZDWaterFlowLayout ()
@property (nonatomic, strong) NSMutableArray *attributeArr; ///< cell布局属性
@property (nonatomic, strong) NSMutableArray *columnHeightArr; ///< 每一列的当前高度
@property (nonatomic, assign) CGFloat maxContentHeight; ///< 当前最大最大内容高度

- (NSUInteger)columnCount;
- (CGFloat)rowMargin ;
- (CGFloat)columnMargin;
- (UIEdgeInsets)edgeInsets;
@end

@implementation ZDWaterFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.columnHeightArr removeAllObjects];
    [self.attributeArr removeAllObjects];
    //创建每一个cell对应的布局属性
    NSUInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < cellCount; i++) {
        UICollectionViewLayoutAttributes *layoutAttribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.attributeArr addObject:layoutAttribute];
    }
}

//每次滑动都会调用此方法
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributeArr;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //collectionView的宽度
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.frame);
    
    //cell的宽和高
    CGFloat width = (collectionViewWidth - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount-1)*self.columnMargin) / self.columnCount;
    CGFloat height;
    if ([self.delegate respondsToSelector:@selector(heightForItemAtIndexPath:)]) {
        height = [self.delegate heightForItemAtIndexPath:indexPath];
    }
    else {
        //生成0-299的随机数
        height = arc4random_uniform(300);
    }
    
    //找出最短列的序号和高度
    NSUInteger minColumnNum = 0;
    CGFloat minColumnHeight = 0;
    for (NSUInteger i = 0; i < self.columnCount; i++) {
        CGFloat tempColumnHeight = [self.columnHeightArr[i] doubleValue];
        if (i == 0) {
            minColumnHeight = tempColumnHeight;
            minColumnNum = i;
        }
        else {
            if (minColumnHeight > tempColumnHeight) {
                minColumnHeight = tempColumnHeight;
                minColumnNum = i;
            }
        }
    }
    
    //设置cell的坐标
    CGFloat x = self.edgeInsets.left + minColumnNum * (width+self.columnMargin);
    CGFloat y = minColumnHeight + self.rowMargin;
    attributes.frame = CGRectMake(x, y, width, height);
    
    //更新数组中的高度
    CGFloat h = CGRectGetMaxY(attributes.frame);
    self.columnHeightArr[minColumnNum] = @(h);
    
    //记录内容高度
    self.maxContentHeight = MAX(self.maxContentHeight, h);
    
    return attributes;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), self.maxContentHeight+self.edgeInsets.bottom);
}

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return YES;
//}

#pragma mark - Private Method

- (NSUInteger)columnCount {
    return defaultColumnCount;
}

- (CGFloat)rowMargin {
    return defaultRowMargin;
}

- (CGFloat)columnMargin {
    return defaultcColumnMargin;
}

- (UIEdgeInsets)edgeInsets {
    return defaultEdgeInsets;
}

#pragma mark - Getter

- (NSMutableArray *)attributeArr {
    if (!_attributeArr) {
        _attributeArr = [[NSMutableArray alloc] init];
    }
    return _attributeArr;
}

@end


