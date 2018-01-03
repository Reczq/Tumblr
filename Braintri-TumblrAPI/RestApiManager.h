#import <Foundation/Foundation.h>

@interface RestAPIManager : NSObject

- (void)getFeedForUser:(NSString *)user completionHandler:(void (^)(NSArray *))completion;

@end
