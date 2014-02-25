//
//  CPRecordTakePictureViewController.h
//  VideoPlayRecord
//
//  Created by mondousage on 2/24/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface CPRecordTakePictureViewController : UIViewController

-(IBAction)recordAndPlayPressed:(id)sender;
-(BOOL)startCameraControllerFromViewController:(UIViewController*)controller
                                 usingDelegate:(id )delegate;

// Executed after a video is saved to the Asset/Photo Library.
-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInfo;

@property (weak, nonatomic) IBOutlet UIButton *recordAndPlay;

@end
