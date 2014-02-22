//
//  CPMergeVideoViewController.h
//  VideoPlayRecord
//
//  Created by mondousage on 2/21/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CPMergeVideoViewController : UIViewController
{
    BOOL isSelectingAssetOne; // Used to identify which asset is currently selected
}

@property(nonatomic, strong) AVAsset *firstAsset;
@property(nonatomic, strong) AVAsset *secondAsset;
@property(nonatomic, strong) AVAsset *audioAsset;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@property (weak, nonatomic) IBOutlet UIButton *loadAssetOne;
@property (weak, nonatomic) IBOutlet UIButton *loadAssetTwo;
@property (weak, nonatomic) IBOutlet UIButton *loadAudio;
@property (weak, nonatomic) IBOutlet UIButton *mergeAndSave;

-(BOOL)startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id)delegate;
-(void)exportDidFinish:(AVAssetExportSession*)session;


@end
