//
//  CFABViewController.m
//  MediaAccessability
//
//  Created by Cone, Alex (HBO-NS) on 10/24/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import "CFABViewController.h"
#import "HBOMediaAccessabilityDefaults.h"
@import MediaAccessibility;

@interface CFABViewController ()

@property (strong) IBOutlet UISwitch *subtitlesEnabledSwitch;

@end

@implementation CFABViewController

- (IBAction)toggleCaptioning:(id)sender {
    [HBOMediaAccessabilityDefaults toggleCaptions];
}

- (IBAction)updateMediaAccessPrefsDisplay:(id)sender {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults mediaAccessabilityInfo];
    NSString *desc = [infoDict description];
    NSLog(@"Media Accessibility Info: %@", desc);
    [self.outputTextView setText:desc];
}

- (void)updateCaptionsSwitch {
    MACaptionAppearanceDisplayType currentDisplayType = [HBOMediaAccessabilityDefaults displayType];
    [self.subtitlesEnabledSwitch setOn:(currentDisplayType != kMACaptionAppearanceDisplayTypeAlwaysOn)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateCaptionsSwitch];
    [self updateMediaAccessPrefsDisplay:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
