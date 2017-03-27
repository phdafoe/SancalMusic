//
//  ICOStoreTableViewController.h
//  SancalMusic
//
//  Created by User on 16/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICOStoreModel.h" //Importamos la clase modelo que gestiona nuestro catalogo

#define GUITAR_SECTION 0 //Definicion de secciones
#define DRUM_SECTION 1
#define PIANO_SECTION 2

#define NEW_INSTRUMENT_NOTIFICATION_NAME @"newInstrument"
#define INSTRUMENT_KEY @"instrument"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_INSTRUMENT_KEY @"lastInstrument"

//aqui debemos llamar la clase primero esto es mas propio de C se llama forwardDeclaration
@class ICOStoreTableViewController;


//es necesario crear un protocolo de delegado propio para poder comunicar la tabla del splitViewController y el controlador de la InstrumentViewController por tanto en el momento de picar cualquier elemento de la tabla deberia actualizar la informacion y pintarnos dicha informacion de manera correcta hay dos manereas de crear protocolos de delegado propios puede ser una opcion la de la una clase aparte o otra dentro del mismo fichero .h que es la que vamos a usar y es la mas utilizada

//se escribe el nombre de la clae sin el prefijo es la manera de cocoa para determinar los protocolos propios


/*--------------------------- DELEGADO PROPIO ---------------------------------------------*/

@protocol StoreTableViewControllerDelegate <NSObject> //aqui se entiende que esta implementando el protocolo NSObject

//Aqui creamos los metodos propios
//aqui definimos que haga algo nuestro delegado cunado se toque una celda lo que debe ocurris es que nos debe cambiar el instrumento seleccionado

//tiene que saber que quien reciba este mensaje debe saber quien es el remitente
//cuando no nos entienda el objeto es por que no ha visto la clase creada por tanto hay que crear un @class

-(void)storeTableViewController:(ICOStoreTableViewController *)storeVC
            didSelectInstrument:(iCoInstrumentsModel *)aInstrument;

//Aqui no termina es necesario añadir una propiedad delegate

@end


/*--------------------------- DELEGADO PROPIO ---------------------------------------------*/



@interface ICOStoreTableViewController : UITableViewController


//Declaramos una propiedad del tipo StoreModel
@property (nonatomic, strong) ICOStoreModel *model;


//Aqui definimos de que tipo de delegado es decir la clase que controla ese delegado normalmente se deja abierto y no se limita debe dejarse a cualquier objeto siempre y cuando entienda el protocolo de delegado de StoreTableViewController
@property (nonatomic, weak) id <StoreTableViewControllerDelegate> delegate;

//Tenemos que pensar en cual va ser el estilo dela tabla
-(id)initWithModel:(ICOStoreModel *)aModel // Aqui colocamos el Asterisco y es claro es un objeto de estipo que es mi atributo
        tableStyle:(UITableViewStyle) aTableStyle; //esto no es un objeto esto lo definimos como una constante




/*--------------------------- PERSISTENCIA ULTIMO INSTRUMENTO VISTO ---------------------------------------------*/

//Nos devuelve instrument model y le enviamos el mensaje de cual es el instrumento en el indice y nos tiene que dar el "int" es decir averiguamos de que instrumento se trata

-(iCoInstrumentsModel *)instrumentForIndexPath:(NSIndexPath *)indexPath;


//salvamos el ultimo Instrumento seleccionado
-(void)saveLastSelectedInstrumentAtSection:(NSUInteger)section
                                       row:(NSUInteger)row;

//Metodo para la persistencia de datos
-(iCoInstrumentsModel *)lastSelectedInstrument;


@end
