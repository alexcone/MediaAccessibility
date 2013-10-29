//
//  HBOMediaAccessabilityDefaults.h
//  MediaAccessability
//
//  Created by Cone, Alex (HBO-NS) on 10/25/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import <Foundation/Foundation.h>

// ifdef iOS 7.0
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
@import MediaAccessibility;
#endif

@interface HBOMediaAccessabilityDefaults : NSObject

// ifdef iOS 7.0
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0

// General
+ (NSArray *)preferredCaptioningMediaCharacteristicsForDomain:(MACaptionAppearanceDomain) domain;
+ (NSArray *)preferredCaptioningMediaCharacteristics;

+ (MACaptionAppearanceDisplayType) displayTypeForDomain:(MACaptionAppearanceDomain) domain;
+ (MACaptionAppearanceDisplayType) displayType;
+ (void)setDisplayType:(MACaptionAppearanceDisplayType)displayType forDomain:(MACaptionAppearanceDomain) domain;
+ (void)setDisplayType:(MACaptionAppearanceDisplayType)displayType;

+ (MACaptionAppearanceDisplayType) toggleCaptions; // returns the display type after toggling the setting

// Language
+ (NSArray *)selectedLanguagesForDomain:(MACaptionAppearanceDomain) domain;
+ (NSArray *)selectedLanguages;
+ (bool)addSelectedLanguage:(NSString *)languageIdentifier forDomain:(MACaptionAppearanceDomain) domain;
+ (bool)addSelectedLanguage:(NSString *)languageIdentifier;

// Text Rendering
+ (NSDictionary *)fontInfoForStyle:(MACaptionAppearanceFontStyle)fontStyle forDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)fontInfoForStyle:(MACaptionAppearanceFontStyle)fontStyle;
+ (UIFont *)fontForStyle:(MACaptionAppearanceFontStyle)fontStyle;
+ (NSDictionary *)fontColorInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)fontColorInfo;
+ (UIColor *)fontColor;
+ (NSDictionary *)fontRelativeSizeInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)fontRelativeSizeInfo;
+ (CGFloat)fontRelativeSize;
+ (NSDictionary *)textEdgeStyleInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)textEdgeStyleInfo;
+ (MACaptionAppearanceTextEdgeStyle)textEdgeStyle;
+ (NSDictionary *)highlightColorInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)highlightColorInfo;
+ (UIColor *)highlightColor;

// Caption Window
+ (NSDictionary *)captionWindowColorInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)captionWindowColorInfo;
+ (UIColor *)captionWindowColor;
+ (NSDictionary *)captionWindowRoundedCornerRadiusInfoForDomain:(MACaptionAppearanceDomain) domain;
+ (NSDictionary *)captionWindowRoundedCornerRadiusInfo;
+ (CGFloat)captionWindowRoundedCornerRadius;

// Everything in a Dictionary
+ (NSDictionary *)mediaAccessabilityInfoForDomain:(MACaptionAppearanceDomain) domain;

#endif

+ (NSDictionary *)mediaAccessabilityInfo;

@end
