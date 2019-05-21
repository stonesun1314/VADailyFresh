//
//  DiscoveryTableViewCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "DiscoveryTableViewCell.h"

@interface DiscoveryTableViewCell ()

@property (nonatomic, strong) UIImageView *avaterImageView;
@property (nonatomic, strong) UILabel *publisherLabel;

@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *beViewedAmtLabel;
@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation DiscoveryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    _avaterImageView = [UIImageView new];
    _avaterImageView.layer.cornerRadius = 12.f;
    _avaterImageView.clipsToBounds = YES;
    [self.contentView addSubview:_avaterImageView];
    _publisherLabel = [UILabel new];
    _publisherLabel.font = [UIFont systemFontOfSize:kUISubtitleFontSize];
    _publisherLabel.textColor = [UIColor blackColor];//kUISubTitleColor;
    [self.contentView addSubview:_publisherLabel];
    
    _itemImageView = [UIImageView new];
    _itemImageView.layer.cornerRadius = 5.f;
    _itemImageView.clipsToBounds = YES;
    [self.contentView addSubview:_itemImageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 2;
    [self.contentView addSubview:_titleLabel];
    
    _beViewedAmtLabel = [UILabel new];
    _beViewedAmtLabel.font = [UIFont systemFontOfSize:12.f];
    _beViewedAmtLabel.textColor = kUISubTitleColor;
    [self.contentView addSubview:_beViewedAmtLabel];
    
    _shareBtn = [UIButton new];
    [_shareBtn setImage:[UIImage imageNamed:@"df_discover_share"] forState:UIControlStateNormal];
    [self.contentView addSubview:_shareBtn];
    
}

- (void)setType:(ArticalType)type{
    _type = type;
    
    WeakSelf
    if (_type == ArcitalTypeTop) {
        _titleLabel.font = [UIFont systemFontOfSize:20.f];
        
        _avaterImageView.sd_resetNewLayout.leftSpaceToView(self.contentView, VAMargin).topSpaceToView(self.contentView, 20).widthIs(24).heightIs(24.f);
        _publisherLabel.sd_resetNewLayout.leftSpaceToView(self.avaterImageView, 5.f).centerYEqualToView(self.avaterImageView).heightIs(20.f);
        [_publisherLabel setSingleLineAutoResizeWithMaxWidth:200.f];
        _itemImageView.sd_resetNewLayout.leftSpaceToView(self.contentView, VAMargin).rightSpaceToView(self.contentView, VAMargin).topSpaceToView(self.avaterImageView, 10.f).heightIs(190.f);
        
        _titleLabel.sd_resetNewLayout.topSpaceToView(self.itemImageView, 10.f).leftEqualToView(self.itemImageView).rightEqualToView(self.itemImageView).autoHeightRatio(0);
        [_titleLabel setMaxNumberOfLinesToShow:2];
        
        _beViewedAmtLabel.sd_resetNewLayout.leftEqualToView(self.itemImageView).topSpaceToView(self.titleLabel, 15.f).autoHeightRatio(0);
        [_beViewedAmtLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        
        _shareBtn.sd_resetNewLayout.rightSpaceToView(self.contentView, VAMargin).centerYEqualToView(self.beViewedAmtLabel).widthIs(44.f).heightIs(44.f);
        
        [self setupAutoHeightWithBottomView:_beViewedAmtLabel bottomMargin:10.f];
        
//        [_avaterImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.width.height.mas_equalTo(24);
//            make.left.mas_equalTo(weakSelf.contentView).offset(VAMargin);
//            make.top.mas_equalTo(weakSelf.contentView).offset(20.f);
//        }];
//        [_publisherLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.avaterImageView.mas_right).offset(5.f);
//            make.centerY.mas_equalTo(weakSelf.avaterImageView);
//            make.height.mas_equalTo(20.f);
//        }];
//
//        [_itemImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.contentView).offset(VAMargin);
//            make.right.mas_equalTo(weakSelf.contentView).offset(-VAMargin);
//            make.top.mas_equalTo(weakSelf.avaterImageView.mas_bottom).offset(15.f);
//            make.height.mas_equalTo(190.f);
//        }];
//
//        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.itemImageView);
//            make.right.mas_equalTo(weakSelf.itemImageView);
//            make.top.mas_equalTo(weakSelf.itemImageView.mas_bottom).offset(10.f);
//        }];
//
//        [_beViewedAmtLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.itemImageView);
//            make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(20.f);
//            make.bottom.mas_equalTo(weakSelf.contentView).offset(-10.f);
//            make.height.mas_equalTo(20.f);
//        }];
//
//        [_shareBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.width.height.mas_equalTo(44.f);
//            make.centerY.mas_equalTo(weakSelf.beViewedAmtLabel);
//            make.right.mas_equalTo(weakSelf.contentView).offset(-VAMargin);
//        }];
        
    }else{

        [self.contentView layoutIfNeeded];
        
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        
        _itemImageView.sd_resetNewLayout.leftSpaceToView(self.contentView, VAMargin).topSpaceToView(self.contentView, 10.f).widthIs(155.f).heightIs(105.f);
        _avaterImageView.sd_resetNewLayout.leftSpaceToView(self.itemImageView, 10.f).topSpaceToView(self.contentView, 10.f).widthIs(24.f).heightIs(24.f);
        _publisherLabel.sd_resetNewLayout.leftSpaceToView(self.avaterImageView, 5.f).centerYEqualToView(self.avaterImageView).heightIs(20.f);
        [_publisherLabel setSingleLineAutoResizeWithMaxWidth:100.f];
        _titleLabel.sd_resetNewLayout.leftSpaceToView(self.itemImageView, 10.f).rightSpaceToView(self.contentView, VAMargin).topSpaceToView(self.avaterImageView, 5.f).autoHeightRatio(0);
        [_publisherLabel setMaxNumberOfLinesToShow:2];
        _beViewedAmtLabel.sd_resetNewLayout.leftEqualToView(self.titleLabel).topSpaceToView(self.titleLabel, 10.f).autoHeightRatio(0);
        [_beViewedAmtLabel setSingleLineAutoResizeWithMaxWidth:100.f];
        _shareBtn.sd_resetNewLayout.rightSpaceToView(self.contentView, VAMargin).centerYEqualToView(self.beViewedAmtLabel).widthIs(44.f).heightIs(44.f);
        
        [self setupAutoHeightWithBottomView:self.itemImageView bottomMargin:10.f];
        
        
//        [_itemImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.contentView).offset(VAMargin);
//            make.width.mas_equalTo(155.f);
//            make.top.mas_equalTo(weakSelf.contentView).offset(10.f);
//            make.height.mas_equalTo(105.f);
////            make.bottom.mas_equalTo(self.contentView).offset(-10.f);
//        }];
//
//
//
//        [_avaterImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.width.height.mas_equalTo(24);
//            make.left.mas_equalTo(weakSelf.itemImageView.mas_right).offset(10.f);
//            make.top.mas_equalTo(weakSelf.contentView).offset(10.f);
//        }];
//
//
//
//        [_publisherLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.avaterImageView.mas_right).offset(5.f);
//            make.centerY.mas_equalTo(weakSelf.avaterImageView);
//            make.height.mas_equalTo(20.f);
//        }];
//
//
//
//        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.avaterImageView);
//            make.right.mas_equalTo(weakSelf.contentView).offset(-VAMargin);
//            make.top.mas_equalTo(weakSelf.avaterImageView.mas_bottom).offset(5.f);
//        }];
//
//
//
//        [_beViewedAmtLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(weakSelf.titleLabel);
//            make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(10.f);
//            make.height.mas_equalTo(20.f);
//        }];
//
//
//
//        [_shareBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.width.height.mas_equalTo(44.f);
//            make.centerY.mas_equalTo(weakSelf.beViewedAmtLabel);
//            make.right.mas_equalTo(weakSelf.contentView).offset(-VAMargin);
//        }];
        

        
        [self.contentView layoutIfNeeded];
    }

}

- (void)setModel:(DisArticalModel *)model{
    _model = model;
    [_avaterImageView sd_setImageWithURL:[NSURL URLWithString:model.userHead]];
    _publisherLabel.text = model.userName;
    _titleLabel.text = model.articleName;
    [_itemImageView sd_setImageWithURL:[NSURL URLWithString:model.articleImg]];
    
    _beViewedAmtLabel.text = [NSString stringWithFormat:@"浏览 %@",model.browseNum];
    

    if ([model.isTopType boolValue]) {
        [self setType:ArcitalTypeTop];
    }else{

        [self setType:ArcitalTypeNormal];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
