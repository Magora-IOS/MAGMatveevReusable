#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MAGDoubleTapDetector.h"
#import "MAGDragDetector.h"
#import "MAGFreeSpaceTouchDetector.h"
#import "MAGLongTouchDetector.h"
#import "MAGTapDetector.h"
#import "MAGCommonDefines.h"
#import "MAGDrawing.h"
#import "MAGFrame.h"
#import "MAGMaterializerView.h"
#import "MAGMatveevReusable.h"
#import "NSArray+MAGMore.h"
#import "NSDictionary+MAGMore.h"
#import "NSObject+MAGMore.h"
#import "UIDevice+MAGReachability.h"
#import "UINavigationBar+MAGMore.h"
#import "UITextView+MAGMore.h"
#import "UIView+MAGAnimation.h"
#import "UIView+MAGMore.h"
#import "UIViewController+MAGMore.h"

FOUNDATION_EXPORT double MAGMatveevReusableVersionNumber;
FOUNDATION_EXPORT const unsigned char MAGMatveevReusableVersionString[];

