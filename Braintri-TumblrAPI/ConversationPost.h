//
//  ConversationPost.h
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/21/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "Post.h"

@interface ConversationPost : Post

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;

@end
