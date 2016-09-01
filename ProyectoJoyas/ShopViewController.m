//
//  ShopViewController.m
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/24/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stuffQuant = self.textQuant.text;
    self.lblTotal.text  =self.stuffPrices;
    self.lblProduct.text        = self.stuffNames;
    self.PriceProduct.text      = self.stuffPrices;
    self.imgProduct.image   = [UIImage imageNamed:self.stuffImgs];
    self.MaterialProduct.text   = self.stuffMaterial;
    if ([self.lblProduct  isEqual: @"Anillos de matrimonio"]) {
        self.DesProduct.text   = @"El anillo de bodas, llamado también alianza de matrimonio, es un aro normalmente liso en el cual, y en la parte interior, se graban los nombres de quienes contraen matrimonio. Este anillo suele hacerse en oro, siendo la pureza del oro de 18 quilates en España, 22 o 24 en los países árabes y de menor en otros países como Alemania.";
        
    }else if ([self.stuffNames  isEqual: @"Aretes"]) {
       self.DesProduct.text   = @"El arete con su colgante figuraba a menudo en los relieves de personajes asirios pero no se observa en los de Egipto donde parece que no estuvieron muy en boga los pendientes. No obstante, se han encontrado preciosos ejemplares en tumbas de princesas de las dinastías XII y XIII y de faraones de la XX entre otros. De egipcios y asirios copiaron la forma los fenicios, hebreos y otros pueblos orientales. La misma costumbre adoptaron los griegos y romanos, labrando pendientes de singular riqueza con aretes de oro y colgantes de perlas, gemas y pequeñas cabezas de metal siendo su uso propio de las mujeres, como en los demás países de Occidente. Sin embargo, solían llevar pendientes también los niños de Atenas y Roma aunque sólo en una oreja.";
        
    }else if ([self.stuffNames  isEqual: @"Collar Artesanal"]) {
        self.DesProduct.text   = @"Se le ha considerado normalmente como adorno de mujeres, pero lejos de ser exclusivo, han usado de él también los varones en los pueblos indígenas y en las civilizaciones antiguas de Oriente y Egipto (apenas en las de Grecia) en las de Etruria y Roma, en el Imperio bizantino y algo en el Occidente medieval (por lo menos, en el siglo XIV), cesando en Europa desde el siglo XV para los hombres, salvo para uso como condecoración honorífica. \nSe le ha considerado normalmente como adorno de mujeres, pero lejos de ser exclusivo, han usado de él también los varones en los pueblos indígenas y en las civilizaciones antiguas de Oriente y Egipto (apenas en las de Grecia) en las de Etruria y Roma, en el Imperio bizantino y algo en el Occidente medieval (por lo menos, en el siglo XIV), cesando en Europa desde el siglo XV para los hombres, salvo para uso como condecoración honorífica.";
        
    }else if ([self.stuffNames  isEqual: @"Dijes & Nombres"]) {
        self.DesProduct.text   = @"Que son los dijes ya de pequeña dimensión provista de un pequeño aro para ser colgada a una cadena.\n Consta que usaban los reyes y magnates asirios y persas vajillas de oro y plata, dijes y adornos de inestimable precio, carruajes y aparejos de montura cuajados de oro y plata, sillas o tornos, mesas y lechos de preciosos metales o de bronce dorado, etc.\nEntre las piezas metálicas de alguna importancia que se han descubierto en las ruinas de sus antiguas ciudades se cuentan principalmente:";
        
    }else if ([self.stuffNames  isEqual: @"Esclavas Personalizadas"]) {
        self.DesProduct.text   = @"El origen de las pulseras esclavas está basado en una leyenda Índia y significa cada mujer india al casarse con un indio recibía una pulsera hecha con ramas o plantas la cual pactaba fidelidad a él, los indios tenían muchos enfrentamientos con conquistadores que venían a usurparles las tierras, los cuales muchos perdían la vida en esas peleas, entonces la mujer india al morir el marido podía casarse con otro, el cual le ponía otra pulsera (esclava), las mujeres indias no podían tener mas de tres esclavas, si llegaban al tercer compromiso eran sacrificadas en nombre de los maridos que eran guerreros caídos en guerras por defender sus tierras.";
        
    }else if ([self.stuffNames  isEqual: @"Juegos Completos"]) {
        self.DesProduct.text   = @"Los primeros hallazgos de orfebrería son sencillas piezas de cobre que datan del final del periodo neolítico seguidas muy pronto de las de oro, plata y bronce, al abrirse la edad que recibe el nombre de este último metal. Los objetos que se labraron con dichos materiales consistían en diademas lisas a modo de cinta, gruesos brazaletes y collares rígidos (o torques) de una pieza, terminada por bolas piriformes, otros collares formados por sartas de bolitas perforadas y, en fin, anillos y pendientes de forma circular sencilla. La ornamentación de tales preseas, cuando existe, es puramente geométrica y se limita a surquillos rectos y en zig-zag, dientes, circulillos, puntos hechos a martillo, etc. Como cosa excepcional, se existe del antiguo Egipto algún cuchillo de sílex con guarnición y vaina de oro, ornamentadas con florones y figuras de animales. Se labraron también de cobre y de bronce agujas, cuchillos y armas diferentes en forma de flechas, espadas y hachas con alguna ornamentación geométrica en el puño y con un temple y corte bastante fino en la hoja.";
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLblTotal{
    // self.lblTotal.text = (NSString)self.stuffPrices.intValue;
    float valor = [[self.textQuant text] integerValue];
    self.lblTotal.text = [NSString stringWithFormat:@"%.2f", (self.stuffPrices.intValue * valor)];
    self.stuffQuant = self.textQuant.text;
}


- (IBAction)btnPressBack:(id)sender {
    [self performSegueWithIdentifier:@"Home" sender:self];
}

- (IBAction)btnComprar:(id)sender {
    [self performSegueWithIdentifier:@"PaypalViewController" sender:self];
}

////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[Home class]]) {
        
    }
    if ([segue.destinationViewController isKindOfClass:[PaypalViewController class]]) {

        NSLog(@"entro a payapl");

        [array_stuffNames addObject:self.stuffNames];
         [array_stuffPrices addObject:self.stuffPrices];
         [array_stuffQuant addObject:self.stuffQuant];
         [array_stuffImgs addObject:self.stuffImgs];
        
        /*
        nextClass.indexSelectedShop =0;
        
        nextClass.array_stuffNames[nextClass.indexSelectedShop]       = self.stuffNames;
        nextClass.array_stuffPrices[nextClass.indexSelectedShop]      = self.stuffPrices;
        nextClass.array_stuffQuant[nextClass.indexSelectedShop]       = self.textQuant;
        nextClass.array_stuffImgs[nextClass.indexSelectedShop]        = self.stuffMaterial;
        */
        
        NSString *test = [array_stuffNames  objectAtIndex:0];
        NSLog(@"Nombre en 0: %@",test);
        
    /*
        nextClass.indexSelectedShop++;
        NSLog(@"siguiente index: %ld",(long)nextClass.indexSelectedShop);
     */
        
    }
}

@end
