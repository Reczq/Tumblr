//
//  QuotePost.h
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "Post.h"

@interface QuotePost : Post

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *quoteSource;

@end
