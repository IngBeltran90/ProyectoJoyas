//
//  IntroViewController.h
//  introTablesRoHe
//
//  Created by RobertoHerrera on 6/23/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Home.h"

@interface Intro : UIViewController
@property NSUInteger                                iPageIndex;
@property (strong, nonatomic) IBOutlet UILabel *lblIntro;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;
@property (strong, nonatomic) IBOutlet UIButton *btnIntro;

- (IBAction)btnIntroPressed:(id)sender;
@end
