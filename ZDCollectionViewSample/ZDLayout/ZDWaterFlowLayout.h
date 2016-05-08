//
//  ZDWaterFlowLayout.h
//  ZDCollectionViewSample
//
//  Created by 符现超 on 16/5/7.
//  Copyright © 2016年 Fate.D.Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZDWaterFlowLayoutDelegate <NSObject>
///设置cellItem的高度
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZDWaterFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<ZDWaterFlowLayoutDelegate> delegate;

@end
