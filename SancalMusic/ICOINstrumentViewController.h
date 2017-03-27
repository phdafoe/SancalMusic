//
//  ICOINstrumentViewController.h
//  SancalMusic
//
//  Created by User on 7/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import <UIKit/UIKit.h>

//Importamos el framework de MAIL MESSAGE
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

//definimos la constante que permitira al xcode entender que dispositivo esta usando
#define IS_IPHONE  UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone


#import "iCoInstrumentsModel.h" //Importamos nuestro modelo de datos por tanto podemos obtener dichos accesos
#import "ICOStoreTableViewController.h"



//es necesario definir el ICOinstrumentViewController como delegado del SplitViewController por tanto debemos invocar su protocolo en el momento que importamos un protocolo de delegado quiere decir que dicho objeto esta capacitado para ser delegado
@interface ICOINstrumentViewController : UIViewController <MFMailComposeViewControllerDelegate, UISplitViewControllerDelegate, StoreTableViewControllerDelegate>

//Declaramos propiedades generales
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *instrumentsCompanyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeInstrumentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *markInstrumentLabel;
@property (weak, nonatomic) IBOutlet UILabel *combinationInstrumentLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

//Este es un IBOulet Collection que nos permitira agrupar objetos
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;



//Propiedades de modelo
@property (nonatomic, strong) iCoInstrumentsModel *model;
//Inicializadro designado del modelo
-(id)initWithModel:(iCoInstrumentsModel *)aModel;



//Accion acepta como parametro un id es decir cualquiera son acciones generales

-(IBAction)displayWebSite:(id)sender;

- (IBAction)sendMail:(id)sender;

- (IBAction)userLocation:(id)sender;



@end
