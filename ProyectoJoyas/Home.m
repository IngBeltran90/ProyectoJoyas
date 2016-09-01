//
//  HomeViewController.m
//  introTablesRoHe
//
//  Created by RobertoHerrera on 6/23/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "Home.h"
#import <Google/Analytics.h>

@interface Home ()
@property NSMutableArray *stuffNames;
@property NSMutableArray *stuffImgs;
@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
- (void)viewWillAppear:(BOOL)animated {
    //[super viewWillAppear:animated];

    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Home Screen"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    // [END screen_view_hit_objc]
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    self.stuffNames   = [[NSMutableArray alloc] initWithObjects: @"Quienes Somos?", @"Localiza nuestras tiendas", @"Compra online", @"Contacto",nil];
    
    self.stuffImgs   = [[NSMutableArray alloc] initWithObjects: @"question.jpg", @"map.png", @"cart.jpg", @"email.png", nil];
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
    return 60;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellAmande *cell = (cellAmande *)[tableView dequeueReusableCellWithIdentifier:@"cellAmande"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellAmande" bundle:nil] forCellReuseIdentifier:@"cellAmande"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellAmande"];
    }
    //Fill cell with info from arrays
    cell.lblName.text       = self.stuffNames[indexPath.row];
    cell.imgAmande.image   = [UIImage imageNamed:self.stuffImgs[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.lblItemSelect.hidden = NO;
    self.lblItemSelect.text = self.stuffNames[indexPath.row];
    
    if(indexPath.row==0){
        [self performSegueWithIdentifier:@"Who" sender:self];
        
    }
    if(indexPath.row==1){
        [self performSegueWithIdentifier:@"Maps" sender:self];
        
    }
    if(indexPath.row==2){
        [self performSegueWithIdentifier:@"Shop" sender:self];
        
    }
    if(indexPath.row==3){
        [self performSegueWithIdentifier:@"Email" sender:self];
        
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[WhoViewController class]]) {
        
        /*
        MapsViewController *destinationState    = [segue destinationViewController];
        destinationState.locationLatitude       = self.coorLatitude;
        destinationState.locationLongitude      = self.coorLongitude;
        destinationState.locationZoom           = self.coorZoom;
        */
    }
    if ([segue.destinationViewController isKindOfClass:[MapsViewController class]]) {
    
    }
    /*
    if ([segue.destinationViewController isKindOfClass:[WhoViewController class]]) {
    }
    if ([segue.destinationViewController isKindOfClass:[WhoViewController class]]) {
    }
     */
    
}

@end

