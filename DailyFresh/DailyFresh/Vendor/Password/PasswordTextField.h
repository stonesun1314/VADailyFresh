//
//  PasswordTextField.h
//  VankePayApp
//
//  Created by Mac on 2019/1/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "UnderlineTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface PasswordTextField : UnderlineTextField

@property (nonatomic, strong) UIView *customRightView;
@property (nonatomic, assign) BOOL showPwd;     //default  is NO;
@property (nonatomic, strong) NSString *inputText;

@end

NS_ASSUME_NONNULL_END
