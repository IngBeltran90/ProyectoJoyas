//
//  TableViewCell.h
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/25/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgAmande;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblMaterial;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;

@end
