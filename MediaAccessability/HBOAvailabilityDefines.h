//
//  HBOAvailabilityDefines.h
//
//  Created by Cone, Alex (HBO-NS) on 10/29/13.
//  Copyright (c) 2013 Cone, Alex (HBO-NS). All rights reserved.
//

#import <Availability.h>

#ifndef HBOMAvailabilityDefines_h
#define HBOMAvailabilityDefines_h

#ifndef kCFCoreFoundationVersionNumber_IOS_2_0
#define kCFCoreFoundationVersionNumber_IOS_2_0 478.23
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_2_1
#define kCFCoreFoundationVersionNumber_IOS_2_1 478.26
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_2_2
#define kCFCoreFoundationVersionNumber_IOS_2_2 478.29
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_3_0
#define kCFCoreFoundationVersionNumber_IOS_3_0 478.47
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_3_1
#define kCFCoreFoundationVersionNumber_IOS_3_1 478.52
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_3_2
#define kCFCoreFoundationVersionNumber_IOS_3_2 478.61
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_4_0
#define kCFCoreFoundationVersionNumber_IOS_4_0 550.32
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_4_1
#define kCFCoreFoundationVersionNumber_IOS_4_1  550.38
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_4_2
#define kCFCoreFoundationVersionNumber_IOS_4_2 550.52
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_4_3
#define kCFCoreFoundationVersionNumber_IOS_4_3 550.52
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_5_0
#define kCFCoreFoundationVersionNumber_IOS_5_0 675
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_5_1
#define kCFCoreFoundationVersionNumber_IOS_5_1 690.1
#endif

/* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOSx.x.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBase.h */

#ifndef kCFCoreFoundationVersionNumber_IOS_6_0
#define kCFCoreFoundationVersionNumber_IOS_6_0 793
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_6_1
#define kCFCoreFoundationVersionNumber_IOS_6_1 793.00
#endif

#ifndef kCFCoreFoundationVersionNumber_IOS_7_0
#define kCFCoreFoundationVersionNumber_IOS_7_0 838.00
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
#define IF_IOS7_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_7_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS7_OR_GREATER(...)
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define IF_PRE_IOS7(...)
#else
#define IF_PRE_IOS7(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_7_0) \
{ \
__VA_ARGS__ \
}
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
#define IF_IOS6_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_6_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS6_OR_GREATER(...)
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_6_0
#define IF_PRE_IOS6(...)
#else
#define IF_PRE_IOS6(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_6_0) \
{ \
__VA_ARGS__ \
}
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
#define IF_IOS5_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_5_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS5_OR_GREATER(...)
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
#define IF_PRE_IOS5(...)
#else
#define IF_PRE_IOS5(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_5_0) \
{ \
__VA_ARGS__ \
}
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
#define IF_IOS4_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_4_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS4_OR_GREATER(...)
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
#define IF_PRE_IOS4(...)
#else
#define IF_PRE_IOS4(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_4_0) \
{ \
__VA_ARGS__ \
}
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_2
#define IF_IOS4_2_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_4_2) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS4_2_OR_GREATER(...) \
if (false) \
{ \
}
#endif


#define IF_3_2_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_3_2) \
{ \
__VA_ARGS__ \
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_0
#define IF_3_0_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_3_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_3_0_OR_GREATER(...)
#endif


#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_0
#define IF_PRE_IOS3(...)
#else
#define IF_PRE_IOS3(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_3_0) \
{ \
__VA_ARGS__ \
}
#endif

#define IF_IOS_HAS_COREMIDI(...) IF_IOS4_2_OR_GREATER(__VA_ARGS__)

#ifndef BOOL_ISIPAD
#define BOOL_ISIPAD (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_3_2 && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#endif

#ifndef BOOL_ISIPHONE
#define BOOL_ISIPHONE (!BOOL_ISIPAD)
#endif

#define IS_IOS_2 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_2_0 \
&& kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_3_0)
#define IS_IOS_3 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_3_0 \
&& kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_4_0)
#define IS_IOS_4 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_4_0 \
&& kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_5_0)
#define IS_IOS_5 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_5_0 \
&& kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_6_0)
#define IS_IOS_6 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_6_0 \
&& kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_IOS_6_1)
#define IS_IOS_7 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_IOS_7_0)

#define IS_IOS_2_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_2_0)
#define IS_IOS_2_1 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_2_1)
#define IS_IOS_2_2 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_2_2)
#define IS_IOS_3_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_3_0)
#define IS_IOS_3_1 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_3_1)
#define IS_IOS_3_2 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_3_2)
#define IS_IOS_4_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_4_0)
#define IS_IOS_4_1 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_4_1)
#define IS_IOS_4_2 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_4_2)
#define IS_IOS_4_3 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_4_3)
#define IS_IOS_5_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_5_0)
#define IS_IOS_5_1 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_5_1)
#define IS_IOS_6_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_6_0)
#define IS_IOS_6_1 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_6_1)
#define IS_IOS_7_0 (kCFCoreFoundationVersionNumber == kCFCoreFoundationVersionNumber_IOS_7_0)

#define IS_IOS_OR_OLDER(version) (kCFCoreFoundationVersionNumber <= kCFCoreFoundationVersionNumber_##version)
#define IS_IOS_OR_NEWER(version) (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_##version)
#define IS_IOS_BETWEEN(start, end) (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_##start \
&& kCFCoreFoundationVersionNumber <= kCFCoreFoundationVersionNumber_##end)

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
#define IS_RUNNING_IOS7 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7)
#else
#define IS_RUNNING_IOS7 NO
#endif

#endif

