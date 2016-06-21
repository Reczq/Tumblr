//
//  PickNameView.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "PickNameView.h"
#import "Masonry/Masonry.h"

@implementation PickNameView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.logoImageView = [[UIImageView alloc] init];
        self.logoImageView.image = [UIImage imageNamed:@"tumblrLogo"];
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.logoImageView];
        
        self.pickNameTextField = [[UITextField alloc] init];
        self.pickNameTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.pickNameTextField.placeholder = @"Pick name";
        self.pickNameTextField.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.pickNameTextField];
        
        self.confirmationButton = [[UIButton alloc] init];
        self.confirmationButton.backgroundColor = [UIColor colorWithRed:0.11 green:0.27 blue:0.53 alpha:0.8];
        [self.confirmationButton setTitle:@"Confirm" forState:UIControlStateNormal];
        self.confirmationButton.layer.cornerRadius = 9.0;
        self.confirmationButton.layer.masksToBounds = YES;
        self.confirmationButton.layer.borderWidth = 0.6;
        self.confirmationButton.layer.borderColor = [UIColor yellowColor].CGColor;
        
        self.backgroundColor = [UIColor colorWithRed:0.11 green:0.27 blue:0.43 alpha:1.0];
        [self addSubview:self.confirmationButton];
    
        [self updateConstraints];
    }
    
    return self;
}

-(void)updateConstraints {
    [super updateConstraints];
    
    CGFloat padding = 20;
    [self.logoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(padding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
        make.height.equalTo(@60);
    }];
    
    [self.pickNameTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImageView.mas_bottom).offset(padding);
        make.left.right.equalTo(self.logoImageView);
    }];
    
    [self.confirmationButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pickNameTextField.mas_bottom).offset(padding);
        make.left.right.equalTo(self.pickNameTextField);
        make.height.equalTo(@40);
    }];
}

@end
