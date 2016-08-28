//
//  ShopViewController.h
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/24/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

@interface ShopViewController : UIViewController
@property NSString *stuffNames;
@property NSString *stuffPrices;
@property NSString *stuffMaterial;
@property NSString *stuffImgs;
@property (strong, nonatomic) IBOutlet UILabel *lblProduct;
@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;
@property (strong, nonatomic) IBOutlet UILabel *PriceProduct;
@property (strong, nonatomic) IBOutlet UITextView *DesProduct;
@property (strong, nonatomic) IBOutlet UILabel *MaterialProduct;

@property (strong, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)btnPressBack:(id)sender;

@end
