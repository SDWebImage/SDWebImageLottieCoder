/*
* This file is part of the SDWebImage package.
* (c) DreamPiggy <lizhuoli1126@126.com>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

#import "SDViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImageLottieCoder/SDWebImageLottieCoder.h>

@interface MyCustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *customTextLabel;
@property (nonatomic, strong) SDAnimatedImageView *customImageView;

@end

@implementation MyCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _customImageView = [[SDAnimatedImageView alloc] initWithFrame:CGRectMake(20.0, 2.0, 60.0, 40.0)];
        [self.contentView addSubview:_customImageView];
        _customTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 12.0, 200, 20.0)];
        [self.contentView addSubview:_customTextLabel];
        
        _customImageView.clipsToBounds = YES;
        _customImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

@end

@interface SDViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *objects;

@end

@implementation SDViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.title = @"SDWebImage";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithTitle:@"Clear Cache"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(flushCache)];
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
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (void)flushCache {
    [SDWebImageManager.sharedManager.imageCache clearWithCacheType:SDImageCacheTypeAll completion:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MyCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.customImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayIndicator;
    }
    
    cell.customTextLabel.text = [NSString stringWithFormat:@"Image #%ld", (long)indexPath.row];
    [cell.customImageView sd_setImageWithURL:[NSURL URLWithString:self.objects[indexPath.row]]
                            placeholderImage:nil
                                     options:0
                                     context:nil];
    return cell;
}

@end
