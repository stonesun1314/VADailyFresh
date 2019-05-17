//
//  SecondCateView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "SecondCateView.h"
#import "SecondCateModel.h"

@interface TagButton : UIButton

@property (nonatomic, strong) SecondCateModel *model;

@end

@implementation TagButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:kMainColor forState:UIControlStateSelected];
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
}

@end

@interface SecondCateView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollContentView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *tagContentView;
@property (nonatomic, strong) UIButton *expandBtn;

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, strong) NSMutableArray *scrollViewArray;

@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation SecondCateView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _selectedIndex = NSNotFound;
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        _scrollContentView = [[UIView alloc] init];
        [self.scrollView addSubview:_scrollContentView];
        
        [_scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self.scrollView);
        }];
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        

        
//        _scrollView.backgroundColor = [UIColor yellowColor];
//
//        _scrollContentView.backgroundColor = [UIColor blueColor];
        
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = kSeparatorLineColor;
        [self addSubview:_separatorLine];
        
        [_separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self layoutTags];
}


- (void)layoutTags{
    
    UIView *lastObj = nil;
    _scrollViewArray = [NSMutableArray new];
    for (SecondCateModel *model in _dataList) {
        
        NSInteger index = [_dataList indexOfObject:model];
        TagButton *label = [[TagButton alloc] init];
        label.tag = index;
        [label setTitle:model.cateName forState:UIControlStateNormal];
        label.model = model;
        label.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [self.scrollContentView addSubview:label];
        [label addTarget:self action:@selector(handleTag:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollViewArray addObject:label];
        
        CGSize size = [model.cateName sizeWithFont:label.titleLabel.font maxSize:CGSizeMake(100, 20)];
        VALog(@"%@--%@",label.currentTitle,NSStringFromCGSize(size));
        
        if (index == 0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.scrollContentView).offset(10.f);
                make.width.mas_equalTo(size.width+15);
                make.top.height.mas_equalTo(self.scrollContentView);
            }];
        }else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastObj.mas_right).offset(5.f);
                make.width.mas_equalTo(size.width+15);
                make.top.bottom.mas_equalTo(self.scrollContentView);
                
            }];
        }
        lastObj = label;
    }
    
    [self layoutIfNeeded];
    
    if (lastObj) {
        [self.scrollContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(lastObj.mas_right).offset(30.f);
            make.left.mas_equalTo(self.scrollView);
            make.top.mas_equalTo(self.scrollView);
            make.height.mas_equalTo(self.scrollView);
        }];
    }
    
    [self layoutIfNeeded];
    
    self.scrollView.contentSize = CGSizeMake(_scrollContentView.size.width, self.scrollView.size.height);
    
//    VALog(@"%@",lastObj);
//    VALog(@"%@",self.scrollContentView);
//    VALog(@"%@",_scrollView);
}


- (void)handleTag:(UIButton *)sender {
    VALog(@"%@",sender);
    if (sender.tag != _selectedIndex) {
        
        if (_scrollViewArray.count > _selectedIndex) {
            TagButton *preBtn = [_scrollViewArray objectAtIndex:_selectedIndex];
            preBtn.selected = NO;
        }
    }
    
    sender.selected = YES;
    _selectedIndex = sender.tag;
    if (self.selectedCateBlock) {
        self.selectedCateBlock(_selectedIndex,nil);
    }
}



@end
