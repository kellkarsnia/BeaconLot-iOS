//
//  WebViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/6/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.navigationItem setTitle:@"Capitol Chevy Online"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<Back" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popToRootViewControllerAnimated:)];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    NSURL *url = [NSURL URLWithString:@"http://rogerbeasley.mobi"];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [self.webViewCustom loadRequest:requestURL];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //[self loadUIWebView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)loadUIWebView
{
    NSString *urlToLoad = @"http://rogerbeasley.mobi";
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];  //Change self.view.bounds to a smaller CGRect if you don't want it to take up the whole screen
    webView.tag=55;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToLoad]]];
    [self.view addSubview:webView];
    [webView setOpaque:NO];
    webView.backgroundColor = [UIColor clearColor];
    //    [webView.hidden = [YES]];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //    [webView.hidden = [NO]];
    // flicker fix
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    self.view.alpha = 1;
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
