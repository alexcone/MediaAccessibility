//
//  HBOMediaAccessabilityDefaults.m
//  MediaAccessability
//
//  Created by Cone, Alex (HBO-NS) on 10/25/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import "HBOMediaAccessabilityDefaults.h"

@implementation HBOMediaAccessabilityDefaults


// ifdef iOS 7.0
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0

// General
+ (NSArray *)preferredCaptioningMediaCharacteristicsForDomain:(MACaptionAppearanceDomain) domain {
    CFArrayRef mediaAccessDefaultsArrayRef = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(domain);
    NSArray *mediaAccessDefaults = CFBridgingRelease(mediaAccessDefaultsArrayRef);
    return mediaAccessDefaults;
}

+ (NSArray *)preferredCaptioningMediaCharacteristics {
    return [HBOMediaAccessabilityDefaults preferredCaptioningMediaCharacteristicsForDomain:kMACaptionAppearanceDomainUser];
}

+ (MACaptionAppearanceDisplayType) displayTypeForDomain:(MACaptionAppearanceDomain) domain {
    MACaptionAppearanceDisplayType captionDisplayType = MACaptionAppearanceGetDisplayType(domain);
    return captionDisplayType;
}
+ (MACaptionAppearanceDisplayType) displayType {
    return [HBOMediaAccessabilityDefaults displayTypeForDomain:kMACaptionAppearanceDomainUser];
}

+ (NSString *)descriptionForDisplayType: (MACaptionAppearanceDisplayType)captionDisplayType {
    return (captionDisplayType==kMACaptionAppearanceDisplayTypeForcedOnly?@"kMACaptionAppearanceDisplayTypeForcedOnly: Do not display captions unless they are forced for translation":(captionDisplayType==kMACaptionAppearanceDisplayTypeAutomatic?@"kMACaptionAppearanceDisplayTypeAutomatic: If the language of the audio track differs from the system locale, then captions matching the system locale should be displayed (if available). If the language of the audio and the language of the system locale match, no captions are shown":@"kMACaptionAppearanceDisplayTypeAlwaysOn: The most robust available captioning track should always be displayed, whether subtitles, CC, or SDH"));
}
+ (void)setDisplayType:(MACaptionAppearanceDisplayType)displayType forDomain:(MACaptionAppearanceDomain) domain {
    MACaptionAppearanceSetDisplayType(domain, displayType);
}
+ (void)setDisplayType:(MACaptionAppearanceDisplayType)displayType {
    [HBOMediaAccessabilityDefaults setDisplayType:displayType forDomain:kMACaptionAppearanceDomainUser];
}

 // returns the display type after toggling the setting
+ (MACaptionAppearanceDisplayType) toggleCaptions {
    MACaptionAppearanceDisplayType currentDisplayType = [HBOMediaAccessabilityDefaults displayType];
    if (currentDisplayType != kMACaptionAppearanceDisplayTypeForcedOnly) {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeForcedOnly];
    } else {
        [HBOMediaAccessabilityDefaults setDisplayType:kMACaptionAppearanceDisplayTypeAlwaysOn];
    }
    return [HBOMediaAccessabilityDefaults displayType];
}


// Language
+ (NSArray *)selectedLanguagesForDomain:(MACaptionAppearanceDomain) domain {
    CFArrayRef selectedLanguagesArrayRef = MACaptionAppearanceCopySelectedLanguages(domain);
    NSArray *selectedLanguages = CFBridgingRelease(selectedLanguagesArrayRef);
    return selectedLanguages;
}
+ (NSArray *)selectedLanguages {
    return [HBOMediaAccessabilityDefaults selectedLanguagesForDomain:kMACaptionAppearanceDomainUser];
}

+ (bool)addSelectedLanguage:(NSString *)languageIdentifier forDomain:(MACaptionAppearanceDomain) domain {
    return MACaptionAppearanceAddSelectedLanguage(domain, (__bridge CFStringRef)(languageIdentifier));
}
+ (bool)addSelectedLanguage:(NSString *)languageIdentifier {
    return [HBOMediaAccessabilityDefaults addSelectedLanguage:languageIdentifier forDomain:kMACaptionAppearanceDomainUser];
}

// Text Rendering
+ (NSDictionary *)fontInfoForStyle:(MACaptionAppearanceFontStyle)fontStyle forDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    
    MACaptionAppearanceBehavior behavior;
    CTFontDescriptorRef fontDescRef = MACaptionAppearanceCopyFontDescriptorForStyle(domain, &behavior, fontStyle);
    
    infoDict[@"kAppearanceBehavior"] = [NSNumber numberWithUnsignedInt:behavior];
    NSMutableDictionary* attributes = [NSMutableDictionary dictionary];
    [infoDict setObject:attributes forKey:@"kFontAttributes"];
    CFStringRef familyName = CTFontDescriptorCopyAttribute(fontDescRef, kCTFontFamilyNameAttribute);
    [attributes setObject:(NSString *)CFBridgingRelease(familyName) forKey:(id)kCTFontFamilyNameAttribute];

    CFDictionaryRef fontAttrs = CTFontDescriptorCopyAttributes(fontDescRef);
    [attributes addEntriesFromDictionary:CFBridgingRelease(fontAttrs)];
    
    CFDictionaryRef traitsDict = CTFontDescriptorCopyAttribute(fontDescRef, kCTFontTraitsAttribute);
    [attributes setObject:CFBridgingRelease(traitsDict) forKey:(id)kCTFontTraitsAttribute];
    CFRelease(fontDescRef);

    return [NSDictionary dictionaryWithDictionary:attributes];
}

+ (NSDictionary *)fontInfoForStyle:(MACaptionAppearanceFontStyle)fontStyle {
    return [HBOMediaAccessabilityDefaults fontInfoForStyle:fontStyle forDomain:kMACaptionAppearanceDomainUser];
}

+ (UIFont *)fontForStyle:(MACaptionAppearanceFontStyle)fontStyle {
    CTFontDescriptorRef fontDescRef = MACaptionAppearanceCopyFontDescriptorForStyle(kMACaptionAppearanceDomainUser, NULL, fontStyle);
    CTFontRef ctFont = CTFontCreateWithFontDescriptor(fontDescRef, 0, NULL);
    CFRelease(fontDescRef);
    CGFloat pointSize = CTFontGetSize(ctFont);
    NSString *fontPostScriptName = (NSString *)CFBridgingRelease(CTFontCopyPostScriptName(ctFont));
    UIFont *fontFromCTFont = [UIFont fontWithName:fontPostScriptName size:pointSize];
    CFRelease(ctFont);

    return fontFromCTFont;
}

+ (NSDictionary *)fontColorInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    CGColorRef colorRef = MACaptionAppearanceCopyForegroundColor(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = [NSNumber numberWithUnsignedInt:behavior];
    UIColor* color = [UIColor colorWithCGColor:colorRef];
    CGColorRelease(colorRef);
//    CGFloat alpha1 = CGColorGetAlpha(colorRef);
    CGFloat alpha2 = MACaptionAppearanceGetForegroundOpacity(domain, &behavior);
    
    infoDict[@"kAppearanceFontColor"] = [color colorWithAlphaComponent:alpha2];
    return infoDict;
}

+ (NSDictionary *)fontColorInfo {
    return [HBOMediaAccessabilityDefaults fontColorInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (UIColor *)fontColor {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults fontColorInfo];
    return infoDict[@"kAppearanceFontColor"];
}

+ (NSDictionary *)fontRelativeSizeInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    CGFloat fontScaling = MACaptionAppearanceGetRelativeCharacterSize(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = @(behavior);
    infoDict[@"kAppearanceFontRelativeSize"] = @(fontScaling);
    return infoDict;
}
+ (NSDictionary *)fontRelativeSizeInfo {
    return [HBOMediaAccessabilityDefaults fontRelativeSizeInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (CGFloat)fontRelativeSize {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults fontRelativeSizeInfo];
    NSNumber *value = infoDict[@"kAppearanceFontRelativeSize"];
    return [value floatValue];
}

+ (NSDictionary *)textEdgeStyleInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    MACaptionAppearanceTextEdgeStyle edgeStyle = MACaptionAppearanceGetTextEdgeStyle(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = @(behavior);
    infoDict[@"kAppearanceTextEdgeStyle"] = @(edgeStyle);
    return infoDict;
}
+ (NSDictionary *)textEdgeStyleInfo {
    return [HBOMediaAccessabilityDefaults textEdgeStyleInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (MACaptionAppearanceTextEdgeStyle)textEdgeStyle {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults textEdgeStyleInfo];
    NSNumber *value = infoDict[@"kAppearanceTextEdgeStyle"];
    return [value longValue];
}
+ (NSDictionary *)highlightColorInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    CGColorRef colorRef = MACaptionAppearanceCopyBackgroundColor(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = [NSNumber numberWithUnsignedInt:behavior];
    UIColor* color = [UIColor colorWithCGColor:colorRef];
    CGColorRelease(colorRef);

//    CGFloat alpha1 = CGColorGetAlpha(colorRef);
    CGFloat alpha2 = MACaptionAppearanceGetBackgroundOpacity(domain, &behavior);
    
    infoDict[@"kAppearanceHighlightColor"] = [color colorWithAlphaComponent:alpha2];
    return infoDict;
}
+ (NSDictionary *)highlightColorInfo {
    return [HBOMediaAccessabilityDefaults highlightColorInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (UIColor *)highlightColor {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults highlightColorInfo];
    return infoDict[@"kAppearanceHighlightColor"];
}

// Caption Window
+ (NSDictionary *)captionWindowColorInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    CGColorRef colorRef = MACaptionAppearanceCopyWindowColor(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = [NSNumber numberWithUnsignedInt:behavior];
    UIColor* color = [UIColor colorWithCGColor:colorRef];
    CGColorRelease(colorRef);

//    CGFloat alpha1 = CGColorGetAlpha(colorRef);
    CGFloat alpha2 = MACaptionAppearanceGetWindowOpacity(domain, &behavior);
    
    infoDict[@"kAppearanceWindowColor"] = [color colorWithAlphaComponent:alpha2];
    return infoDict;
}
+ (NSDictionary *)captionWindowColorInfo {
    return [HBOMediaAccessabilityDefaults captionWindowColorInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (UIColor *)captionWindowColor {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults captionWindowColorInfo];
    return infoDict[@"kAppearanceWindowColor"];
}
+ (NSDictionary *)captionWindowRoundedCornerRadiusInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];
    MACaptionAppearanceBehavior behavior;
    CGFloat radius = MACaptionAppearanceGetWindowRoundedCornerRadius(domain, &behavior);
    infoDict[@"kAppearanceBehavior"] = @(behavior);
    infoDict[@"kAppearanceWindowRoundedCorner"] = @(radius);
    return infoDict;
}
+ (NSDictionary *)captionWindowRoundedCornerRadiusInfo {
    return [HBOMediaAccessabilityDefaults captionWindowRoundedCornerRadiusInfoForDomain:kMACaptionAppearanceDomainUser];
}
+ (CGFloat)captionWindowRoundedCornerRadius {
    NSDictionary *infoDict = [HBOMediaAccessabilityDefaults captionWindowRoundedCornerRadiusInfo];
    return [infoDict[@"kAppearanceWindowRoundedCorner"] floatValue];
}

// Everything in a Dictionary
+ (NSDictionary *)mediaAccessabilityInfoForDomain:(MACaptionAppearanceDomain) domain {
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionary];

    NSArray *anArray = [HBOMediaAccessabilityDefaults preferredCaptioningMediaCharacteristicsForDomain:domain];
    if (anArray.count) {
        infoDict[@"kPreferredCaptioningMediaCharacteristics"] = anArray;
    }
    
    MACaptionAppearanceDisplayType captionDisplayType = MACaptionAppearanceGetDisplayType(domain);
    NSMutableDictionary *tmpDict = [NSMutableDictionary dictionary];
    tmpDict[@"kValue"] = @(captionDisplayType);
    tmpDict[@"kDescription"] = [HBOMediaAccessabilityDefaults descriptionForDisplayType:captionDisplayType];
    infoDict[@"kDisplayType"] = tmpDict;

    anArray = [HBOMediaAccessabilityDefaults selectedLanguagesForDomain:domain];
    if (anArray.count) {
        infoDict[@"kSelectedLanguages"] = anArray;
    }
    
    NSDictionary *aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleDefault forDomain:domain];
    if (aDict) {
        infoDict[@"kDefaultFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleMonospacedWithSerif forDomain:domain];
    if (aDict) {
        infoDict[@"kMonospacedWithSerifFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleProportionalWithSerif forDomain:domain];
    if (aDict) {
        infoDict[@"kProportionalWithSerifFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleMonospacedWithoutSerif forDomain:domain];
    if (aDict) {
        infoDict[@"kMonospacedWithoutSerifFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleProportionalWithoutSerif forDomain:domain];
    if (aDict) {
        infoDict[@"kProportionalWithoutSerifFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleCasual forDomain:domain];
    if (aDict) {
        infoDict[@"kCasualFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleCursive forDomain:domain];
    if (aDict) {
        infoDict[@"kCursiveFontInfo"] = aDict;
    }
    aDict = [HBOMediaAccessabilityDefaults fontInfoForStyle:kMACaptionAppearanceFontStyleSmallCapital forDomain:domain];
    if (aDict) {
        infoDict[@"kSmallCapitalFontInfo"] = aDict;
    }

    aDict = [HBOMediaAccessabilityDefaults fontColorInfoForDomain:domain];
    if (aDict) {
        infoDict[@"kFontColorInfo"] = aDict;
    }
    
    aDict = [HBOMediaAccessabilityDefaults fontRelativeSizeInfoForDomain:domain];
    if (aDict) {
        infoDict[@"kFontSizeInfo"] = aDict;
    }
    
    aDict = [HBOMediaAccessabilityDefaults textEdgeStyleInfoForDomain:domain];
    if (aDict && [aDict[@"kAppearanceTextEdgeStyle"] integerValue]) {
        tmpDict = [NSMutableDictionary dictionaryWithDictionary:aDict];
        MACaptionAppearanceTextEdgeStyle style = [aDict[@"kAppearanceTextEdgeStyle"] integerValue];
        if (style == kMACaptionAppearanceTextEdgeStyleNone) {
            tmpDict[@"kDescription"] = @"The text should not have a styled edge";
        } else if (style == kMACaptionAppearanceTextEdgeStyleRaised) {
            tmpDict[@"kDescription"] = @"An edge makes the text appear to rise above the background";
        } else if (style == kMACaptionAppearanceTextEdgeStyleDepressed) {
            tmpDict[@"kDescription"] = @"An edge makes the text appear pushed in";
        } else if (style == kMACaptionAppearanceTextEdgeStyleUniform) {
            tmpDict[@"kDescription"] = @"A thin outline lies along the edge of the text";
        } else if (style == kMACaptionAppearanceTextEdgeStyleDropShadow) {
            tmpDict[@"kDescription"] = @"An edge makes the text appear to float above the background";
        } else {
            tmpDict[@"kDescription"] = @"An edge style has not been specified";
        }
        infoDict[@"kEdgeStyleInfo"] = tmpDict;
    }
    
    aDict = [HBOMediaAccessabilityDefaults highlightColorInfoForDomain:domain];
    if (aDict) {
        infoDict[@"kHighlightColorInfo"] = aDict;
    }
    
    aDict = [HBOMediaAccessabilityDefaults captionWindowColorInfoForDomain:domain];
    if (aDict) {
        infoDict[@"kWindowColorInfo"] = aDict;
    }

    aDict = [HBOMediaAccessabilityDefaults captionWindowRoundedCornerRadiusInfoForDomain:domain];
    if (aDict) {
        infoDict[@"kWindowCornerRadiusInfo"] = aDict;
    }

    return infoDict;
}

#endif

+ (NSDictionary *)mediaAccessabilityInfo {
    return [HBOMediaAccessabilityDefaults mediaAccessabilityInfoForDomain:kMACaptionAppearanceDomainUser];
}


@end
