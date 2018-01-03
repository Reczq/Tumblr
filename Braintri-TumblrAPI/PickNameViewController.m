//
//  PickNameViewController.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "PickNameViewController.h"
#import "PickNameView.h"
#import "RestAPIManager.h"
#import "FeedTableViewController.h"

@implementation PickNameViewController

- (void)loadView {
    self.view = [[PickNameView alloc] init];
}

- (PickNameView *)castedView {
    return (PickNameView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Braintri - TumblrAPI";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.11 green:0.27 blue:0.53 alpha:0.8];
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor yellowColor]}];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    [[self castedView].confirmationButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void)confirm {
    [[self castedView].confirmationButton setEnabled:false];
    
    NSString *user = [self castedView].pickNameTextField.text;
    
    RestAPIManager *manager = [[RestAPIManager alloc] init];
    [manager getFeedForUser:user completionHandler:^(NSArray *feed) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self castedView].confirmationButton setEnabled:true];
            if (feed != nil) {
                FeedTableViewController *feedTableViewController = [[FeedTableViewController alloc] init];
                // Przekazanie do drugiego controllera
                feedTableViewController.feed = feed;
                
                // Pokazanie widoku drugiego controllera
                [self.navigationController pushViewController:feedTableViewController animated:YES];
            } else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Something went wrong" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *ok = [UIAlertAction
                                     actionWithTitle:@"OK"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         // EMPTY
                                     }];
                
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:true completion:nil];
            }
        });
    }];
}

@end

