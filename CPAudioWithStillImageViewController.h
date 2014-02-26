//
//  CPAudioWithStillImageViewController.h
//  VideoPlayRecord
//
//  Created by mondousage on 2/25/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface CPAudioWithStillImageViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{

    IBOutlet UIImageView *imageView;
}

-(IBAction)takePhotoPressed:(id)sender;
-(BOOL)startCameraControllerFromViewController:(UIViewController*)controller
                                 usingDelegate:(id )delegate;

// Executed after a video is saved to the Asset/Photo Library.
-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInfo;

@property (weak, nonatomic) IBOutlet UIButton *takePhoto;

@end
