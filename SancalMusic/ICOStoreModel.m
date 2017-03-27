//
//  ICOStoreModel.m
//  SancalMusic
//
//  Created by User on 16/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "ICOStoreModel.h"

@implementation ICOStoreModel


////////// Cuando terminemos esta clase debemos crear la UItableView Controller sin XIB pues vamos a hacerlo a traves de codigo

#pragma mark - Properties
//En el momento que el compilador lea esto va aser bien has creado tu propidad guitarCount y has creado tu propio getter por tanto utilizo el tuyo y ya esta

//Aqui nos devuelve la cantidad de objetyos hay dentro del Array

-(NSInteger) guitarCount{
    
    
    
    return [self.guitars count];
    
}

-(NSInteger) drumCount{
    
    return [self.drums count];
}


-(NSInteger) pianoCount{
    
    return [self.pianos count];
}

//vamos a sobreescribir el metodo init que heredamos de NSObject entonces nos vamos al AppDelegate y copiamos los 3 instrumentos


//el gran cambio esta aqui en vez de crear los instrumentos con el metodo de clase instrume... llamamos a el JSON es decir una peticion WEB

-(id)init{
    
    
    self = [super init];
    
    if (self) {
        
        //invocamos a la clase solicitud de URL para descargar los datos donde tenemos el JSON
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.andresocampo.com/pruebas/CICE/instruments.json"]];
        //Creamos un objeto que invoca a la clase Respuesta
        NSURLResponse *response = [[NSURLResponse alloc]init];
        
        //gestionamos un posible error
        NSError *error;
        
        //Para bajarnos los datos le enviamos el mensaje Sunchronous --> se hace de manera Sincrona es decir que no se va hacer en segundo plano --> esto nos peta la app, sobre todo por que no es la manera mas correcta lo mas logico es usar GCD que es la forma de trabajar la concurrencia
        //Acepta un NSError sobre todo es por que pieden meter la pata y nos va a indicar en donde se mete la pata
        //data es la forma en como nos entren los datos y debemos convertirlos en un objeto NSJSONSeriralization
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        
        
        if (data != nil) {
            
            // si data es distinto de nil me crea el objeto y por tanto el objeto que recibo es fundamental transformalo en bien en un Array de Diccionarios o un Diccionario
            
            //no ha habido error
            
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:&error];
            
            if (JSONObjects != nil) {
                //No ha habido error
                //Vamos a mirar que para cada diccionario en el objeto JSONObjects --> a partir de ese diccionario creo
                // un objeto de la clase InstrumentModel utilizando aquel initWithDictionary como inicializador de conveniencia de JSON en la clase ICOInstrumentoModel
                
                for (NSDictionary *dict in JSONObjects) {
//                    
                    iCoInstrumentsModel *instrument = [[iCoInstrumentsModel alloc]initWithDictionary:dict];
                    
                    //añadimos el instrumento adecuado en un array distinto
                    // es decir que definiendo los instumentos, tenemso que esta es una guitarra, pues al array de guitarras y asi con los
                    // demas instrumentos
                    
                    if ([instrument.typeInstrument isEqualToString:GUITAR_INSTRUMENT_KEY]) {
                        if (!self.guitars) {
                            self.guitars = [NSMutableArray arrayWithObject:instrument];
                        }else{
                            [self.guitars addObject:instrument];
                        }
                    }else if ([instrument.typeInstrument isEqualToString:DRUM_INSTRUMENT_KEY]){
                        
                        if (!self.drums) {
                            self.drums = [NSMutableArray arrayWithObject:instrument];
                        }else{
                            [self.drums addObject:instrument];
                        }
                        
                    }else{
                        if (!self.pianos) {
                            self.pianos = [NSMutableArray arrayWithObject:instrument];
                        }else{
                            [self.pianos addObject:instrument];
                        }
                    }
                }
            }else{
                    
                    //se ha producido un problema al Parsear JSON
                    NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
                }
            
        }else{
            NSLog(@"Error al descargar los datos del servidor: %@", error.localizedDescription);
        }
    
    }
 return self;

}


//------------------------------- Fase sin JSON ---------------------------------/////
/*-(id)init{
    
    self = [super init];
    
    if (self) {
        
        //Creamos el modelo
        
        //Fase 1 nos traemos los instrumentos del AppDelegate
        
        iCoInstrumentsModel *electricGuitar = [iCoInstrumentsModel instrumentsModelWithName:@"JOHNNY MARR JAGUAR"
                                                                     instrumentsCompanyName:@"FENDER"
                                                                             typeInstrument:@"ELECTRIC GUITAR"
                                                                             markInstrument:@"JAGUAR"
                                                                      combinationInstrument:@[@" ELECTRIC"]
                                                                       instrumentCompanyWeb:[NSURL URLWithString:@"http://www.fender.com/es-ES/guitars/jaguar/johnny-marr-jaguar-rosewood-fingerboard-olympic-white/"]
                                                                                      notes:@"Fender is very proud to introduce the Johnny Marr signature Jaguar® guitar. Marr is best known, of course, as the strikingly dynamic and influential anti-hero guitarist-arranger-all-around-musical-wunderkind behind Manchester quartet the Smiths, which virtually redefined and ruled U.K. pop throughout the 1980s. A master of melody, layering and texture, Marr has always brought his own instantly identifiable ringing, jangling genius to the proceedings, as he has done in post-Smiths stints with The The, Electronic, the Pretenders and Johnny Marr and the Healers, and right up to the present with Modest Mouse, the Cribs and innumerable guest appearances."
                                                                           ratingInstrument:4
                                                                                      photo:[UIImage imageNamed:@"guitar.png"]];
        
        ----------------------------------------------------------------------------------------------------------------------------------*/
        
        /*iCoInstrumentsModel *drumsVintage = [iCoInstrumentsModel instrumentsModelWithName:@"CATALINA CLUB"
                                                                   instrumentsCompanyName:@"GRETSCH"
                                                                           typeInstrument:@"DRUM"
                                                                           markInstrument:@"CATALINA CLUB VINTAGE CLASSIC"
                                                                    combinationInstrument:@[@" VINTAGE CLASSIC"]
                                                                     instrumentCompanyWeb:[NSURL URLWithString:@"http://www.gretschdrums.com/?fa=drums&sid=702#specs"]
                                                                                    notes:@"We have teamed up with Sabian cymbals and Vic Firth sticks to create the new Gretsch Energy Series. Modelled around a 7 ply poplar shell and fitted with Gretsch by Remo®drumheads, the kits come complete with Gretsch hardware pack and Sabian SBR cymbals. Gretsch Energy is packed with features and perfect for the first time drum set buyer."
                                                                         ratingInstrument:3
                                                                                    photo:[UIImage imageNamed:@"drum.png"]];
        
        ----------------------------------------------------------------------------------------------------------------------------------*/
        
        /*iCoInstrumentsModel *pianoClassic = [iCoInstrumentsModel instrumentsModelWithName:@"V-PIANO CLASSIC"
                                                                   instrumentsCompanyName:@"V-PIANO"
                                                                           typeInstrument:@"PIANO CLASSIC"
                                                                           markInstrument:@"ROLAND PREMIERES"
                                                                    combinationInstrument:@[@" CLASSIC SOUND, 50% ELECTRONIC SOUND"]
                                                                     instrumentCompanyWeb:[NSURL URLWithString:@"http://www.rolandus.com/products/details/1158/articles/"]
                                                                                    notes:@"With its groundbreaking approach to grand-piano modeling, and incredibly realistic sound, touch, and response, Roland’s V-Piano® has earned many international awards and accolades since its debut in 2009. It has become the #1 choice for many of the most discerning pianists on the planet. So how does the V-Piano evolve? Introducing the V-Piano Grand! Built into an elegant grand-piano cabinet, and with a unique, multi-channel sound system that reacts naturally and intelligently to your performance, this drumsVintageexquisite instrument blurs the line between digital and acoustic worlds. Stepping up from the previous generation, the V-Piano Grand’s sound generator has been further refined, and new piano models have been added to the onboard library. Welcome to a new world of performance, sophistication, and musical innovation."
                                                                         ratingInstrument:4
                                                                                    photo:[UIImage imageNamed:@"v-piano.png"]];
        
        
        //Le decimos al Array que estos son los instrumentos dentro del modelo e identifamos cada uno de los objetos
        
        self.guitars = @[electricGuitar];
        self.drums = @[drumsVintage];
        self.pianos = @[pianoClassic];
        
        
        
        
        
      
    }
    
    return self;
    
    
}*/


//fase 2 nos traemos los 3 metodos que nos daran el indice dentro de los distintos arrays

-(iCoInstrumentsModel *) guitarAtIndex:(NSInteger) indexGuitar{
    
    //devolver el objeto que esta en Indice del array correspondiente
    
    return  [self.guitars objectAtIndex:indexGuitar];
    
}


-(iCoInstrumentsModel *) drumAtIndex:(NSInteger) indexDrum{
    
    return [self.drums objectAtIndex:indexDrum];
    
    
}


-(iCoInstrumentsModel *) pianoAtIndex:(NSInteger) indexPiano{
    
    return [self.pianos objectAtIndex:indexPiano];
    
}








@end
