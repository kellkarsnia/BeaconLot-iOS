//
//  ContactViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/6/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "ContactViewController.h"
#import "ViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

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
    [self.navigationItem setTitle:@"Contact Us"];
}

- (IBAction)tappedNavButton:(id)sender {
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:mainVC animated:YES completion:nil];
    NSLog(@"TRIED TO PUSH MAINVC");
}

- (IBAction)tappedNavButton_iPad:(id)sender {
    ViewController *mainVC =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:mainVC animated:YES completion:nil];
    NSLog(@"TRIED TO PUSH MAINVC");
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
