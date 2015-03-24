//
//  CouponViewController.h
//  Capitol Chevy
//
//  Created by Kelly Karsnia on 6/10/14.
//  Copyright (c) 2014 Exhilent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SKPSMTPMessage.h"

@interface CouponViewController : UIViewController <SKPSMTPMessageDelegate, UITextFieldDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UIButton *couponButtonBig;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
