//
//  ViewController.m
//  sample-UICollectionView
//
//  Created by Naoki Hada on 6/5/16.
//  Copyright © 2016 Naoki Hada. All rights reserved.
//

#import "ViewController.h"
#import "CVCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create dummy data
    NSMutableArray *dataSet1 = [[NSMutableArray alloc] init];
    NSMutableArray *dataSet2 = [[NSMutableArray alloc] init];
    NSMutableArray *dataSet3 = [[NSMutableArray alloc] init];
    
    for (int i=0; i<50; i++) {
        [dataSet1 addObject:[NSString stringWithFormat:@"A%02d", i]];
        [dataSet2 addObject:[NSString stringWithFormat:@"B%02d", i]];
        [dataSet3 addObject:[NSString stringWithFormat:@"C%02d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects: dataSet1, dataSet2, dataSet3, nil];
    
    // Cell class ReuseID
    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
    
    // Layout setting
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(44, 44)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma CollectionView methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Cell class ReuseID
    static NSString *cellIdentifier = @"cvCell";

    CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];

    NSString *cellData = [data objectAtIndex:indexPath.row];

    [cell.label setText:cellData]; // update cell setting
    cell.backgroundColor = [self randColor];

    return cell;
}

// Generate random color (pastel)
-(UIColor *)randColor {
    CGFloat hue = ( arc4random() % 1000 / 1000.0 );  // 0.0 - 1.0
    CGFloat saturation = ( arc4random() %  400 / 1000.0 );  // 0.0 - 0.4
    CGFloat brightness = ( arc4random() %  300 / 1000.0 ) + 0.7;  // 0.7 - 1.0
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}


@end
