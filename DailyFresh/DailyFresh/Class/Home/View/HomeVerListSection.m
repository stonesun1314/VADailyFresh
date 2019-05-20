//
//  HomeVerListSection.m
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeVerListSection.h"
#import "HomeVerCollectionViewCell.h"
#import "GoodsItemModel.h"
#import "HomeVerItemCell.h"

static NSString *CellIdentiifer = @"CellIdentiifer";

@interface HomeVerListSection ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;

@end

@implementation HomeVerListSection

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kDarkMainBackgroundColor;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    _header = [[UIView alloc] init];
    [self addSubview:_header];
    
    _header.sd_layout.leftEqualToView(self).topEqualToView(self).heightIs(50.f).widthRatioToView(self, 1.0);
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"新人首场免单";
    _titleLabel.textColor = kUITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    [_header addSubview:_titleLabel];
    
    _titleLabel.sd_layout.leftSpaceToView(_header, VAMargin).centerYEqualToView(_header).heightIs(30.f);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:200.f];
    

    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    
    

    return;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10.f;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width,kVASCreenHeight) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.dataSource = self;
    self.clipsToBounds = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
    
    _collectionView.sd_layout.widthRatioToView(self, 1.0).heightIs(kVASCreenHeight).leftEqualToView(self).topSpaceToView(self, 50.f);
    
    [_collectionView setNeedsDisplay];
    
    [self.collectionView registerClass:[HomeVerCollectionViewCell class] forCellWithReuseIdentifier:CellIdentiifer];
}


- (void)setGoodsItemList:(NSArray<GoodsItemModel *> *)goodsItemList{
    _goodsItemList = goodsItemList;
    
    [self layoutGoodsItem];
}

- (void)layoutGoodsItem{
    NSMutableArray *temp = [NSMutableArray new];
    
    CGSize size = CGSizeMake((kScreenSize.width - VAMargin * 2)/2, 250.f);
    for (GoodsItemModel *model  in _goodsItemList) {
        HomeVerItemCell *cell = [[HomeVerItemCell alloc] init];
        cell.model = model;
        
        [_contentView addSubview:cell];
        [temp addObject:cell];
        cell.sd_layout.heightIs(size.height);
//        cell.backgroundColor = KColorRandomColor;
    }
    
    [_contentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:2 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:10];
    //[_contentView setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:2 itemWidth:size.width verticalMargin:10 verticalEdgeInset:4 horizontalEdgeInset:10];
    
    _contentView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(_header, 0.f).rightSpaceToView(self, 0.f);
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:20.f];
}

#pragma mark - collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (_goodsItemList.count % 2) {
       return _goodsItemList.count/2 + 1;
    }
    return _goodsItemList.count/2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeVerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentiifer forIndexPath:indexPath];
    
    GoodsItemModel *model = [_goodsItemList objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;
}


#pragma mark - collection view data source
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"点击我了，我是第%ld个",indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.bounds.size.width - VAMargin * 2)/2, 250.f);
}


@end
