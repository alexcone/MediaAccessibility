//
//  CFABViewController.h
//  MediaAccessability
//
//  Created by Cone, Alex (HBO-NS) on 10/24/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFABViewController : UIViewController

@property (strong) IBOutlet UITextView *outputTextView;

- (IBAction)toggleCaptioning:(id)sender;
- (IBAction)updateMediaAccessPrefsDisplay:(id)sender;

@end
