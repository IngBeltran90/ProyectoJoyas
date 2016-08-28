//
//  PaypalViewController.h
//  ProyectoJoyas
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface PaypalViewController : UIViewController<PayPalPaymentDelegate>
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;

@end
