#import "AppDelegate.h"
#import "PickNameViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect viewFrame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:viewFrame];
    
    PickNameViewController *pickNameViewController = [[PickNameViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:pickNameViewController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
