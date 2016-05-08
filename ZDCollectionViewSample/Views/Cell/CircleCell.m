//
//  CircleCell.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 15/11/28.
//  Copyright © 2015年 Fate.D.Bourne. All rights reserved.
//

#import "CircleCell.h"

@implementation CircleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 35.0;
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


@end
