//
//  ICOMapLocalizationViewController.h
//  SancalMusic
//
//  Created by User on 17/1/15.
//  Copyright (c) 2015 iCologic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


//debemos llamar al delegado
@interface ICOMapLocalizationViewController : UIViewController <MKMapViewDelegate>

//Declaro mi propiedad
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//Declaro las acciones
- (IBAction)setMap:(id)sender;



@end
