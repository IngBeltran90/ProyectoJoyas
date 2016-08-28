//
//  HomeViewController.h
//  introTablesRoHe
//
//  Created by RobertoHerrera on 6/23/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellAmande.h"
#import "WhoViewController.h"
#import "MapsViewController.h"


@interface Home : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tblAvengers;
@property (strong, nonatomic) IBOutlet UILabel *lblItemSelect;
@property (strong, nonatomic) IBOutlet UITableView *tblAmande;
@end
