//
//  MLParentViewController.m
//  medilifts
//
//  Created by Saurabh on 5/4/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLParentViewController.h"
#import <MessageUI/MessageUI.h>

@interface MLParentViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation MLParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *callButton = [UIButton buttonWithType:UIButtonTypeSystem];
    callButton.contentScaleFactor = 4;
    [callButton setBackgroundImage:[[UIImage imageNamed:@"phone-receiver"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//    callButton.tintColor = [UIColor grayColor];
    [callButton sizeToFit];
    [callButton addTarget:self action:@selector(callButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *callButtonItem = [[UIBarButtonItem alloc] initWithCustomView:callButton];
    
    UIButton *emailButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [emailButton setImage:[[UIImage imageNamed:@"envelope"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//    emailButton.tintColor = [UIColor grayColor];
    [emailButton addTarget:self action:@selector(emailButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [emailButton sizeToFit];
    UIBarButtonItem *emailButtonItem = [[UIBarButtonItem alloc] initWithCustomView:emailButton];
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 20.0f; // or whatever you want
    
    self.navigationItem.rightBarButtonItems = @[callButtonItem, fixedItem, emailButtonItem];
}

-(void)callButtonTapped:(UIButton *)sender{
    
    NSString *phNo = @"8667863543";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)emailButtonTapped:(UIButton *)sender{
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
        [composer setMailComposeDelegate:self];
        [composer setToRecipients:[NSArray arrayWithObjects:@"info@medilifts.org", nil]];
        [composer setSubject:@"Info"];
        [composer setMessageBody:@"" isHTML:YES];
        [composer setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController presentViewController:composer animated:YES completion:nil];
    }

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
