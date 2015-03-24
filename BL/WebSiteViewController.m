//
//  WebSiteViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/6/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "WebSiteViewController.h"
#import "ViewController.h"

@interface WebSiteViewController ()

@end

@implementation WebSiteViewController

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
    [self.navigationItem setTitle:@"Capitol Chevy Online"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<Back" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popToRootViewControllerAnimated:)];
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
