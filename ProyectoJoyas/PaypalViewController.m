//
//  PaypalViewController.m
//  ProyectoJoyas
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "PaypalViewController.h"
#import <Google/Analytics.h>


@interface PaypalViewController ()


@end
float fTotalApagar;

@implementation PaypalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblShopCart.editing=YES;
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    fTotalApagar = 0;
    if (boDirectToShopCart == 1) {
        NSLog(@"Entro en si HIDDEN");
        self.btnAtraso.hidden = NO;
    } else {
        NSLog(@"Entro en si HIDDEN");
        self.btnAtraso.hidden = YES;
    }
    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array_stuffNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 116;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    ShopCarTableCell *cell = (ShopCarTableCell *)[tableView dequeueReusableCellWithIdentifier:@"ShopCarTableCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"ShopCarTableCell" bundle:nil] forCellReuseIdentifier:@"ShopCarTableCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCarTableCell"];
    }
    //Fill cell with info from arrays
    cell.lblNameStuff.text       = array_stuffNames[indexPath.row];
    cell.lblPrice.text       = array_stuffPrices[indexPath.row];
    cell.lblQuant.text   =array_stuffQuant[indexPath.row];
    float quant = [[cell.lblQuant text] integerValue];
    float price = [[cell.lblPrice text] integerValue];
    
    cell.lblSubtotal.text = [NSString stringWithFormat:@"%.2f", price * quant];
    
    fTotalApagar = ((price * quant)+fTotalApagar);
    self.lblTotalPagar.text  = [NSString stringWithFormat:@"%.2f",fTotalApagar];
    cell.imgStuff.image   = [UIImage imageNamed:array_stuffImgs[indexPath.row]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger index = indexPath.row;
        float quant = [array_stuffQuant[index] integerValue];
        float price = [array_stuffPrices[index] integerValue];
        
        fTotalApagar = (fTotalApagar-(price * quant));
        self.lblTotalPagar.text  = [NSString stringWithFormat:@"%.2f",fTotalApagar];
        
        [array_stuffNames removeObjectAtIndex:index];
        [array_stuffPrices removeObjectAtIndex:index];
        [array_stuffQuant removeObjectAtIndex:index];
        [array_stuffImgs removeObjectAtIndex:index];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tblShopCart.editing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    indexSelectedShop = indexPath.row;

    [self performSegueWithIdentifier:@"ShopViewController" sender:self];
    
}
*/
//-------------------------------------------------------------------------------
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = YES;
        
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        [tracker set:kGAIScreenName value:@"Paypal Screen"];
        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        // [END screen_view_hit_objc]
    
    // Start out working with the test environment! When you are ready, switch to PayPalEnvironmentProduction.
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}

// SomeViewController.m

- (IBAction)pay {
    if (fTotalApagar>0) {
        
    
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithString:self.lblTotalPagar.text];
    payment.currencyCode = @"MXN";
    payment.shortDescription = @"Joyeria Amande";
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your server, you may provide it here.
    //payment.shippingAddress = address; // a previously-created PayPalShippingAddress object
    
    // Several other optional fields that you can set here are documented in PayPalPayment.h,
    // including paymentDetails, items, invoiceNumber, custom, softDescriptor, etc.
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    
    // continued below...
    
    // ...continued from above
    
    // Create a PayPalPaymentViewController.
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
    

        
    }else{
        NSLog(@"No tienes nada que pagar.....");
    }
}

#pragma mark - PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
    [array_stuffNames removeAllObjects];
    [array_stuffPrices removeAllObjects];
    [array_stuffQuant removeAllObjects];
    [array_stuffImgs removeAllObjects];
    fTotalApagar=0;
    self.lblTotalPagar.text  = [NSString stringWithFormat:@"%.2f",fTotalApagar];
    [self.tblShopCart reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //[self.navigationController popToViewController:self animated:YES];
    //Home *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Home"];
    //[self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAtras:(id)sender {

      Home *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Home"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
