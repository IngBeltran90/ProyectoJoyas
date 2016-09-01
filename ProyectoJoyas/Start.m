//
//  ViewController.m
//  introTablesRoHe
//
//  Created by RobertoHerrera on 6/23/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "Start.h"
#import <DigitsKit/DigitsKit.h>

@interface Start ()

@end

@implementation Start
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    
   // Digits.sharedInstance().sessionUpdateDelegate = self
    /*Digit part to add login button*/
    //[[Digits sharedInstance] logOut]; /*Comentar esta linea para seguir logeado*/
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Numero de celular: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gracias por utilizar nuestra app!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"Continuar"
                                                  otherButtonTitles:nil];
            [alert show];
        
            /*Here is my code*/
            [self initController];
            
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    CGPoint point;
    point.x = 215.0f;
    point.y = 450.0f;
    authButton.center = point;
    authButton.digitsAppearance = [self makeTheme];
    [self.view addSubview:authButton];
   /*End to logoin button*/
    
    
}
//-------------------------------------------------------------------------------
- (DGTAppearance *)makeTheme {
    DGTAppearance *theme = [[DGTAppearance alloc] init];
    /*
    theme.bodyFont = [UIFont fontWithName:@"Noteworthy-Light" size:16];
    theme.labelFont = [UIFont fontWithName:@"Noteworthy-Bold" size:17];
    */
     theme.accentColor = [UIColor colorWithRed:(0.0/255.0) green:(172/255.0) blue:(238/255.0) alpha:1];
    theme.backgroundColor = [UIColor colorWithRed:(230.0/255.0) green:(255/255.0) blue:(250/255.0) alpha:1];
    // TODO: Set a UIImage as a logo with theme.logoImage
    return theme;
}

//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    array_stuffNames = [[NSMutableArray alloc] init];
    array_stuffPrices = [[NSMutableArray alloc] init];//falta qponerlo en la siguiente clase
    array_stuffQuant = [[NSMutableArray alloc] init]; //falta qponerlo en la siguiente clase
    array_stuffImgs = [[NSMutableArray alloc] init];
    
    maIntroTitles   = [[NSMutableArray alloc] initWithObjects: @"Somos fabricantes \nCambia de pagina para continuar", @"Encuentra tus accesorios favoritos desde tu celular\n\nCambia de pagina para continuar", @"Contactanos directamente\n\nCambia de pagina para continuar",@"Conoce todo nuestro catalogo en linea\n\nCambia de pagina para continuar", nil];
    
    maIntroImgs     = [[NSMutableArray alloc] initWithObjects: @"anillos.jpg", @"aretes.jpg", @"collares.jpg",@"dije.jpg", nil];
    
    
    
    
    [self createPageViews];
}
/**********************************************************************************************/
#pragma mark - Page controller methods and delegates
/**********************************************************************************************/
- (void)createPageViews {
    // Create page view controller
    self.pageViewController             = [self.storyboard instantiateViewControllerWithIdentifier:@"PageIntroController"];
    self.pageViewController.dataSource  = self;
    
    Intro *startingViewController       = [self viewControllerAtIndex:0];
    NSArray *viewControllers            = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Change the size of page view controller
    self.pageViewController.view.frame  = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    thisControl.hidden = true;
}
//-------------------------------------------------------------------------------
- (Intro *)viewControllerAtIndex:(NSUInteger)index
{
    if (([maIntroTitles count] == 0) || (index >= [maIntroTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    Intro *pageIntro            = [self.storyboard instantiateViewControllerWithIdentifier:@"Intro"];
    pageIntro.iPageIndex        = index;
    /*aqui hace falta algo**/
    
    return pageIntro;
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [maIntroTitles count];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


- (IBAction)btnSkipPressed:(id)sender {
}

@end
