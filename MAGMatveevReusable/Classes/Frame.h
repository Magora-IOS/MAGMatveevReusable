
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FrameAlignment) {
    FrameAlignmentCenter,
    FrameAlignmentTopCenter,
    FrameAlignmentBottomCenter,
    FrameAlignmentLeftCenter,
    FrameAlignmentRightCenter,
    FrameAlignmentTopLeft,
    FrameAlignmentTopRight,
    FrameAlignmentBottomLeft,
    FrameAlignmentBottomRight,
    FrameAlignmentXCenter,
    FrameAlignmentYCenter,
    
    FrameAlignmentNone
};

@interface Frame : NSObject

+ (CGRect)layoutFrame:(CGRect)frame inFrame:(CGRect)superframe withFrameAlignment:(FrameAlignment)frameAlignment;

@end
