//
//  ViewController.m
//  SDWebImageLottieCoder_Example macOS
//
//  Created by 李卓立 on 2020/3/9.
//  Copyright © 2020 lizhuoli1126@126.com. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImageLottieCoder/SDWebImageLottieCoder.h>

@interface MyCustomCollectionViewItem : NSCollectionViewItem

@property (strong) NSImageView *imageViewDisplay;

@end

@interface MyCustomCollectionViewItem ()

@end

@implementation MyCustomCollectionViewItem

- (void)loadView {
    self.view = [NSView new];
    self.view.wantsLayer = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViewDisplay = [SDAnimatedImageView new];
    [self.view addSubview:self.imageViewDisplay];
}

- (void)viewDidLayout {
    [super viewDidLayout];
    self.imageViewDisplay.frame = self.view.bounds;
}

@end

@interface ViewController () <NSCollectionViewDelegate, NSCollectionViewDataSource>

@property (strong) NSScrollView *scrollView;
@property (strong) NSCollectionView *collectionView;
@property (strong) NSMutableArray<NSString *> *objects;

@end

@implementation ViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Add coder
    [SDImageCodersManager.sharedManager addCoder:SDImageLottieCoder.sharedCoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Lottie URLs
    self.objects = [NSMutableArray arrayWithObjects:
                    @"https://assets6.lottiefiles.com/animated_stickers/lf_tgs_HktDR1.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_sFL7Vv.json",
                    @"https://assets1.lottiefiles.com/animated_stickers/lf_tgs_GzPhIF.json",
                    @"https://assets1.lottiefiles.com/animated_stickers/lf_tgs_NseG8A.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_t9jKy8.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_50qsGb.json",
                    @"https://assets7.lottiefiles.com/animated_stickers/lf_tgs_3chCvj.json",
                    @"https://assets5.lottiefiles.com/animated_stickers/lf_tgs_U0t51u.json",
                    @"https://assets10.lottiefiles.com/animated_stickers/lf_tgs_4ePDAr.json",
                    @"https://assets7.lottiefiles.com/animated_stickers/lf_tgs_BYL6wZ.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_CclNS1.json",
                    @"https://assets10.lottiefiles.com/animated_stickers/lf_tgs_cazDC7.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_NhF7S7.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_19bhKA.json",
                    @"https://assets10.lottiefiles.com/animated_stickers/lf_tgs_KEiEDk.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_KYkQJn.json",
                    @"https://assets5.lottiefiles.com/animated_stickers/lf_tgs_DYdYL0.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_95uX9a.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_LI91Wb.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_3yBQZc.json",
                    @"https://assets7.lottiefiles.com/animated_stickers/lf_tgs_AA0Jpu.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_cO3sIM.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_OK5mAM.json",
                    @"https://assets1.lottiefiles.com/animated_stickers/lf_tgs_bq6XeO.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_T5HCbg.json",
                    @"https://assets1.lottiefiles.com/animated_stickers/lf_tgs_R4edsE.json",
                    @"https://assets2.lottiefiles.com/animated_stickers/lf_tgs_H4wfap.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_nBtfGp.json",
                    @"https://assets10.lottiefiles.com/animated_stickers/lf_tgs_2u944T.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_lDTQwO.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_VqFGpd.json",
                    @"https://assets10.lottiefiles.com/animated_stickers/lf_tgs_81iH9p.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_wmferI.json",
                    @"https://assets7.lottiefiles.com/animated_stickers/lf_tgs_j589I7.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_UnQGjI.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_xTP1Wv.json",
                    @"https://assets3.lottiefiles.com/animated_stickers/lf_tgs_IXBQ8H.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_Ib9gZj.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_HvhdxX.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_XkMtYS.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_tpoBjw.json",
                    @"https://assets4.lottiefiles.com/animated_stickers/lf_tgs_W76SFA.json",
                    @"https://assets5.lottiefiles.com/animated_stickers/lf_tgs_0sSxND.json",
                    @"https://assets2.lottiefiles.com/animated_stickers/lf_tgs_wNNws7.json",
                    @"https://assets1.lottiefiles.com/animated_stickers/lf_tgs_JlmIfF.json",
                    @"https://assets9.lottiefiles.com/animated_stickers/lf_tgs_N3nMCm.json",
                    @"https://assets2.lottiefiles.com/animated_stickers/lf_tgs_SWtINd.json",
                    @"https://assets8.lottiefiles.com/animated_stickers/lf_tgs_5QN45U.json",
                    @"https://assets6.lottiefiles.com/animated_stickers/lf_tgs_3M8O4q.json",
                    nil];
    
    self.collectionView = [[NSCollectionView alloc] initWithFrame:self.view.bounds];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    NSCollectionViewGridLayout *layout = [NSCollectionViewGridLayout new];
    layout.minimumItemSize = CGSizeMake(300, 300);
    layout.maximumItemSize = CGSizeMake(500, 500);
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerClass:MyCustomCollectionViewItem.class forItemWithIdentifier:@"MyCustomCollectionViewItem"];
    
    self.scrollView = [NSScrollView new];
    self.scrollView.documentView = self.collectionView;
    [self.view addSubview:self.scrollView];
    
    [self.collectionView reloadData];
}

- (void)viewDidLayout {
    [super viewDidLayout];
    self.scrollView.frame = self.view.bounds;
    self.collectionView.frame = self.scrollView.bounds;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.objects.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return 1;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    MyCustomCollectionViewItem *cell = [collectionView makeItemWithIdentifier:@"MyCustomCollectionViewItem" forIndexPath:indexPath];
    cell.imageViewDisplay.sd_imageIndicator = SDWebImageActivityIndicator.grayIndicator;
    [cell.imageViewDisplay sd_setImageWithURL:[NSURL URLWithString:self.objects[indexPath.item]]
                             placeholderImage:nil
                                      options:0
                                      context:nil];
    return cell;
}


@end
