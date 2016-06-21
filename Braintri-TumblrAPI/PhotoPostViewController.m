//
//  PhotoPostViewController.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "PhotoPostViewController.h"
#import "PhotoPostView.h"

@implementation PhotoPostViewController

- (void)loadView {
    self.view = [[PhotoPostView alloc] init];
}

- (PhotoPostView *)castedView {
    return (PhotoPostView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Photo";
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self loadPicture];
}

- (void)loadPicture {
    dispatch_queue_t backgroundQueue = dispatch_queue_create("com.dowloadImage", 0);
    
    dispatch_async(backgroundQueue, ^{
        NSURL *url = [NSURL URLWithString:self.photoUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self castedView].imageView.image = image;
        });
    });
}


@end

