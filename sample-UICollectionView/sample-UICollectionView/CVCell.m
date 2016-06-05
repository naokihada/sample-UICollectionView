//
//  CVCell.m
//  sample-UICollectionView
//
//  Created by Naoki Hada on 6/5/16.
//  Copyright © 2016 Naoki Hada. All rights reserved.
//

#import "CVCell.h"

@implementation CVCell

@synthesize label = _label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CVCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    
    return self;
    
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

@end
