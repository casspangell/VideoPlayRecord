//
//  CPRecordVideoViewController.m
//  VideoPlayRecord
//
//  Created by mondousage on 2/21/14.
//  Copyright (c) 2014 MondoLabs. All rights reserved.
//

#import "CPRecordVideoViewController.h"

@interface CPRecordVideoViewController ()

@end

@implementation CPRecordVideoViewController

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

- (IBAction)recordAndPlayPressed:(id)sender {
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
    
    //Display control to allow user to select movie capture
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie, nil];
    
    // Hides controls for moving or scaling or trimming
    cameraUI.allowsEditing = NO;
    cameraUI.delegate = delegate;
    
    // Display image picker
    [controller presentViewController:cameraUI animated:YES completion:nil];
    
    return  YES;
    
}

// Gives you a moviePath. You verify that the movie can be saved to the device’s photo album, and save it if so.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:NO completion:nil];
    
    // Handle movie capture
    // Verify that the movie can be saved to the device’s photo album
    if (CFStringCompare ((__bridge_retained CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
        
        // default method provided by the SDK to save videos to the Photos Album. As parameters, you pass both the path to the video to be saved, as well as a callback method that will inform you of the status of the save operation.
        if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)){
            UISaveVideoAtPathToSavedPhotosAlbum(moviePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
}

-(void)video:(NSString*)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if(error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Video Saving Failed"
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video Saved" message:@"Saved To Photo Album"
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
