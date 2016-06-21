//
//  PhotoCell.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "PhotoCell.h"
#import "Masonry/Masonry.h"

@implementation PhotoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.photo = [[UIImageView alloc] init];
        self.photo.contentMode = UIViewContentModeScaleAspectFit;
        self.photo.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self addSubview:self.photo];
        
        self.title = [[UILabel alloc] init];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        [self addSubview:self.title];
        
        self.layer.cornerRadius = 9.0;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.6;
        
        [self updateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self.photo mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.equalTo(self.photo.mas_width);
    }];
    
    [self.title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.right.left.equalTo(self);
        make.bottom.equalTo(self.photo.mas_bottom);
    }];
}

@end
