//
//  HoverCollectionViewController.m
//  ZDCollectionViewSample
//
//  Created by 符现超 on 2016/12/12.
//  Copyright © 2016年 Zero.D.Saber. All rights reserved.
//

#import "HoverCollectionViewController.h"
#import "ZDHoverLayout.h"
#import "HoverCell.h"

@interface HoverCollectionViewController ()

@end

@implementation HoverCollectionViewController

static NSString * const reuseIdentifier = @"HoverCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.collectionViewLayout = ({
        ZDHoverLayout *layout = [[ZDHoverLayout alloc] init];
        // 叠加效果需要把space设置为负数
        layout.minimumLineSpacing = -20;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 80);
        layout;
    });

    // Register cell classes
    [self.collectionView registerClass:[HoverCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"😀😀😀 %zd", indexPath.row + 1];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
