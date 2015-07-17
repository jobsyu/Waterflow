//
//  ViewController.m
//  UICollectionView
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "LineLayout.h"
#import "StackLayout.h"
#import "CircleLayout.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *const ID =@"image";

-(NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i=0; i<20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 200);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.dataSource =self;
    collectionView.delegate =self;
    [collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView =collectionView;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[CircleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[StackLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[CircleLayout alloc] init]  animated:YES];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //删除模型数据
    [self.images removeObjectAtIndex:indexPath.row];
    
    //删除UI(刷新UI)
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}
@end
