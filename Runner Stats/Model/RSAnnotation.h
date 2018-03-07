//
//  RSAnnotation.h
//  Runner Stats
//
// Created by Hu on 12/20/16.
//  Copyright (c) 2016 hk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RSAnnotation : NSObject <MKAnnotation>

@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;

- (id)initWithTitle:(NSString *)title andLocation:(CLLocationCoordinate2D)location;
- (MKAnnotationView *)annotationView;

@end
