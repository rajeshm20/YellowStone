//
//  testViewController.h
//  YellowStone
//
//  Created by Rajesh M on 7/29/15.
//  Copyright (c) 2015 Rajesh M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface testViewController : UIViewController
- (IBAction)sendTweet:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultText;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;
-(void)displayResult:(NSString *)text;
@end
