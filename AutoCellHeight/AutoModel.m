//
//  AutoModel.m
//  AutoCellHeight
//
//  Created by fanxiaobin on 2017/3/17.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "AutoModel.h"
#import "AutoCell.h"

@implementation AutoModel

-(CGFloat)cellHeight{
    if (!_cellHeight) {
        _cellHeight = [AutoCell heightForCellWithModel:self];
    
    }
    return _cellHeight;
}

@end
