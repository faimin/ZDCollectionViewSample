//
//  HoverCell.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 2016/12/12.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "HoverCell.h"

UIColor *ZD_RandomColor() {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f
                                         green:aGreenValue / 255.0f
                                          blue:aBlueValue / 255.0f
                                         alpha:1.0f];
    return randColor;
}

@implementation HoverCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = ZD_RandomColor();
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;
        [self addSubview:self.label];
    }
    return self;
}

- (UILabel *)label {
    if (!_label) {
        UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){10, 10, CGRectGetWidth(self.bounds), 30}];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor yellowColor];
        label.font = [UIFont systemFontOfSize:18.f];
        [label setAdjustsFontSizeToFitWidth:YES];
        _label = label;
    }
    return _label;
}

@end
