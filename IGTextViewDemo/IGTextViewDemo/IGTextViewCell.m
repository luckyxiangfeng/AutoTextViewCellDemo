//
//  IGTextViewCell.m
//  IGTextViewDemo
//
//  Created by Kennith.Zeng on 2018/3/29.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import "IGTextViewCell.h"
#import <Masonry.h>
@interface IGTextViewCell()<UITextViewDelegate>
@property(nonatomic, strong) UITextView *cusTextView;
@end

@implementation IGTextViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor redColor];
        self.contentView.backgroundColor =[UIColor redColor];
        [self layoutUI];
        
    }
    
    return self;
}

-(void)layoutUI
{
    if (!_cusTextView) {
        _cusTextView = [[UITextView alloc] init];
        _cusTextView.delegate = self;
        _cusTextView.textColor = [UIColor whiteColor];
        _cusTextView.font = [UIFont systemFontOfSize:30];
        _cusTextView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_cusTextView];
        [_cusTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(80).priorityHigh();
            make.bottom.mas_equalTo(0).priorityLow();
        }];
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)textViewDidChange:(UITextView *)textView{
    
    if (self.callbackTextViewChangeText) {
        self.callbackTextViewChangeText(textView.text);
    }
    CGRect rect = textView.bounds;
    UITableView *myTableView = [self myTableView];
    CGSize maxSize = CGSizeMake(rect.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    if (newSize.height>80) {
        [_cusTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(newSize.height);
        }];
        [myTableView beginUpdates];
        [myTableView endUpdates];
        
    }

}
- (UITableView *)myTableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}
@end
