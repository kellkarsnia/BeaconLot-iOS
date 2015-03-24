//
//  ContactUsViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/6/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "ContactUsViewController.h"
#import "ViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<Back" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popToRootViewControllerAnimated:)];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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

- (IBAction)resetDataOutlet:(id)sender {
    //exit(0);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Exit and Reset the Application?" delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:nil, nil];
    [alert setAlertViewStyle:UIAlertViewStyleDefault];
    [alert show];
}

#pragma mark Alert Methods
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    //[self checkPin];
    exit(0);
}
@end
