//
//  MineScrollSectionView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineScrollSectionView.h"

@interface MineScrollSectionView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation MineScrollSectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataSource];
        [self setupUI];
    }
    return self;
}

- (void)initDataSource{
    _imageArr = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557828972343&di=2f59f6187c52504947d36023aceb21b1&imgtype=0&src=http%3A%2F%2Fimg3.redocn.com%2Ftupian%2F20140822%2Fmusejingsefengjing_2939709.jpg",
                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557829191472&di=cf8869fdf745da9c9df0f1bfc5007043&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201510%2F20%2F20151020193337_vPRHh.jpeg",
                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557828972343&di=0b31a44d6fd87d7cd7a81d1d2ae173f8&imgtype=0&src=http%3A%2F%2Fimg17.3lian.com%2Fd%2Ffile%2F201702%2F21%2F9167add2223eabf3543d4288b74cc231.jpg"];
}

- (void)setupUI{
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
//    _scrollView.backgroundColor = [UIColor blueColor];
    [self addSubview:_scrollView];
    
    _scrollView.sd_layout.leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).topSpaceToView(self, 0).heightIs(95.f);
    
    UIView *lastObj = _scrollView;
    for (NSString *imageUrl in _imageArr) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        imageView.layer.cornerRadius = 5.f;
        imageView.clipsToBounds = YES;
        [_scrollView addSubview:imageView];
        
//        imageView.backgroundColor = KColorRandomColor;
        NSInteger index = [_imageArr indexOfObject:imageUrl];
        CGFloat leftMargin = 15.f;
        if (index == 0) {
            leftMargin = 0;
        }
        imageView.sd_layout.leftSpaceToView(lastObj, leftMargin).topSpaceToView(_scrollView, 0).heightIs(95.f).widthRatioToView(_scrollView, 0.47);
        
        lastObj = imageView;
        
        [imageView updateLayout];
        VALog(@"%@",imageView);
        
    }
    
    [_scrollView setupAutoContentSizeWithRightView:lastObj rightMargin:10.f];
    
    
    [self setupAutoHeightWithBottomView:_scrollView bottomMargin:0.f];
}

@end
