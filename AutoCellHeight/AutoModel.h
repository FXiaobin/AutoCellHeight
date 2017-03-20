//
//  AutoModel.h
//  AutoCellHeight
//
//  Created by fanxiaobin on 2017/3/17.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AutoModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *desTitle;
@property (nonatomic,copy) NSString *time;

///缓存cell高度
@property (nonatomic) CGFloat cellHeight;

@end
