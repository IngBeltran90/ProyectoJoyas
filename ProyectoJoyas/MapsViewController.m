//
//  MapsViewController.m
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/24/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "MapsViewController.h"
@import GoogleMaps;
#import <GoogleMaps/GoogleMaps.h>

@interface MapsViewController ()

@end

@implementation MapsViewController {
GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressBack:(id)sender {
    [self performSegueWithIdentifier:@"Home" sender:self];
}


- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:20.676491
                                                            longitude:-103.339999
                                                                 zoom:15
                                                              //bearing:0
                                                         //viewingAngle:0
                                                                        ];
    
    mapView_ = [GMSMapView mapWithFrame:self.viewMap.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.view addSubview:self.viewMap];
    [self.viewMap addSubview:mapView_];
    //self.view = mapView_;
    //[self.view  addSubview:self.viewMap];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(20.676491, -103.339999);
    marker.title = @"Joyeria Amande";
    marker.snippet = @"Guadalajara";
    marker.map = mapView_;
}

////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[Home class]]) {
    }
}

@end
