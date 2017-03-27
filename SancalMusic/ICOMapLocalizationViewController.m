//
//  ICOMapLocalizationViewController.m
//  SancalMusic
//
//  Created by User on 17/1/15.
//  Copyright (c) 2015 iCologic. All rights reserved.
//

#import "ICOMapLocalizationViewController.h"

//importamos la clase de la anotacion de la marca
#import "ICOMarkAnnotation.h"

@interface ICOMapLocalizationViewController ()

@end

@implementation ICOMapLocalizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //le pedimos que nos muestre la ubicacion del usuario
    self.mapView.showsUserLocation = YES;
    
    //por defecto le asignamos la version standard del tipo de mapa
    [self.mapView setMapType:MKMapTypeStandard];
    
    //le asignamos un valor Booleano para nos active el zoom
    [self.mapView setZoomEnabled:YES];
    
    //le asignamos un valor Booleanos a la propiedad ScrollEnable asi podremos manipular la pantalla
    [self.mapView setScrollEnabled:YES];
    
    //declaramos una constante que se llama region
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    
    region.center.latitude = 40.423961;
    region.center.longitude = -3.670390;
    region.span.longitudeDelta = 0.005f;
    region.span.latitudeDelta = 0.005f;
    
    [self.mapView setRegion:region animated:YES];
    
    //Creamos el objeto de la clase que importamos de la anotacion
    ICOMarkAnnotation *annotationCiceMusic = [[ICOMarkAnnotation alloc]init];
    
    annotationCiceMusic.title = @"CICE MUSIC";
    annotationCiceMusic.subtitle = @"Estamos aquí";
    annotationCiceMusic.coordinate = region.center;
    
    [self.mapView addAnnotation:annotationCiceMusic];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)setMap:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex){
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
    
}
@end
