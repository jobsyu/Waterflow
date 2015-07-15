//
//  WaterflowLayout.h
//  Waterflow
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterflowLayout;

@protocol WaterflowLayoutDelegate <NSObject>

-(CGFloat)waterflowLayout:(WaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterflowLayout : UICollectionViewLayout
@property (nonatomic,assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic,assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic,assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic,assign) int columnsCount;

@property (nonatomic,weak) id<WaterflowLayoutDelegate> delegate;
@end
