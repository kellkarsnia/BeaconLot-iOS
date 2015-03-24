//
//  RightCarViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/10/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "RightCarViewController.h"
#import "ViewController.h"

@interface RightCarViewController ()

@end

@implementation RightCarViewController

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
    
    [self showBackButton];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)showBackButton{
    //    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:@selector(backPressed)];
    //    self.navigationItem.leftBarButtonItem = backButton;
    
    //    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:abPersonController];
    //    navController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
    //                                                                                                   target:self
    //                                                                                                   action:@selector(dismissModal)];
    //    [self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)tappedNavButton:(id)sender {
//    ViewController *mainVC =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [self presentViewController:mainVC animated:YES completion:nil];
//    NSLog(@"TRIED TO PUSH MAINVC FROM RIGHTCARVC");
    
//    ViewController *mainVC =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    mainVC.carRightFound = YES;
//    [self.navigationController pushViewController:mainVC animated:YES];
//    NSLog(@"TRIED TO PUSH MAINVC FROM RIGHTCARVC");
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
