//
//  ImageCell.m
//  UICollectionView
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell()
@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ImageCell

-(void)awakeFromNib{
    self.imageView.layer.borderWidth = 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 3;
    self.imageView.layer.cornerRadius =YES;
}

-(void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.imageView.image = [UIImage imageNamed:image];
}
@end
