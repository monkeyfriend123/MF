//
//  MFAFTableCell.h
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFAFTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
- (void)reloadWithUrlString:(NSString *)urlString;
@end
