//
//  ICOWebViewController.h
//  SancalMusic
//
//  Created by User on 14/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import <UIKit/UIKit.h>

//Importamos el Modelo

#import "iCoInstrumentsModel.h"

//definimos la constante que permitira al xcode entender que dispositivo esta usando
#define IS_IPHONE  UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone

@interface ICOWebViewController : UIViewController  <UIWebViewDelegate>

//tenemos que trabajar con el modelo y con la declaracion de un IBOulet de la WebView ya que necesitamos que cargue un dato


@property (nonatomic, weak)  IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicator;

@property (nonatomic, strong) iCoInstrumentsModel *model;
-(id)initWithModel:(iCoInstrumentsModel *)aModel;


@end
