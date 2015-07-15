//
//  ViewController.m
//  Waterflow
//
//  Created by jobs on 15/7/15.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "ShopCell.h"
#import "Shop.h"
#import "WaterflowLayout.h"
#import "MJRefresh.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterflowLayoutDelegate>
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *shops;
@end

@implementation ViewController

static NSString *const ID =@"shop";

-(NSMutableArray *)shops
{
    if (_shops == nil) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *shopArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil]];
    for (NSDictionary *dict in shopArray) {
        Shop *shop = [[Shop alloc] initWithDict:dict];
        [self.shops addObject:shop];
    }
    //[self.shops addObjectsFromArray:shopArray];
    
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(320, 320);
    WaterflowLayout *layout = [[WaterflowLayout alloc] init];
    layout.delegate =self;
    
    
    //创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource =self;
    collectionView.delegate =self;
    [collectionView registerNib:[UINib nibWithNibName:@"ShopCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreShops)];
}

-(void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          NSArray *shopArray = [Shop objectArrayWithFilename:@"1.plist"];
          [self.shops addObjectsFromArray:shopArray];
          [self.collectionView reloadData];
          [self.collectionView footerEndRefreshing];
    });
}


-(CGFloat)waterflowLayout:(WaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    Shop *shop =self.shops[indexPath.item];
    return shop.h / shop.w * width;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
}

@end
