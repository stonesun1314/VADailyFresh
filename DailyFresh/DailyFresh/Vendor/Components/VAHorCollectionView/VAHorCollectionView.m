//
//  VAHorCollectionView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAHorCollectionView.h"
#import "VAHorCollectionCell.h"

#define Count 5
static NSString *CellIdentiifer = @"CellIdentiifer";

@interface VAHorCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VAHorCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.clipsToBounds = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor redColor];
        
//        [self addGesture];
        [self registerClass:[VAHorCollectionCell class] forCellWithReuseIdentifier:CellIdentiifer];
    }
    return self;
}


#pragma mark - collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return Count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VAHorCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentiifer forIndexPath:indexPath];
    return cell;
}


#pragma mark - collection view data source
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击我了，我是第%ld个",indexPath.row);
}

@end
