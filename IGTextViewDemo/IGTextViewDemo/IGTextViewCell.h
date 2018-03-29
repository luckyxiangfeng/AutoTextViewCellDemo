//
//  IGTextViewCell.h
//  IGTextViewDemo
//
//  Created by Kennith.Zeng on 2018/3/29.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface IGTextViewCell : UITableViewCell
@property (nonatomic, copy) void(^callbackTextViewChangeText)(NSString *text);
@end
