//
//  UniversalCell.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "UniversalCell.h"
#import "Masonry/Masonry.h"

@implementation UniversalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.postTitle = [[UILabel alloc] init];
        [self addSubview:self.postTitle];
        
        self.postSubtitle = [[UILabel alloc] init];
        [self addSubview:self.postSubtitle];
        
        [self updateConstraints];
    }
    self.layer.cornerRadius = 9.0;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.6;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.postTitle.textAlignment = NSTextAlignmentCenter;
    self.postSubtitle.textAlignment = NSTextAlignmentCenter;
    self.postTitle.lineBreakMode = NSLineBreakByWordWrapping;
    self.postTitle.numberOfLines = 0;
    self.postSubtitle.lineBreakMode = NSLineBreakByWordWrapping;
    self.postSubtitle.numberOfLines = 0;
    self.postTitle.textColor = [UIColor whiteColor];
    self.postSubtitle.textColor = [UIColor whiteColor];
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    CGFloat offset = 10;
    [self.postTitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(offset);
        make.right.equalTo(self).offset(-offset);
        make.top.equalTo(self).offset(offset);
    }];
    
    [self.postSubtitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.postTitle.mas_bottom).offset(offset);
        make.left.right.equalTo(self.postTitle);
        make.bottom.equalTo(self.mas_bottom).offset(-offset);
    }];
}

@end
