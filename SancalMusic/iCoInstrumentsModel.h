//
//  iCoInstrumentsModel.h
//  SancalMusic
//
//  Created by User on 7/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define NO_RATING -1

@interface iCoInstrumentsModel : NSObject

//definicion de las propiedades del modelo de datos que se nos pintarán en las diferentes vistas
//revelando el misterio nonatomis, es una atributo de caracteristicas compitaciones que busca que los setter y los getter que se han creado
//con la palabra reservada @property sea seguro en un entorno de multitarea viene de OSX

//esta son todas las propiedades que necesitamos para representar un instrumento --> con esto ya el compilador nos crearia las variables de instancia y los setter y los getter

//Fase sin JSON
/*
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *instrumentsCompanyName;
@property (nonatomic, strong) NSString *typeInstrument;
@property (nonatomic, strong) NSString *markInstrument;
@property (nonatomic, strong) NSArray *combinationInstrument;
@property (nonatomic, strong) NSURL *instrumentCompanyWeb;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic) int ratingInstrument; // 0 - 5
@property (nonatomic, strong) UIImage *photo;*/


//Fase de implementacion de JSON modificaciones

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *instrumentsCompanyName;
@property (nonatomic, copy) NSString *typeInstrument;
@property (nonatomic, copy) NSString *markInstrument; //--> origin
@property (nonatomic, strong) NSArray *combinationInstrument; //--> grapes
@property (nonatomic, strong) NSURL *instrumentCompanyWeb;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic) int ratingInstrument; // 0 - 5
@property (nonatomic, strong, readonly) UIImage *photo;
@property (nonatomic, strong) NSURL *photoURL; //Almacenamos la url de la imagen asi se nos presenta esta imagen esta en un servidor




//Constructor designado

+(id)instrumentsModelWithName:(NSString *)aName
       instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
               typeInstrument:(NSString *)aTypeInstrument
               markInstrument:(NSString *)aMarkInstrument
        combinationInstrument:(NSArray *)arrayOfCombinationInstrument
         instrumentCompanyWeb:(NSURL *)aURLInstrumentCompanyWeb
                        notes:(NSString *)aNotes
             ratingInstrument:(int)aRatingInstrument
                     photoUrl:(NSURL *)aPhotoURL;


//Constructor de conveniencia

+(id)instrumentsModelWithName:(NSString *)aName
       instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
               typeInstrument:(NSString *)aTypeInstrument
               markInstrument:(NSString *)aMarkInstrument;



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
                          photoUrl:(NSURL *)aPhotoURL;

//Inicializador de conveniencia no necesariamente debe tener toda las variables o atrobitos

-(id)initWithName:(NSString *)aName
instrumentsCompanyName:(NSString *)aInstrumentsCompanyName
   typeInstrument:(NSString *)aTypeInstrument
   markInstrument:(NSString *)aMarkInstrument;


//Inicializador a partir de diccionario de JSON --> obtenemos el diccionario y de ahi tenemos el objeto en COCOA
-(id)initWithDictionary:(NSDictionary *)aDictionaryJSON;



@end
