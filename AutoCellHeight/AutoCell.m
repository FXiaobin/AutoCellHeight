//
//  AutoCell.m
//  AutoCellHeight
//
//  Created by fanxiaobin on 2017/3/17.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "AutoCell.h"
#import "AutoModel.h"
#import <Masonry/Masonry.h>

@interface AutoCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *contentIcon;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@end

@implementation AutoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

-(void)setModel:(AutoModel *)model{
    
    self.titleLabel.text = model.title;
    self.desLabel.text = model.desTitle;
    self.timeLabel.text = model.time;
    
    CGFloat desHeight = [model.desTitle boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*10, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine
                                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.0]}
                                                     context:nil].size.height;
    
 
    //NSLog(@"---h = %.2f",desHeight);
    
    //[self.contentView updateConstraintsIfNeeded];
    [self.desLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(desHeight);
    }];
    
    [self.contentView updateFocusIfNeeded];

}


-(void)setupUI{
    
    self.titleLabel = [UILabel new];
    self.titleLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.contentIcon = [UIImageView new];
    self.contentIcon.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:self.contentIcon];
    
    self.desLabel = [UILabel new];
    self.desLabel.numberOfLines = 0;
    self.desLabel.backgroundColor = [UIColor blueColor];
    [self.desLabel sizeToFit];
    [self.contentView addSubview:self.desLabel];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.timeLabel];
    
    CGFloat margin = 10;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(margin);
        make.top.equalTo(self.contentView).offset(margin);
        make.right.equalTo(self.contentView.mas_right).offset(-margin);
        make.height.mas_equalTo(50.0);
    }];
    
    [self.contentIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(margin);
        make.right.equalTo(self.titleLabel.mas_right);
        make.height.mas_equalTo(120.0).priorityHigh();
    }];
    
    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentIcon);
        make.top.equalTo(self.contentIcon.mas_bottom).offset(margin);
        make.right.equalTo(self.contentIcon.mas_right);
        make.height.priorityLow();
    }];
    
//    [self.contentView setNeedsUpdateConstraints];
//    [self.contentView updateFocusIfNeeded];
//    [self.contentView layoutIfNeeded];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.desLabel);
        make.top.equalTo(self.desLabel.mas_bottom).offset(margin);
        make.right.equalTo(self.desLabel.mas_right);
        //make.height.mas_equalTo(40.0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-margin);
    }];

}


+ (CGFloat)heightForCellWithModel:(AutoModel *)model{
    CGFloat margin = 10;
    CGFloat desHeight = [model.desTitle boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*margin, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine
                                                  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.0]}
                                                     context:nil].size.height;
    
    return margin + 50 + margin + 120 + margin + desHeight + margin + 20 + margin;
}


@end
