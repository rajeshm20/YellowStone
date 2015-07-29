//
//  testViewController.m
//  YellowStone
//
//  Created by Rajesh M on 7/29/15.
//  Copyright (c) 2015 Rajesh M. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([TWTweetComposeViewController canSendTweet]) {
        _tweetButton.enabled = YES;
    } else {
        
        _tweetButton.enabled = NO;
        [self displayResult:@"Twitter not set up on iPhone"];
    }
}


-(void) viewDidUnload {
    
    [self setResultText:nil];
    [self setTweetButton:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendTweet:(id)sender {
    TWTweetComposeViewController *tweetviewController = [[TWTweetComposeViewController alloc]init];
    
    [tweetviewController setInitialText:@"Hello twitter"];
    
    [tweetviewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
        
        NSString *output;
        
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
            output = @"tweet cancelled";
                break;
                
            case TWTweetComposeViewControllerResultDone:
            output = @"tweet sent";
                break;
                
            default:
                break;
        }
        
        [self performSelectorOnMainThread:@selector(displayResult) withObject:output waitUntilDone:NO];
        [self dismissModalViewControllerAnimated:YES];
        
    }];
    
    [self presentModalViewController:tweetviewController animated:YES];
    
    };


-(void)displayResult:(NSString *)text {
    
    self.resultText.text = text;
}
    
@end
