//
//  ShowViewController.m
//  FacebookGetFriend
//
//  Created by SDT-1 on 2014. 1. 21..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ShowViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ShowViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ShowViewController{
    int count;
    NSString *name;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                  NSDictionary* result,
                                                  NSError *error) {
        NSArray* friends = [result objectForKey:@"data"];
     //   NSLog(@"Found: %i friends", friends.count);
        count = friends.count;
        

    }];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FRIEND_CELL"];
    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                  NSDictionary* result,
                                                  NSError *error) {
     /*   NSArray* friends = [result objectForKey:@"data"];
        NSLog(@"Found: %i friends", friends.count);
        for (NSDictionary<FBGraphUser>* friend in friends) {
            NSLog(@"I have a friend named %@ with id %@", friend.name, friend.id);
        }*/
        NSDictionary<FBGraphUser>* friend;
        name = friend.name;
    }];
   /*
    NSDictionary *one = self.data[indexPath.row];
    
    NSString *contents;
    if (one[@"name"]) {
        contents = [NSString stringWithFormat:@"%@", one[@"name"]];
    }
    else{
        contents = one[@"story"];
        cell.indentationLevel =2;
    }*/
    cell.textLabel.text = name;
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
