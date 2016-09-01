//
//  PaypalViewController.h
//  ProyectoJoyas
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
#import "CatalogViewController.h"
#import "PayPalMobile.h"
#import "ShopCarTableCell.h"
#import "Declarations.h"

@interface PaypalViewController : UIViewController<PayPalPaymentDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;
@property (strong, nonatomic) IBOutlet UITableView *tblShopCart;
@property (strong, nonatomic) IBOutlet UIButton *btnAtraso;
@property (strong, nonatomic) IBOutlet UILabel *lblTotalPagar;
- (IBAction)btnAtras:(id)sender;



@property NSInteger indexSelectedShop;

@end

