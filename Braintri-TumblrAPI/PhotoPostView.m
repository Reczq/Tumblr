//
//  PhotoPostView.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "PhotoPostView.h"
#import "Masonry.h"

@implementation PhotoPostView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
        
        [self updateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
