//
//  PasswordTextField.m
//  VankePayApp
//
//  Created by Mac on 2019/1/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "PasswordTextField.h"

@interface PasswordTextField ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *clearBtn;

@end

@implementation PasswordTextField

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _customRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
//        _customRightView.backgroundColor = [UIColor redColor];
        
        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearBtn.frame = CGRectMake(0, 0, 50, 40);
        [_clearBtn setImage:[UIImage imageNamed:@"ico-unvisuable-norm"] forState:UIControlStateNormal];
        [_clearBtn setImage:[UIImage imageNamed:@"ico-unvisuable-unnorm"] forState:UIControlStateSelected];
        [_clearBtn addTarget:self action:@selector(showTextClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_customRightView addSubview:_clearBtn];
        
        self.rightView = _customRightView;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        self.secureTextEntry = TRUE;
        _clearBtn.selected = TRUE;
        
    }
    return self;
}

- (void)showTextClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.enabled = NO;    // the first one;
    self.secureTextEntry = sender.selected;
    
//    sender.selected = !sender.selected;
    
    self.showPwd = _clearBtn.selected;
    
    self.enabled = YES;  // the second one;
    [self becomeFirstResponder];    // the third one
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self && textField.isSecureTextEntry) {
        textField.text = toBeString;
        return NO;
    }
    
    return YES;
}


@end
