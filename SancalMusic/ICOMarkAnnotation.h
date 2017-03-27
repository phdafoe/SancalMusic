//
//  ICOMarkAnnotation.h
//  SancalMusic
//
//  Created by User on 17/1/15.
//  Copyright (c) 2015 iCologic. All rights reserved.
//

#import <Foundation/Foundation.h>


//importamos parte de este framework
#import <MapKit/MKAnnotation.h>

@interface ICOMarkAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
