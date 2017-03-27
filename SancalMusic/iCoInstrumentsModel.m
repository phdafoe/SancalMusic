//
//  iCoInstrumentsModel.m
//  SancalMusic
//
//  Created by User on 7/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "iCoInstrumentsModel.h"

@implementation iCoInstrumentsModel

//Cuando creas una propiedad de solo lectura e implementas un getter personalizado,
//como estamos haciendo en photo, el compilador da por hecho que no vas a necesitar un
//variable de instancia, en este caso no es asi, y si que necesito la variable, asi
//que hay que obligarle a que lo incluya esto se hace con la palabra reservada @synthesize,
//con la que le indicamos que queremos una propiedad llamada photo con una variable de
//instancia llamada _photo,
//en la inmensa mayoria de los casos esto es opcional

@synthesize photo = _photo;

#pragma mark - Property

-(UIImage *)photo{
    
    //Esto va a bloquear y se deberia de hacer en un segundo plano GCD
    //esto lo llamamos carga perezosa --> solo cargo la imagen si hace falta
    //tendriamos que saber de bloques y de GCD es ñla framework de concurrencia para Obj-C
    //es una buena idea con respecto a la memoria limitada
    if (_photo == nil) {
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    
    return _photo;
    
}





#pragma mark - Constructor

//Constructor designado

+(id)instrumentsModelWithName:(NSString *)aName
       instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
               typeInstrument:(NSString *)aTypeInstrument
               markInstrument:(NSString *)aMarkInstrument
        combinationInstrument:(NSArray *)arrayOfCombinationInstrument
         instrumentCompanyWeb:(NSURL *)aURLInstrumentCompanyWeb
                        notes:(NSString *)aNotes
             ratingInstrument:(int)aRatingInstrument
                     photoUrl:(NSURL *)aPhotoURL{
    
    return [[self alloc]initWithName:aName
              instrumentsCompanyName:aInstrumentsCompanyName
                      typeInstrument:aTypeInstrument
                      markInstrument:aMarkInstrument
               combinationInstrument:arrayOfCombinationInstrument
                instrumentCompanyWeb:aURLInstrumentCompanyWeb
                               notes:aNotes
                    ratingInstrument:aRatingInstrument
                            photoUrl:aPhotoURL];
    
}


//Constructor de conveniencia

+(id)instrumentsModelWithName:(NSString *)aName
       instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
               typeInstrument:(NSString *)aTypeInstrument
               markInstrument:(NSString *)aMarkInstrument{
    
    return [[self alloc]initWithName:aName
              instrumentsCompanyName:aInstrumentsCompanyName
                      typeInstrument:aTypeInstrument
                      markInstrument:aMarkInstrument];
    
    
}


#pragma mark - JSON

//Inicializador a partir de diccionario de JSON --> obtenemos el diccionario y de ahi tenemos el objeto en COCOA
-(id)initWithDictionary:(NSDictionary *)aDictionaryJSON{
    
    //sacamos los datos y los vamos metiendo al inicializador designado
    //en combination instrument por la forma en la que viene el JSON pues tenemos que transformarlo en un array asi que uso un metodo de utilidades
    // y por ultimo photoURL debemos sacar del diccionario la clave con el nombre "picture"
    //Aqui obtenemos del diccionario y se los pasamos a nuestros parametros dentro del inicializador
    
   return [self initWithName:[aDictionaryJSON objectForKey:@"name"]
      instrumentsCompanyName:[aDictionaryJSON objectForKey:@"instrumentsCompanyName"]
              typeInstrument:[aDictionaryJSON objectForKey:@"typeInstrument"]
              markInstrument:[aDictionaryJSON objectForKey:@"markInstrument"] //--> origin
       combinationInstrument:[self extractCombinationInstrumentFromJSONArray:[aDictionaryJSON objectForKey:@"combinationInstrument"]] //grapes
        instrumentCompanyWeb:[aDictionaryJSON objectForKey:@"instrumentCompanyWeb"]
                       notes:[aDictionaryJSON objectForKey:@"notes"]
            ratingInstrument:[[aDictionaryJSON objectForKey:@"ratingInstrument"]intValue]
                    photoUrl:[NSURL URLWithString:[aDictionaryJSON objectForKey:@"picture"]]];
   
}

//es precisamente el que vamos a utilizar para el camino inverso
// una ves tenemos el ICOInstrumentModel pues podriamos generar el proxy para JSON que es un diccionario
//y a partir de ese Diccionario con NSJSONSerialization podemos obtener el NSData con el JSON
//no lo vamos a utilizar pero lo vamos a escribir como ejercicio



#pragma mark - init
//Creacion de inicializadores

//Inicializador designado que nos acepta tantos parametros como propiedades tenga nuestra clase

-(id)initWithName:(NSString *)aName
instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
   typeInstrument:(NSString *)aTypeInstrument
   markInstrument:(NSString *)aMarkInstrument
combinationInstrument:(NSArray *)arrayOfCombinationInstrument
instrumentCompanyWeb:(NSURL *)aURLInstrumentCompanyWeb
            notes:(NSString *)aNotes
 ratingInstrument:(int)aRatingInstrument
         photoUrl:(NSURL *)aPhotoURL{
    
    
    self = [super init];
    
    if (self) {
        
        //Asignamos los parametros a las variables de instancia
        self.name = aName;
        self.instrumentsCompanyName = aInstrumentsCompanyName;
        self.typeInstrument = aTypeInstrument;
        self.markInstrument = aMarkInstrument;
        self.combinationInstrument = arrayOfCombinationInstrument;
        self.instrumentCompanyWeb = aURLInstrumentCompanyWeb;
        self.notes = aNotes;
        self.ratingInstrument = aRatingInstrument;
        self.photoURL = aPhotoURL;
    }
    
    return self;
    
    
    
}


//Inicializador de conveniencia no necesariamente debe tener toda las variables o atrobitos

-(id)initWithName:(NSString *)aName
instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
   typeInstrument:(NSString *)aTypeInstrument
   markInstrument:(NSString *)aMarkInstrument{
    
    return [self initWithName:aName
       instrumentsCompanyName:aInstrumentsCompanyName
               typeInstrument:aTypeInstrument
               markInstrument:aMarkInstrument
        combinationInstrument:nil
         instrumentCompanyWeb:nil
                        notes:nil
             ratingInstrument:NO_RATING
                     photoUrl:nil];
    
    
}

#pragma mark - Utils


-(NSArray *)extractCombinationInstrumentFromJSONArray:(NSArray *) JSONArray{
    
    NSMutableArray *combinationInstrument = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary *dictionaryJSON in JSONArray) {
        [combinationInstrument addObject:[dictionaryJSON objectForKey:@"instrument"]];
    }
    return combinationInstrument;
   
}








@end
