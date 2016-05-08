//
//  CircleLayout.h
//  ZDCollectionViewSample
//
//  Created by 符现超 on 15/11/28.
//  Copyright © 2015年 Fate.D.Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
