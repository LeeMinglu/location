//
//  ViewController.m
//  locationExcise
//
//  Created by 李明禄 on 15/11/29.
//  Copyright © 2015年 SocererGroup. All rights reserved.
/**
 
 1.设置定位管理器; 
 2.获取用户授权; 
 3.开始定位; 
 4.设置代理
 
 
 
 */
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController

- (CLLocationManager *)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.manager requestAlwaysAuthorization];
    
    [self.manager startUpdatingLocation];
    
    self.manager.delegate = self;
    
    NSLog(@"设置精确度");
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:40 longitude:116];
    
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:41 longitude:116];
    
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
    
    NSLog(@"lalala...%f", distance);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 实现代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.firstObject;
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    NSLog(@"%f......%f", coordinate.latitude, coordinate.longitude);
    
    
    
}

@end
