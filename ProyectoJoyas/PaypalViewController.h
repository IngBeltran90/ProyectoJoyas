//
//  PaypalViewController.h
//  ProyectoJoyas
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
#import "ShopCarTableCell.h"
#import "Declarations.h"

@interface PaypalViewController : UIViewController<PayPalPaymentDelegate>
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;
@property (strong, nonatomic) IBOutlet UITableView *tblAmande;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UILabel *lblTotalPagar;



@property NSInteger indexSelectedShop;

@end

