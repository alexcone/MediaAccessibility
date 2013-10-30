//
//  MediaAccessabilityTests.m
//  MediaAccessabilityTests
//
//  Created by Cone, Alex (HBO-NS) on 10/24/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MediaAccessabilityTests : XCTestCase

@property   (nonatomic, assign) MACaptionAppearanceDisplayType initialDisplayType;

@end

@implementation MediaAccessabilityTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.initialDisplayType = [HBOMediaAccessabilityDefaults displayType];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [HBOMediaAccessabilityDefaults setDisplayType:self.initialDisplayType];

    [super tearDown];
}

- (void)testToggle
{
    NSString *targetTypeDesc;
    MACaptionAppearanceDisplayType aDisplayType = [HBOMediaAccessabilityDefaults displayType];
    if (aDisplayType != kMACaptionAppearanceDisplayTypeForcedOnly) {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeForcedOnly];
        targetTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: kMACaptionAppearanceDisplayTypeForcedOnly];
    } else {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeAlwaysOn];
        targetTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: kMACaptionAppearanceDisplayTypeAlwaysOn];
    }
    MACaptionAppearanceDisplayType finalDisplayType = [HBOMediaAccessabilityDefaults displayType];
    
    NSString *initialTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: aDisplayType];
    NSString *finalTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: finalDisplayType];

    XCTAssertNotEqual(aDisplayType, finalDisplayType, @"Failure switching display type from %@ to %@ - got %@", initialTypeDesc, targetTypeDesc, finalTypeDesc);
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
