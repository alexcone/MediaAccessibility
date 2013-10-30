//
//  MediaAccessabilityTests.m
//  MediaAccessabilityTests
//
//  Created by Cone, Alex (HBO-NS) on 10/24/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MediaAccessabilityTests : XCTestCase

@end

@implementation MediaAccessabilityTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testToggle
{
    MACaptionAppearanceDisplayType initialDisplayType = [HBOMediaAccessabilityDefaults displayType];
    if (initialDisplayType != kMACaptionAppearanceDisplayTypeForcedOnly) {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeForcedOnly];
    } else {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeAlwaysOn];
    }
    MACaptionAppearanceDisplayType finalDisplayType = [HBOMediaAccessabilityDefaults displayType];
    
    NSString *initialTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: initialDisplayType];
    NSString *finalTypeDesc = [HBOMediaAccessabilityDefaults descriptionForDisplayType: finalDisplayType];

    XCTAssertNotEqual(initialDisplayType, finalDisplayType, @"Switched display type from %@ to %@", initialTypeDesc, finalTypeDesc);
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
