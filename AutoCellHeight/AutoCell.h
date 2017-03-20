//
//  AutoCell.h
//  AutoCellHeight
//
//  Created by fanxiaobin on 2017/3/17.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AutoModel;

@interface AutoCell : UITableViewCell

@property (nonatomic,strong) AutoModel *model;

+ (CGFloat)heightForCellWithModel:(AutoModel *)model;

@end
