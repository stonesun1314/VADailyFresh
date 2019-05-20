//
//  HomeHorListSection.m
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeHorListSection.h"
#import "HomeHorCollectionViewCell.h"

#define Count 7

static NSString *CellIdentiifer = @"CellIdentiifer";

@interface HomeHorListSection ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HomeHorListSection

- (instancetype)initWithType:(HomeHorListType)type{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _type = type;
        
        [self setupUI];
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
       
    }
    return self;
}

- (void)setupUI{
    
    _header = [[UIView alloc] init];
    [self addSubview:_header];
    
    
    _header.sd_layout.leftEqualToView(self).topEqualToView(self).widthRatioToView(self, 1.0);
    
    if (_type == HomeHorListTypeTitle) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.text = @"新人首场免单";
        _titleLabel.text = self.name;
        _titleLabel.textColor = kUITitleColor;
        _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
        [_header addSubview:_titleLabel];
        
        //    _titleLabel.backgroundColor = [UIColor orangeColor];
        
        _titleLabel.sd_layout.leftSpaceToView(_header, VAMargin).centerYEqualToView(_header).heightIs(30.f);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:200.f];
        
        _header.sd_layout.heightIs(50.f);
    }else if (_type == HomeHorListTypeTopAd){
        _imageView = [[UIImageView alloc] init];
//        _imageView.backgroundColor = [UIColor blueColor];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:self.topAdImg] placeholderImage:[UIImage imageNamed:@"df_discover_avatar"]];
        [_header addSubview:_imageView];
        
        _imageView.sd_layout.leftSpaceToView(_header, VAMargin).rightSpaceToView(_header, VAMargin).topSpaceToView(_header, 10.f).heightIs(110.f);
        
        [_header setupAutoHeightWithBottomView:_imageView bottomMargin:10.f];
    }

    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(105, 170);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
    flowLayout.minimumLineSpacing = 10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width,170) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.clipsToBounds = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
    
    _collectionView.sd_layout.widthRatioToView(self, 1.0).heightIs(170.f).leftEqualToView(self).topSpaceToView(_header, 10.f);
    
    [_collectionView setNeedsDisplay];
    
    [self.collectionView registerClass:[HomeHorCollectionViewCell class] forCellWithReuseIdentifier:CellIdentiifer];
    
    [self setupAutoHeightWithBottomView:_collectionView bottomMargin:0];
    
}

- (void)setName:(NSString *)name{
    _name = name;
    _titleLabel.text = _name;
}

- (void)setTopAdImg:(NSString *)topAdImg{
    _topAdImg = topAdImg;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.topAdImg] placeholderImage:[UIImage imageNamed:@"df_discover_avatar"]];
}


#pragma mark - collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _goodsItemList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeHorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentiifer forIndexPath:indexPath];
    
    GoodsItemModel *model = [_goodsItemList objectAtIndex:indexPath.item];
    
    cell.model = model;
    
    return cell;
}


#pragma mark - collection view data source
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"点击我了，我是第%ld个",indexPath.row);
}

@end
