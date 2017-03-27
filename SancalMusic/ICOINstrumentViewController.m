//
//  ICOINstrumentViewController.m
//  SancalMusic
//
//  Created by User on 7/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "ICOINstrumentViewController.h"

//Importamos la clase que vamos a hacerle un pushViewController
#import "ICOWebViewController.h"
//Importamos la clase que vamos a hacerle un pushViewController
#import "ICOMapLocalizationViewController.h"

@interface ICOINstrumentViewController ()

@end

@implementation ICOINstrumentViewController


//Inicializadro designado del modelo
//El controlador necesita saber quien es su modelo y quien es su vista
//la vista es nil y llama unicamente al xib que este ligado a la clase y le modelo se pasamos de manera clara como un parametro
//posteriormente debemos usar las subvistas que nos peritira colocar las imagenes los textos etc

-(id)initWithModel:(iCoInstrumentsModel *)aModel{
    
    
    
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) {
        self.model = aModel;
        
        //Directamente accedemos a la propiedad title que esta todo VireController y le pasamos el Nombre de Nuetro Modelo ya que puede cambiarnos a Guitarras o Pinaos o lo que sea
        self.title = aModel.name;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//Todo View Controller puede recibir avisos de memoria
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Este metodo se coloca pues lo que buscamos es que se preparen las cosas con los tiempos correctos de ejecucion
//es parte del Delegado de la aplicacion  y lo usaremos de manera cotidiana
//nos pasa un parametro de tipo boleano es decir verdadero o falso
//este metodo nos permitira llevara la tarea fundamental de mantener sincronizado el MODELO Y LA VISTA

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //Metodo propio de utilidades de aqui le decimos que queremos suncronozar le modelo con la vista
    [self syncModelWithView];
    
    //Aqui podemos cambiar el color de los textos del navigation controller esto en la fase 3 de Navigation Controller
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.3
                                                                        green:0.3
                                                                         blue:0.3
                                                                        alpha:1.f];
    
}

#pragma mark - Utilities

-(void)syncModelWithView{
    
    
    self.nameLabel.text = self.model.name;
    self.instrumentsCompanyNameLabel.text = self.model.instrumentsCompanyName;
    self.typeInstrumentsLabel.text = self.model.typeInstrument;
    self.markInstrumentLabel.text = self.model.markInstrument;
    self.combinationInstrumentLabel.text = [self arrayToString: self.model.combinationInstrument]; //metodo propio de utilidades
    self.notesLabel.text = self.model.notes;
    self.photoImageView.image = self.model.photo;
    
    //Llamamos a un metodo que vamos a definir
    [self displayRating: self.model.ratingInstrument];
    
    //Aqui le damos la propiedad de mas texto al label --> esto lo colocamos cuando inicializemos nuestra priera vez y vamos
    //puliendo
    [self.notesLabel setNumberOfLines:0];
    
    
}

//Metodo propio que no necesariamente debemos declararlo en el .h
-(NSString *)arrayToString:(NSArray *)anArray{
    
    //Con el array vamos sacando cada una de las cadenas y las vamos concatenando
    //es un elmento que toma todos los elementos y los concatena utilizando un separador
    //No concatenamos objetos por los objetos son mutables
    
    NSString *representation = nil;
    
    if ([anArray count] == 1) {
        representation = [@"100 %" stringByAppendingString:[anArray lastObject]];
    }
    else{
        representation = [[anArray  componentsJoinedByString:@", "] stringByAppendingString:@". "];
    }
    
    //devolvemos la cadena en este caso lo que queremos es que sea una muestra final tipo 100% Electrica o 100% Acustica
    return representation;
    
}

//Aqui colocamos el metodo que se encarga de refrescar nuestro rating cada vez que cambie de instrumento

-(void)clearRatingInstruments{
    
    //  Esto se lee asi "por cada objeto del tipo UIImageView dentro de cada coleccion"
    for (UIImageView *imageView in self.ratingViews) {
        imageView.image = nil;
    }
    
}


//Aqui declaramos nuestro metodo propio que nos mostrara en la pantalla nuestro rating
-(void)displayRating: (int) aRatingInstruments{
    
    //limpiamos las estrellas si nos cambia el modelo lo primero es limpiar todos las posibles valoraciones
    [self clearRatingInstruments];
    
    //Creamos el objeto del tipo UIImage u le pasamos el mensaje UIImage ImageNamed y nos lo busca dentro de nuestro ficheros
    UIImage *starRating = [UIImage imageNamed:@"star.jpg"];
    
    //Bucle que nos escribira el numero del rating que deseamos colocar a cada instrumento
    for (int i = 0; i < aRatingInstruments; i ++) {
        
        [[self.ratingViews objectAtIndex:i] setImage:starRating];
    }
    
}







#pragma mark - Actions

//Accion acepta como parametro un id es decir cualquiera

-(IBAction)displayWebSite:(id)sender{
    
    //Fase 3 vamos a ajustar los parametros del navigation View Controller
    //NSLog(@"Go to %@", self.model.instrumentCompanyWeb);
    
    //Creamos un WebViewController y hacemos un push por tanto es necesario importar la clase del controlador Web y le decimos que debe inicializarse con mi modelo
    
    ICOWebViewController *webVC = [[ICOWebViewController alloc]initWithModel:self.model];
    
    //Hacemos un push --> pero como sabemos en donde estamos pues todo ViewController tiene una propiedad que se llama Navigation Controller
    //si bien esta en nil o si estas dentro de un navigation controller apunta a ese navigation controller
    
    [self.navigationController pushViewController:webVC
                                         animated:YES];
    
    
}

#pragma mark - MailCompose

- (IBAction)sendMail:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc]init];
        
        mailComposer.mailComposeDelegate = self;
        [mailComposer setSubject:@"Un mensaje de Sancal Music SL"];
        
        NSArray *toRecipient = [NSArray arrayWithObjects:@"", nil];
        [mailComposer setToRecipients:toRecipient];
        
        UIImage *myImage = [UIImage imageNamed:@"NORMAL_ICON.jpg"];
        NSData *imageData = UIImageJPEGRepresentation(myImage, 50);
        
        [mailComposer addAttachmentData:imageData
                               mimeType:@"IMAGES"
                               fileName:@"NORMAL_ICON.jpg"];
        
        NSString *emailBody = @"TIENES SANCAL MUSIC APP?";
        [mailComposer setMessageBody:emailBody isHTML:NO];
        
        [self presentViewController:mailComposer animated:YES completion:nil];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ATENCIÓN"
                                                        message:@"TU DISPOSITIVO NO SOPORTA EL COMPONENTE DE ENVIAR MAIL"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK!"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)userLocation:(id)sender {
    
    ICOMapLocalizationViewController *mapVC = [[ICOMapLocalizationViewController alloc]init];
    
    [self.navigationController pushViewController:mapVC animated:YES];
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelado: Haz cancelado la operación y el no envío del mail que haz solicitado");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail salvado: Haz salvado el mail in la carpeta de borradores");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail enviado: el mail que haz enviado esta en la carpeta de salida, esta preparado para salir");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail fallido: ha ocurrido un error en el envio del mail, existe un posible error");
            break;
            
        default:
            NSLog(@"Mail no enviado");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - UISplitViewControllerDelegate

//es importante hacer una cosa en el app delegate que es definir quien es el delegado de quien

//SplitView Controller fulanito de tal ocultara el view controller y me lo pasa utlizando este boton de barra en este controlador del tipo popUp

-(void)splitViewController:(UISplitViewController *)svc
    willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc{
    
    //Aqui lo unico que nos interesa es el boton de la barra
    //todo View controler tiene navigation controller y un navigation item el cual usamos para añadir o quitar botones en la barra de navegacion
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    
    
}

//Split View controller fulanito de tal mostrare el controlador dejando de usar este bar buton item invocado en el anterior metodo delegado

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.rightBarButtonItem = nil;
    
    
}


#pragma mark - StoreTableViewControllerDelegate

-(void)storeTableViewController:(ICOStoreTableViewController *)storeVC
            didSelectInstrument:(iCoInstrumentsModel *)aInstrument{
    
    //Aqui lo que hacemos es actualizar el modelo a este otro vino
    
    self.model = aInstrument;
    
    //Actualizamos el titulo
    
    self.title = aInstrument.name;
    
    //debemos sincronizar de nuevo todas las vistas
    
    [self syncModelWithView];
    
    //aqui debemos decirle a la tabla quien es su delegado y nos vamos al AppDelegate
    
    
}















@end
