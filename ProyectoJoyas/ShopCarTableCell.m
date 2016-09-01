//
//  ShopCarTableCell.m
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/31/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "ShopCarTableCell.h"

@implementation ShopCarTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)EliminarPressed:(id)sender {
    [array_stuffNames removeObjectAtIndex:(0)];
    
}
@end
