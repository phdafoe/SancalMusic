//
//  ICOWebViewController.m
//  SancalMusic
//
//  Created by User on 14/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "ICOWebViewController.h"

//Importamos la clase StoreTableView controller
#import "ICOStoreTableViewController.h"



@interface ICOWebViewController ()

@end




@implementation ICOWebViewController


-(id)initWithModel:(iCoInstrumentsModel *)aModel{
    
    self = [super initWithNibName:nil
                           bundle:nil];
    
    if (self) {
        self.model = aModel;
        
        //Directamente accedemos a la propiedad title que esta todo VireController y le pasamos el Nombre de Nuetro Modelo ya que puede cambiarnos a Guitarras o Pinaos o lo que sea
        self.title = aModel.instrumentsCompanyName;
        
    }
    
    return self;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//Aqui debemos darle de alta a la notificacion para que se actualice la vista es obligatorio

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    [self displayURL: self.model.instrumentCompanyWeb];
    
    
    //Alta en notificacion
    //Necesitamos una instancia de la Notificacion
    NSNotificationCenter *centerNot = [NSNotificationCenter defaultCenter];
    //Enviamos el mensaje
    //Cuando alguien sea quien sea me envia esta notificacion me mandas el mensaje (instrumentDidChange:)
    [centerNot addObserver:self //Quien es el que se va a suscribir a esta notificacion --> yo mismo es decir el WebViewController
                  selector:@selector(instrumentDidChange:) //este es el nombre del mensaje que siempre que se pase como un parametro de otro es @se
                      name:NEW_INSTRUMENT_NOTIFICATION_NAME //nombre de la notificacion a la cual me quiero suscribir
                    object:nil];


}

-(void)instrumentDidChange:(NSNotification *) aNotification{
    
    //aqui recibimos la notificacion y debemos extraer del diccionario el parametro que es solo 1
    NSDictionary *dict = [aNotification userInfo];
    iCoInstrumentsModel *newInstrument = [dict objectForKey:INSTRUMENT_KEY]; // metemos la constante y tenemos el instrumento
    //Actualizamos el modelo
    self.model = newInstrument;
    [self displayURL:self.model.instrumentCompanyWeb];
}


//aqui le damos de baja a la notificacion para que se actualice la vista y es obligatorio

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    //Baja en notificacion
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utilities

-(void)displayURL:(NSURL *)aURLWebInstrumentCompanyWeb{
    
    //A la vista que hemos colocado en el controlador lo que queremos es que cargue una URL es nuestro primer servicio web
    //NSData nos representa datos binarios es muy parecido al NSString pero este es para datos binarios
    //MIMEType es la estructura formal de PDF el tipo de codifocacion
    //NSURLREquest tiene dos extras --> 1. politica de chache y 2. tiempo maximo de time out
    
    self.browser.delegate = self;
    self.myActivityIndicator.hidden = NO;
    [self.myActivityIndicator startAnimating];
    
    //[self.browser loadRequest:[NSURLRequest requestWithURL:aURLWebInstrumentCompanyWeb]];
    
    
    NSString *completeURLString = [NSString stringWithFormat:@"%@", aURLWebInstrumentCompanyWeb];
    NSURL *completeURL = [NSURL URLWithString: completeURLString];
    [self.browser loadRequest:[NSURLRequest requestWithURL:completeURL]];
    
    
}

#pragma mark - UIWebViewDelegate


/*- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.myActivityIndicator startAnimating];
    self.myActivityIndicator.hidden = NO;
    //[self.myActivityIndicator setHidden:NO];
    
    
}*/
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.myActivityIndicator stopAnimating];
    self.myActivityIndicator.hidden = YES;
    //[self.myActivityIndicator setHidden:YES]; --> esto es exactamente lo mismo que la linea anterior es el setter estoy asignando un atributo
  
}

@end
