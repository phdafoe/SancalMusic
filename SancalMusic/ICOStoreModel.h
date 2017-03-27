//
//  ICOStoreModel.h
//  SancalMusic
//
//  Created by User on 16/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iCoInstrumentsModel.h"


#define GUITAR_INSTRUMENT_KEY @"Guitar"
#define DRUM_INSTRUMENT_KEY @"Drum"
#define PIANO_INSTRUMENT_KEY @"Piano"


@interface ICOStoreModel : NSObject

//Vamos a tener tres tipos de instrumentos --> guitarras / baterias / pianos una forma de representar cada uno de esos instrumentos seria que estuviera dentro de un array

@property (nonatomic, strong) NSMutableArray *guitars;
@property (nonatomic, strong) NSMutableArray *drums;
@property (nonatomic, strong) NSMutableArray *pianos;

//es necesario tener en cuenta que el Data Source nos puede realizar preguntas como cual es la guitarra numero 3 o cual es la bateria nuymero 1 o cuatos pianos hay --> esto por que lo escribo asi pues para seguir un poco la sintaxis de cocoa si quiero barrer un array se lo digo pasandole la palabra reservada count

//aqui tendriamos la cantidad de cada uno de los isntrumentos
//siempre dejamos que el compilador nos ejecute los setter y los getter pero yo los puedo personalizar y se hace asi
//Y le doy que esta variable es de solo lectura cunado el compilador se encuentre con esto unicamente va a crear el setter y los getter los creamos manualmente, y como hace el getter, el compilador va a crear una variable de instancia para cada uno de estos objetos por tanto dara self.guitarCount y este va a valer 0 dentro del modelo de bodega y como no hay forma de cambiarlo el valor siempre sera 0 y por tanto vamos a aportar el getter personalizado

@property (readonly, nonatomic) NSInteger guitarCount;
@property (readonly, nonatomic) NSInteger drumCount;
@property (readonly, nonatomic) NSInteger pianoCount;

//necesitamos saber cual es el la guitarra numero 3 o la bateria numero 1 por tanto vamos a crear una serie de metodos que cada uno de ellos va a devolver una instancia de ICOInstrumentModel por tanto debemos importarlo el nombre es basicamente para seguir la sintaxis de cocoa es decir en este caso cunado vamos a solicitar el indice de un objeto en un array le ponemos objetAtIndex:indexPath

-(iCoInstrumentsModel *) guitarAtIndex:(NSInteger) indexGuitar;
-(iCoInstrumentsModel *) drumAtIndex:(NSInteger) indexDrum;
-(iCoInstrumentsModel *) pianoAtIndex:(NSInteger) indexPiano;


@end
