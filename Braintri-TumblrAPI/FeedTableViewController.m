//
//  FeedTableViewController.m
//  Braintri-TumblrAPI
//
//  Created by Reczq on 6/20/16.
//  Copyright © 2016 Dominik Reczek. All rights reserved.
//

#import "FeedTableViewController.h"
#import "PhotoCell.h"
#import "PostType.h"
#import "Post.h"
#import "RegularPost.h"
#import "PhotoPost.h"
#import "PhotoPostViewController.h"
#import "AudioPost.h"
#import "UniversalCell.h"
#import "VideoPost.h"
#import "QuotePost.h"
#import "LinkPost.h"
#import "ConversationPost.h"

@implementation FeedTableViewController

#define PhotoIdentifier @"PhotoCellIdentifier"
#define UniversalIdentifier @"UniversalCellIdentifier"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[PhotoCell class] forCellReuseIdentifier:PhotoIdentifier];
    [self.tableView registerClass:[UniversalCell class] forCellReuseIdentifier:UniversalIdentifier];
    [self.tableView reloadData];
    
    self.navigationItem.title = @"Feed";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feed count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *tempPost = self.feed[indexPath.row];
    switch (tempPost.type) {
        case Photo: {
            PhotoPost *post = self.feed[indexPath.row];
            PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:PhotoIdentifier forIndexPath:indexPath];
            cell.title.text = post.title;
            cell.imageView.image = [UIImage imageNamed:@"tumblrLogo"];
            [self loadPicture:post.url completion:^(UIImage *image) {
                cell.photo.image = image;
            }];
            return cell;
            
        } break;
        case Regular: {
            RegularPost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.postSubtitle.text = post.subtitle;
            cell.backgroundColor = [UIColor colorWithRed:0.14 green:0.27 blue:0.50 alpha:1.0];
            return cell;
        } break;
            
        case Audio: {
            AudioPost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.postSubtitle.text = @"Audio - Click here to listen";
            cell.backgroundColor = [UIColor colorWithRed:0.55 green:0.70 blue:0.92 alpha:1.0];
            return cell;
        } break;
            
        case Video: {
            VideoPost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.postSubtitle.text = @"Video - Click here to watch";
            cell.backgroundColor = [UIColor colorWithRed:0.55 green:0.70 blue:0.92 alpha:1.0];
            return cell;
        } break;
            
        case Quote: {
            QuotePost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.backgroundColor = [UIColor colorWithRed:0.14 green:0.27 blue:0.50 alpha:1.0];
            return cell;
        } break;
            
        case Link: {
            LinkPost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.postSubtitle.text = @"Link - Click here";
            cell.backgroundColor = [UIColor colorWithRed:0.55 green:0.70 blue:0.92 alpha:1.0];
            return cell;
        } break;
            
        case Conversation: {
            ConversationPost *post = self.feed[indexPath.row];
            UniversalCell *cell = [tableView dequeueReusableCellWithIdentifier:UniversalIdentifier forIndexPath:indexPath];
            cell.postTitle.text = post.title;
            cell.postSubtitle.text = @"Conversation - Click here";
            cell.backgroundColor = [UIColor colorWithRed:0.55 green:0.70 blue:0.92 alpha:1.0];
            return cell;
        } break;
    }
}

- (void)loadPicture:(NSString *)urlAsString completion:(void (^)(UIImage *))completion {
    dispatch_queue_t backgroundQueue = dispatch_queue_create("com.dowloadImage", 0);
    
    dispatch_async(backgroundQueue, ^{
        NSURL *url = [NSURL URLWithString:urlAsString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        CGSize newSize = CGSizeMake(400, 400);
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(newImage);
        });
    });
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Post *post = self.feed[indexPath.row];
    if (post.type == Audio || post.type == Video || post.type == Link || post.type == Conversation) {
        AudioPost *post = self.feed[indexPath.row];
        UIApplication *app = [UIApplication sharedApplication];
        NSURL *url = [NSURL URLWithString:post.url];
        if ([app canOpenURL: url]) {
            [app openURL:url];
        }
    }
}

@end
