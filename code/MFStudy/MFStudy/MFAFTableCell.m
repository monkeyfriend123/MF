//
//  MFAFTableCell.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFAFTableCell.h"
#import "UIImageView+AFNetworking.h"
#import "AFURLSessionManager.h"
@implementation MFAFTableCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadWithUrlString:(NSString *)urlString
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
       NSString *downPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/download"];
        NSFileManager *fileManager  = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:downloadTask isDirectory:nil]) {
            [fileManager createDirectoryAtPath:downPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *filePath = [downPath stringByAppendingPathComponent:[response suggestedFilename]];
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        NSString *path = filePath.path;
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        self.imageView.image = image;
    }];
    [downloadTask resume];

    
    
}
@end
