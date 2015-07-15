//
//  Shop.h
//  Waterflow
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Shop : NSObject
@property (nonatomic,assign) CGFloat w;
@property (nonatomic,assign) CGFloat h;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *price;

-(id)initWithDict:(NSDictionary *)dict;
@end
