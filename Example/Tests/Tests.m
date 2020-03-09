//
//  SDWebImageLottieCoderTests.m
//  SDWebImageLottieCoderTests
//
//  Created by lizhuoli1126@126.com on 03/08/2020.
//  Copyright (c) 2020 lizhuoli1126@126.com. All rights reserved.
//

@import XCTest;
@import SDWebImage;
@import SDWebImageLottieCoder;

@interface UIColor (HexString)

/**
 Convenience way to get hex string from color. The output should always be 32-bit RGBA hex string like `#00000000`.
 */
@property (nonatomic, copy, readonly, nonnull) NSString *sd_hexString;

@end

@interface Tests : XCTestCase

@end

@implementation Tests

+ (void)setUp {
    [super setUp];
    [SDImageCodersManager.sharedManager addCoder:SDImageLottieCoder.sharedCoder];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIImageViewLoad {
    XCTestExpectation *exception = [self expectationWithDescription: @"AnimationView load lottie URL"];
    UIImageView *imageView = [UIImageView new];
    NSURL *lottieURL = [NSURL URLWithString: @"https://raw.githubusercontent.com/airbnb/lottie-web/master/demo/happy2016/data.json"];
    [imageView sd_setImageWithURL:lottieURL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        XCTAssert(image.sd_isAnimated);
        [exception fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testSDAnimatedImageViewLoad {
    XCTestExpectation *exception = [self expectationWithDescription: @"AnimationView load lottie URL"];
    UIImageView *imageView = [SDAnimatedImageView new];
    NSURL *lottieURL = [NSURL URLWithString: @"https://raw.githubusercontent.com/airbnb/lottie-web/master/demo/happy2016/data.json"];
    [imageView sd_setImageWithURL:lottieURL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        XCTAssert([image isKindOfClass:SDAnimatedImage.class]);
        [exception fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testLottieImageWithBundle {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *filePath = [bundle pathForResource:@"Assets" ofType:@"json" inDirectory:@"lotties"];
    NSData *lottieData = [NSData dataWithContentsOfFile:filePath];
    NSString *resourcePath = bundle.resourcePath;
    SDImageCoderOptions *options = @{SDImageCoderDecodeLottieResourcePath : resourcePath};
    SDAnimatedImage *lottieImage = [[SDAnimatedImage alloc] initWithData:lottieData scale:1 options:options];
    UIImage *posterFrame = [lottieImage animatedImageFrameAtIndex:0];
    // Pick the color to check
    UIColor *color = [posterFrame sd_colorAtPoint:CGPointMake(150, 150)];
    XCTAssert([[color sd_hexString] isEqualToString:@"#fd00cfbf"]);
}

@end

