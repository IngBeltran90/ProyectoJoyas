//
//  CatalogViewController.m
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/25/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "CatalogViewController.h"
#import <Google/Analytics.h>

@interface CatalogViewController ()
@property NSMutableArray *stuffNames;
@property NSMutableArray *stuffPrices;
@property NSMutableArray *stuffMaterial;
@property NSMutableArray *stuffImgs;
@end

@implementation CatalogViewController
NSInteger indexSelected;
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    //[super viewWillAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Catalogo Screen"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    // [END screen_view_hit_objc]
}
//-------------------------------------------------------------------------------
- (void)initController {
    boDirectToShopCart=0;
    self.stuffNames   = [[NSMutableArray alloc] initWithObjects: @"Anillos de matrimonio", @"Aretes", @"Collar Artesanal", @"Dijes & Nombres", @"Esclavas Personalizadas", @"Juegos completos", nil];
    
    self.stuffImgs   = [[NSMutableArray alloc] initWithObjects: @"anillos.jpg", @"aretes.jpg", @"collares.jpg", @"dije.jpg", @"esclava.jpg", @"anillos.jpg", nil];
    
    self.stuffMaterial  = [[NSMutableArray alloc] initWithObjects: @"Oro Blanco", @"Resina Colores", @"Laton Chapeado", @"Plata, oro, chapa", @"Oro o Plata", @"Chapeados", nil];
    
    self.stuffPrices   = [[NSMutableArray alloc] initWithObjects: @"2500.00", @"150.00", @"250.00", @"200.00", @"3000.00", @"550.00", nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stuffNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 116;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    }
    //Fill cell with info from arrays
    cell.lblName.text       = self.stuffNames[indexPath.row];
    cell.lblPrice.text       = self.stuffPrices[indexPath.row];
    cell.lblMaterial.text       = self.stuffMaterial[indexPath.row];
    cell.imgAmande.image   = [UIImage imageNamed:self.stuffImgs[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    indexSelected = indexPath.row;
    /*
    self.lblItemSelect.hidden = NO;
    self.lblItemSelect.text = self.stuffNames[indexPath.row];
    */
    [self performSegueWithIdentifier:@"ShopViewController" sender:self];

}

#pragma mark - Navigation


- (IBAction)btnPressBack:(id)sender {
    [self performSegueWithIdentifier:@"Home" sender:self];
}


////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[PaypalViewController class]]) {
        
    }
    if ([segue.destinationViewController isKindOfClass:[ShopViewController class]]) {
        ShopViewController *destination   = [segue destinationViewController];
        destination.stuffNames     = self.stuffNames[indexSelected];
        destination.stuffPrices        = self.stuffPrices[indexSelected];
        destination.stuffImgs          = self.stuffImgs[indexSelected];
        destination.stuffMaterial     = self.stuffMaterial[indexSelected];
    }
}
- (IBAction)btnIrAlCarrito:(id)sender {
    boDirectToShopCart =1;
    Home *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PaypalViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
