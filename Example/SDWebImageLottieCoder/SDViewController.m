//
//  SDViewController.m
//  SDWebImageLottieCoder
//
//  Created by lizhuoli1126@126.com on 03/08/2020.
//  Copyright (c) 2020 lizhuoli1126@126.com. All rights reserved.
//

#import "SDViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImageLottieCoder/SDImageLottieCoder.h>

@interface SDViewController ()

@property UIImageView *imageView;

@end

@implementation SDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SDImageCodersManager.sharedManager addCoder:SDImageLottieCoder.sharedCoder];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView = [UIImageView new];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.frame = self.view.bounds;
    [self.view addSubview:self.imageView];
    NSURL *lottieURL = [NSURL URLWithString:@"https://assets2.lottiefiles.com/packages/lf20_Zoe2RW.json"];
    [self.imageView sd_setImageWithURL:lottieURL placeholderImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
