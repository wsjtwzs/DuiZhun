//
//  ShareViewController.h
//  Unity-iPhone
//
//  Created by  evafan2003 on 14-8-13.
//
//

#import "BaseViewController.h"
#import <AssetsLibrary/ALAsset.h>

#import <AssetsLibrary/ALAssetsLibrary.h>

#import <AssetsLibrary/ALAssetsGroup.h>

#import <AssetsLibrary/ALAssetRepresentation.h>

//#import "ALAssetsLibrary+CustomPhotoAlbum.h"

#import <MediaPlayer/MPMoviePlayerController.h>

@interface ShareViewController : BaseViewController
@property (nonatomic, strong) ALAssetsLibrary *lib;
@property (nonatomic, assign) BOOL video;
@property (retain, nonatomic) IBOutlet UIView *shareView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@property (retain, nonatomic) IBOutlet UIButton *playMark;
//三个分享
@property (retain, nonatomic) IBOutlet UIButton *sinaButton;
@property (retain, nonatomic) IBOutlet UIButton *tButton;
@property (retain, nonatomic) IBOutlet UIButton *wxButton;

- (IBAction)sinaPress:(id)sender;
- (IBAction)tPress:(id)sender;
- (IBAction)wxPress:(id)sender;

- (IBAction)share:(id)sender;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) MPMoviePlayerController *mpvc;
@end
