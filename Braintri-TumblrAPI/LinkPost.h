//
//  LinkPost.h
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "Post.h"

@interface LinkPost : Post

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;

@end
