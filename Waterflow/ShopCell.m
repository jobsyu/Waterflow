//
//  ShopCell.m
//  Waterflow
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ShopCell.h"
#import "UIImageView+WebCache.h"
#import "Shop.h"

@interface ShopCell()
@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) IBOutlet UILabel *priceLabel;
@end

@implementation ShopCell

-(void)setShop:(Shop *)shop
{
    _shop = shop;
    
    //1.图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    self.priceLabel.text = shop.price;
}

@end
