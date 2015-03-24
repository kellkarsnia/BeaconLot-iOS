//
//  CouponViewController.m
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/10/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import "CouponViewController.h"
#import <PassKit/PassKit.h>

@interface CouponViewController () <PKAddPassesViewControllerDelegate>
{
    NSMutableArray *_passes; //3
}

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation CouponViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
    
    [self.submitButton setImage:[UIImage imageNamed:@"submit_unpressed2.png"] forState:UIControlStateSelected];
    
    self.nameText.delegate = self;
    [self.nameText resignFirstResponder];
    
    self.emailText.delegate = self;
    [self.emailText resignFirstResponder];
    
}

#pragma mark - Pass controller delegate

-(void)addPassesViewControllerDidFinish: (PKAddPassesViewController*) controller
{
    //pass added
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (IBAction)submitButton:(id)sender {
    SKPSMTPMessage *forgotPassword = [[SKPSMTPMessage alloc] init];
    [forgotPassword setFromEmail:@"joey@exhilent.com"];  // Change to your email address
    [forgotPassword setToEmail:@"joey@exhilent.com"]; // Load this, or have user enter this
    [forgotPassword setRelayHost:@"smtp.gmail.com"];
//    [theMessage setRequiresAuth:YES]; // GMail requires this
    [forgotPassword setRequiresAuth:YES]; // GMail requires this
    [forgotPassword setLogin:@"exhilentdev@gmail.com"]; // Same as the "setFromEmail:" email
    [forgotPassword setPass:@"testing527"]; // Password for the Gmail account that you are sending from
    [forgotPassword setSubject:@"BeaconLot Lead"]; // Change this to change the subject of the email
    [forgotPassword setWantsSecure:YES]; // Gmail Requires this
    [forgotPassword setDelegate:self]; // Required
    
    //NSString *newpassword = @"helloworld";
    
    if([self validateEmailWithString:self.emailText.text] == NO) {
        
    } else {
        NSString *nameText = self.nameText.text;
        NSString *emailText = self.emailText.text;
        
        NSString *nameTextFormatted = [NSString stringWithFormat:@"Name: %@", nameText];
        NSString *emailTextFormatted = [NSString stringWithFormat:@"Email: %@", emailText];
        
        //NSString *textOutStations = [NSString stringWithFormat:@"Hello Everyone. Please check out website:<br> <a href=\"google.com\">http://www.google.com/</a>"];
        //NSString *textOutStations = @"<html><head><title></title></head><body><div> Hello Everyone. Please check out website:<br/> <a href=\"http://www.google.com/\"> http://www.google.com/ </a>  </div></body></html>";
        
        //    NSString *message = [NSString stringWithFormat:@"You just received a new lead from the lot.  They completed all of the beacon checkins and have received a coupon. \r\r%@\r%@\r%@", nameTextFormatted, emailTextFormatted, textOutStations];
        NSString *message = [NSString stringWithFormat:@"You just received a new lead from the lot.  They completed all of the beacon checkins and have received a coupon. \r\r%@\r%@", nameTextFormatted, emailTextFormatted];
        NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain", kSKPSMTPPartContentTypeKey, message, kSKPSMTPPartMessageKey, @"8bit" , kSKPSMTPPartContentTransferEncodingKey, nil];
        
        [forgotPassword setParts:[NSArray arrayWithObjects:plainPart, nil]];
        [forgotPassword send];
    }
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    
    if ([emailTest evaluateWithObject:self.emailText.text] == NO)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Address Error" message:@"Please Enter a Valid Email Address" delegate:nil cancelButtonTitle:@"Retry" otherButtonTitles:nil];
        [alert show];
    }
    return [emailTest evaluateWithObject:email];
}

- (void)messageSent:(SKPSMTPMessage *)message {
    NSLog(@"Message Sent");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information Sent" message:@"Thank you for visiting Roger Beasley Mazda!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    //4
    if (![PKPassLibrary isPassLibraryAvailable]) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"PassKit not available"
                                   delegate:nil
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles: nil] show];
        return;
    }
    
    // 1 initialize objects
    _passes = [[NSMutableArray alloc] init];
    
    //2 load the passes from the resource folder
    NSString* resourcePath =
    [[NSBundle mainBundle] resourcePath];
    
    NSArray* passFiles = [[NSFileManager defaultManager]
                          contentsOfDirectoryAtPath:resourcePath
                          error:nil];
    
    //3 loop over the resource files
    for (NSString* passFile in passFiles) {
        if ( [passFile hasSuffix:@".pkpass"] ) {
            [_passes addObject: passFile];
        }
    }
    
    if ([_passes count]==1) {
        [self openPassWithName:[_passes objectAtIndex:0]];
    }
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    NSLog(@"Message Failed With Error(s): %@", [error description]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error sending your information. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)openPassWithName:(NSString*)name
{
    //2
    NSString* passFile = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent: name];
    
    //3
    NSData *passData = [NSData dataWithContentsOfFile:passFile];
    
    //4
    NSError* error = nil;
    PKPass *newPass = [[PKPass alloc] initWithData:passData
                                             error:&error];
    //5
    if (error!=nil) {
        [[[UIAlertView alloc] initWithTitle:@"Passes error"
                                    message:[error
                                             localizedDescription]
                                   delegate:nil
                          cancelButtonTitle:@"Ooops"
                          otherButtonTitles: nil] show];
        return;
    }
    
    //6
    PKAddPassesViewController *addController =
    [[PKAddPassesViewController alloc] initWithPass:newPass];
    
    addController.delegate = self;
    [self presentViewController:addController
                       animated:YES
                     completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide kwyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
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

@end
