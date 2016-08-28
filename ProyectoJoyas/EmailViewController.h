//
//  EmailViewController.h
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/24/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

#import <MessageUI/MessageUI.h>

@interface EmailViewController : UIViewController<MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *mailComposer;
}
-(IBAction)sendMail:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)btnPressBack:(id)sender;
@end
