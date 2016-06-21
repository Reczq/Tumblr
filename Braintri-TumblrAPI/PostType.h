//
//  PostType.h
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum PostType : NSUInteger {
    Regular, Photo, Audio, Video, Quote, Link, Conversation
} PostType;