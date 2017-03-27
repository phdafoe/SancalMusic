//
//  ICOMarkAnnotation.m
//  SancalMusic
//
//  Created by User on 17/1/15.
//  Copyright (c) 2015 iCologic. All rights reserved.
//

#import "ICOMarkAnnotation.h"


@implementation ICOMarkAnnotation

-(id)init{
    
    self = [super init];
    
    if (self) {
        self.coordinate = _coordinate;
        self.title = _title;
        self.subtitle = _subtitle;
    }
    return self;
}







@end
