//
//  ViewController.h
//  OpenINDocument
//
//  Created by Mac29 on 09/10/12.
//  Copyright (c) 2012 Mac29. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIDocumentInteractionControllerDelegate>
@property (nonatomic, retain) UIDocumentInteractionController *documentController ;
- (IBAction)btnAction:(id)sender;

@end
