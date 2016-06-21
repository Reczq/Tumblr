//
//  RestApiManager.h
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestAPIManager : NSObject

- (void)getFeedForUser:(NSString *)user completionHandler:(void (^)(NSArray *))completion;

@end
