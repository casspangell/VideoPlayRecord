//
//  CPAudioWithStillImageViewController.m
//  VideoPlayRecord
//
//  Created by mondousage on 2/25/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import "CPAudioWithStillImageViewController.h"

@interface CPAudioWithStillImageViewController ()

@end

@implementation CPAudioWithStillImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)takePhotoPressed:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

-(BOOL) startCameraControllerFromViewController:(UIViewController *)controller usingDelegate:(id)delegate{
    // Validation
    // Need to access the camera
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) || (delegate == nil) || (controller == nil)){
        return NO;
    }
    
    // Get the image picker
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //Display control to allow user to select image capture
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
    
    // Hides controls for moving or scaling or trimming
    cameraUI.allowsEditing = NO;
    cameraUI.delegate = delegate;
    
    // Display image picker
    [controller presentViewController:cameraUI animated:YES completion:nil];
    
    return  YES;
    
}

// Gives you a moviePath. You verify that the movie can be saved to the device’s photo album, and save it if so.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
    [self dismissViewControllerAnimated:NO completion:nil];
  
    [imageView setImage:image];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)image:(NSString*)imagePath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if(error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image Saving Failed"
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Image Saved" message:@"Image To Photo Album"
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
