//
//  HomeHeaderView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/9.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeHeaderView.h"
#import "HomeCateItemModel.h"
#import "HomeMenuGridItem.h"

@interface HomeHeaderView ()

//@property (nonatomic, strong) NSMutableArray *cateModelList;
@property (nonatomic, strong) UIScrollView *cateMenuContentView;

@end

@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initDataSource];
        [self setupUI];
    }
    return self;
}

- (void)initDataSource {
    
//    NSArray *cateNameList = [[VAMockDataSource shareInstance] homeCateList];
//
//    _cateModelList = [[NSMutableArray alloc] init];
//
//    for (NSString *name in cateNameList) {
//        HomeCateItemModel *model = [[HomeCateItemModel alloc] init];
//        model.name = name;
//        [_cateModelList addObject:model];
//    }

}


- (void)setupUI{
    
    CGFloat bannerHeight = 215.f;
    
    _topBannerImageView = [[UIImageView alloc] init];
    _topBannerImageView.backgroundColor = [UIColor darkGrayColor];
    [_topBannerImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557828972343&di=0b31a44d6fd87d7cd7a81d1d2ae173f8&imgtype=0&src=http%3A%2F%2Fimg17.3lian.com%2Fd%2Ffile%2F201702%2F21%2F9167add2223eabf3543d4288b74cc231.jpg"] placeholderImage:[UIImage imageNamed:@"df_ad_icon"]];
//    _topBannerImageView.image = [UIImage imageNamed:@"df_ad_icon"];
    [self addSubview:_topBannerImageView];
    
    _topBannerImageView.sd_layout.leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).topSpaceToView(self, 15.f).heightIs(bannerHeight);
    
    _bannerCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(VAMargin, bannerHeight + 15.f + 15.f, kVAScreenWidth - VAMargin * 2, 100) imageURLStringsGroup:@[@"backPlaceholder",@"backPlaceholder",@"backPlaceholder",@"backPlaceholder",@"backPlaceholder"]]; //[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, bannerHeight + 15.f + 15.f, VAScreenWidth - VAMargin * 2, 100) imagesGroup:@[]];
    [self addSubview:_bannerCycleScrollView];
    
    _cateMenuView = [[UIView alloc] init];
    _cateMenuView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_cateMenuView];
    
    _cateMenuContentView = [[UIScrollView alloc] init];
    _cateMenuContentView.backgroundColor = [UIColor clearColor];
    [_cateMenuView addSubview:_cateMenuContentView];
    
    _cateMenuView.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_bannerCycleScrollView, 15.f).heightIs(180.f);
    
    _cateMenuContentView.sd_layout.leftSpaceToView(_cateMenuView, VAMargin).rightSpaceToView(_cateMenuView, VAMargin).topSpaceToView(_cateMenuView, 0).bottomSpaceToView(_cateMenuView, 20.f);
    _cateMenuContentView.showsVerticalScrollIndicator = NO;
    _cateMenuContentView.showsHorizontalScrollIndicator = NO;
    
    //九宫格j布局
//    _cateMenuContentView.backgroundColor = [UIColor blueColor];
    

    


}

- (void)setCateModel:(HomeCateSectionModel *)cateModel{
    _cateModel = cateModel;
    [self layoutCateItems];
}

- (void)layoutCateItems{
    

    NSMutableArray *temp = [NSMutableArray new];
    CGFloat itemHeight = 75.f;
    CGFloat itemWidth = (kScreenWidth-VAMargin*2)/5;
    for (HomeCateItemModel *model in _cateModel.subItem) {
        HomeMenuGridItem *item = [[HomeMenuGridItem alloc] initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)];
        [_cateMenuContentView addSubview:item];
        //        item.sd_layout.heightIs(itemHeight).widthIs(itemWidth);
        item.model = model;
        
        [temp addObject:item];
        
    }
    
    
    NSInteger perCount = temp.count/2;
    if (temp.count % 2) {
        perCount++;
    }
    
    CGFloat contentSizeWidth = itemWidth * perCount;
    _cateMenuContentView.contentSize = CGSizeMake(contentSizeWidth, itemHeight * 2);
    
    for (HomeMenuGridItem *item in temp) {
        NSInteger index = [temp indexOfObject:item];
        
        NSInteger row = index/perCount;
        NSInteger coloum = (index%perCount);
        
        item.origin = CGPointMake(coloum * itemWidth, row *itemHeight);
        
    }
    
    [self setupAutoHeightWithBottomView:_cateMenuView bottomMargin:0];
}

@end
