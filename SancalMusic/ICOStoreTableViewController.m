//
//  ICOStoreTableViewController.m
//  SancalMusic
//
//  Created by User on 16/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "ICOStoreTableViewController.h"
#import "ICOINstrumentViewController.h"

@interface ICOStoreTableViewController ()



@end

@implementation ICOStoreTableViewController


//Con esto ya tenemos el inicializador y el modelo propio
-(id)initWithModel:(ICOStoreModel *)aModel
        tableStyle:(UITableViewStyle)aTableStyle{
    
    
    self = [super initWithStyle:aTableStyle]; //nos limitamos a colocar el parametro que esta definido en el metodo
    
    if (self) {
        self.model = aModel;
        self.title = @"SANCAL MUSIC";
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //Aqui podemos cambiar el color de los textos del navigation controller esto en la fase 3 de Navigation Controller
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.3
                                                                        green:0.3
                                                                         blue:0.3
                                                                        alpha:1.f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
//#warning Incomplete method implementation.
    // Lo ideal es usar constantes y debemos definirlas una constante para guitar, otra para drum, otra para piano
    //Esta es la definicion de la secciones
    
    if (section == GUITAR_SECTION ) {
        
        return [self.model guitarCount];
        
    }else if (section == DRUM_SECTION){
        
        return [self.model drumCount];
        
    }else{
        
        return [self.model pianoCount];
    }
    
}

//Debemos meter otro metodo que nos permitira colocar el nombre a las secciones y hace parte del data source y nos devuelve un NSString
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == GUITAR_SECTION) {
        return @"Guitars";
    }else if (section == DRUM_SECTION){
        return @"Drums";
    }else{
        return @"Pianos";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"]; // el index path registra la seccion y las filas esto es lo que getiona el indice de los objetos del array
    
    
    
    
    if (cell == nil) {
        //Tenemos que crearla a mano
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    //Averiguar de que modelo (Instrumento) nos estan hablando
    
    iCoInstrumentsModel *instrument = nil;
    
    if (indexPath.section == GUITAR_SECTION) {
        
        instrument = [self.model guitarAtIndex:indexPath.row];
        
    }else if (indexPath.section == DRUM_SECTION){
        
        instrument = [self.model drumAtIndex:indexPath.row];
    }else{
        instrument = [self.model pianoAtIndex:indexPath.row];
    }
    
    
    
    //Sincronizar la celda(vista) con el modelo(Instrumento)
    
    
    cell.imageView.image = instrument.photo;
    cell.textLabel.text = instrument.name;
    cell.detailTextLabel.text = instrument.instrumentsCompanyName;
    
    
    //La devolvemos
    return cell;
}


#pragma mark - delegate UITableView

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Suponemos que estamos en un navigation controller
    
    
    //averiguamos de que instrument se trata --> Fase 1
    
    
    iCoInstrumentsModel *instrument = nil;
    
    if (indexPath.section == GUITAR_SECTION) {
        
        instrument = [self.model guitarAtIndex:indexPath.row];
        
    }else if (indexPath.section == DRUM_SECTION){
        
        instrument = [self.model drumAtIndex:indexPath.row];
    }else{
        instrument = [self.model pianoAtIndex:indexPath.row];
    }
    
    /*---------------- Fase 1  push View Controller ------------------*/
    
    /*//Creamos un controlador para dicho instrument
    
    ICOINstrumentViewController *instrumentVC = [[ICOINstrumentViewController alloc]initWithModel:instrument];
    
    
    
    
    //Hacemos un push  al navigation Controller del cual estamos
    
    [self.navigationController pushViewController:instrumentVC
                                         animated:YES];*/
    
    /*---------------- Fase 1  push View Controller ------------------*/
    
    
    /*----------------  FAse 2 AQUI LE MANDAMOS UN MENSAJE A NUESTRO DELEGADO -------------- -------------- -------------- */
    
    //Aqui definimos yo mismo soy la tabla y le paso lo que he seleccionado es decir un instrumento
    //De aqui nos vamos a InstrumentViewController e implementamos el delegado
    
    [self.delegate storeTableViewController:self
                        didSelectInstrument:instrument];
    
    
    /*----------------  FAse 2 AQUI LE MANDAMOS UN MENSAJE A NUESTRO DELEGADO -------------- -------------- -------------- */
    
    
    
    /*-----CREAR LA NOTIFICACION Y ENVIARLA SON LOS DOS PASOS Y EL QUE ENTIENDE DICHA NOTIFICACION ES LA ICOWEBVIEWCONTROLLER --------------  */
    
    
    /*---------------- Fase 2 Notificacion ------------------*/
    
    //Notificacion
    NSNotification *notif = [NSNotification notificationWithName:NEW_INSTRUMENT_NOTIFICATION_NAME
                                                          object:self
                                                        userInfo:@{INSTRUMENT_KEY: instrument}];

    //Enviamos la notificacion por tanto necesitamos una referencia al notificacionCenter
    
    [[NSNotificationCenter defaultCenter] postNotification:notif];
    
    
    
    
    /*---------------- Fase 2 Notificacion ------------------*/
    
    
    /*---------------- Fase 3 Persistencia ------------------*/
    
    
    [self saveLastSelectedInstrumentAtSection:indexPath.section
                                          row:indexPath.row];
    
    /*---------------- Fase 3 Persistencia ------------------*/
    
    
    
    
    
    
}

//////// --> de aqui ya nos vamos al AppDelegate y limpiar el modelo



#pragma mark - Utils

-(iCoInstrumentsModel *) instrumentForIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguamos de que vino se trata
    
    iCoInstrumentsModel *instrument = nil;
    
    if (indexPath.section == GUITAR_SECTION) {
        
        instrument = [self.model guitarAtIndex:indexPath.row];
        
    }else if (indexPath.section == DRUM_SECTION){
        
        instrument = [self.model drumAtIndex:indexPath.row];
    }else{
        instrument = [self.model pianoAtIndex:indexPath.row];
    }
    
    return instrument;
    
}

//persistencia de datos --> Usuario predeterminado

#pragma mark - NSUserDefault

-(NSDictionary *)setDefaults{ //--> Configurar valores predeterminados
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; //--> Configuracion del usuario estandar --> usa al usuario actual
    
    //Por defecto mostraremos el primero de los instrumentos
    NSDictionary *defaultInstrumentCoords = @{SECTION_KEY: @(GUITAR_SECTION), ROW_KEY:@(0)};
    
    //lo Asignamos
    [defaults setObject:defaultInstrumentCoords
                 forKey:LAST_INSTRUMENT_KEY];
    
    //guardamos por si las moscas
    [defaults synchronize];
    
    return defaultInstrumentCoords;
    
    
    
}

//metodo que usamos cuando se ha seleccionado una fila de la lista de objetos de la tabla
-(void)saveLastSelectedInstrumentAtSection:(NSUInteger)section //Se utiliza para describir un int sin signo
                                       row:(NSUInteger)row{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@{SECTION_KEY:@(section),
                          ROW_KEY:@(row)}
                 forKey:LAST_INSTRUMENT_KEY];
    
    
}


-(iCoInstrumentsModel *)lastSelectedInstrument{
    
    NSIndexPath *indexPath = nil;
    
    NSDictionary *coordinates = nil; //este es el diccionario que vamos a usar para guardar las coordenadas del vino
    
    coordinates = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_INSTRUMENT_KEY];
    
    if (coordinates == nil) {
        
        //No hay nada bajo la clave LAST_INSTRUMENT_KEY
        //Esto quiere decir que es la primera vez que se llama a la App
        //Ponemos un valor por defecto: el primero de los instrumentos
        
        coordinates = [self setDefaults]; //--> Configurar valores predeterminados
        
    }else{
        
        //Ya hay algo, es decir en algun momento se guardo
        
        
    }
    
    //Transformamos esas coordenadas en un indexPath
    indexPath = [NSIndexPath indexPathForRow:[[coordinates objectForKey:ROW_KEY]integerValue] //--> integerValue desempaqueta a "int o NSInteger"
                                   inSection:[[coordinates objectForKey:SECTION_KEY]integerValue]];
    
    
    //devolvemos el Instrumento en cuestion
    return [self instrumentForIndexPath:indexPath];
    
    
    
}
















@end
