//
//  ViewController.m
//  OpenINDocument
//
//  Created by Mac29 on 09/10/12.
//  Copyright (c) 2012 Mac29. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize documentController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    NSString *path = @"file://localhost/Users/Mac29/Library/Application%20Support/iPhone%20Simulator/6.0/Applications/33E1919C-3153-402C-B951-59AF7864E696/Library/Private/My%20Private%20Files/test/image_134.png";
	NSURL *fileURL = [NSURL URLWithString:path];

    if(!self.documentController)
        self.documentController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    else
        [self.documentController setURL:fileURL];
    
    self.documentController.delegate = self;
    BOOL isPresented = NO;
    if([sender isKindOfClass:[UIBarButtonItem class]])
        isPresented = [documentController presentOpenInMenuFromBarButtonItem:sender animated:YES];
    else{
        CGRect buttonRect = [self.view convertRect:[sender frame] toView:self.view] ;
        isPresented = [documentController presentOptionsMenuFromRect:buttonRect inView:self.view animated:YES];
    }
    if(!isPresented) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"No installed app support opening this file" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
        [actionSheet showInView:self.view];
    }

}

- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller canPerformAction:(SEL)action
{
    NSLog(@"name %@",controller.name);
    NSLog(@"URL %@",controller.URL);
    NSLog(@"icons %@",controller.icons);
    return YES;
}
- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller performAction:(SEL)action
{
    return YES;

    
}



@end
