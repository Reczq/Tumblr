//
//  RestApiManager.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "RestAPIManager.h"
#import "PostType.h"
#import "RegularPost.h"
#import "PhotoPost.h"
#import "AudioPost.h"
#import "VideoPost.h"
#import "QuotePost.h"
#import "LinkPost.h"
#import "ConversationPost.h"

@implementation RestAPIManager

- (void)getFeedForUser:(NSString *)user completionHandler:(void (^)(NSArray *))completion {
    NSString *urlAsString = [NSString stringWithFormat:@"https://%@.tumblr.com/api/read/json?debug=1&num=50&filter=text", user];
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            NSError *error;
            NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!error) {
                NSArray *feed = [self parseJSON:JSON];
                completion(feed);
            } else {
                completion(nil);
            }
        } else {
            completion(nil);
        }
        
    }];
    
    [task resume];
}

// Parsowanie danych
- (NSArray *)parseJSON:(NSDictionary *)json {
    NSMutableArray *feed = [[NSMutableArray alloc] init];
    NSArray *posts = json[@"posts"];
    if ([posts count] > 0) {
        for (int i = 0; i<posts.count; i++) {
            NSDictionary *tempPost = posts[i];
            if ([tempPost[@"type"] isEqualToString:@"photo"]) {
                PhotoPost *post = [[PhotoPost alloc] init];
                post.type = Photo;
                post.title = tempPost[@"photo-caption"];
                post.url = tempPost[@"photo-url-500"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"regular"]) {
                RegularPost *post = [[RegularPost alloc] init];
                post.type = Regular;
                post.title = tempPost[@"regular-title"];
                post.subtitle = tempPost[@"regular-body"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"audio"]) {
                AudioPost *post = [[AudioPost alloc] init];
                post.type = Audio;
                post.url = tempPost[@"url"];
                post.title = tempPost[@"id3-title"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"video"]) {
                VideoPost *post = [[VideoPost alloc] init];
                post.type = Video;
                post.url = tempPost[@"url"];
                post.title = tempPost[@"video-caption"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"quote"]) {
                QuotePost *post = [[QuotePost alloc] init];
                post.type = Quote;
                post.title = tempPost[@"quote-text"];
                post.quoteSource = tempPost[@"quote-source"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"link"]) {
                LinkPost *post = [[LinkPost alloc] init];
                post.type = Link;
                post.url = tempPost[@"url"];
                post.title = tempPost[@"link-url"];
                [feed addObject:post];
                
            } else if ([tempPost[@"type"] isEqualToString:@"conversation"]) {
                ConversationPost *post = [[ConversationPost alloc] init];
                post.type = Conversation;
                post.url = tempPost[@"url"];
                post.title = tempPost[@"conversation-title"];
                [feed addObject:post];
            } else {
                continue;
            }
        }
    } else {
        return nil;
    }
    
    return feed;
}

@end
