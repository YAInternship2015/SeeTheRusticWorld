//
//  STCollectionViewCell.m
//  SeeTheRusticWorld
//
//  Created by anna on 10/2/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

#import "STCollectionViewCell.h"
#import "STPost.h"
#import "UIImageView+AFNetworking.h"


NSString *const STCollectionViewCellIdentifier = @"STCollectionViewCellIdentifier";

@interface STCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *contentImage;

@end

@implementation STCollectionViewCell

- (void)setContent:(STPost *)content {
    
    NSURL *url = [NSURL URLWithString:content.imageUrlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    __weak typeof(self) weakSelf = self;
    self.contentImage.image = nil;
    
    [self.contentImage
     setImageWithURLRequest:request
     placeholderImage:nil
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
         weakSelf.contentImage.image = image;
         [weakSelf layoutSubviews];
     }
     failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
         
     }];
}

@end
