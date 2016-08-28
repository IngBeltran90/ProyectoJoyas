//
//  ViewController.h
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/22/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Intro.h"

@interface Start : UIViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
//@property (strong, nonatomic) IBOutlet UIButton *btnSkip;
//- (IBAction)btnSkipPressed:(id)sender;

@end
