//
//  ShopCarTableCell.h
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/31/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"

@interface ShopCarTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblNameStuff;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblQuant;
@property (strong, nonatomic) IBOutlet UILabel *lblSubtotal;
@property (strong, nonatomic) IBOutlet UIImageView *imgStuff;
@property (strong, nonatomic) IBOutlet UIButton *lblBtnEliminar;
- (IBAction)EliminarPressed:(id)sender;

@end
