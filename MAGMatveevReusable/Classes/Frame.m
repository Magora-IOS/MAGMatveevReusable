








#import "Frame.h"

@implementation Frame

+ (CGRect)layoutFrame:(CGRect)frame inFrame:(CGRect)superframe withFrameAlignment:(FrameAlignment)frameAlignment {
    CGRect resultFrame = frame;
    switch (frameAlignment) {
        case FrameAlignmentCenter: {
            resultFrame = [[self class] centerFrame:resultFrame horizontallyInFrame:superframe];
            resultFrame = [[self class] centerFrame:resultFrame verticallyInFrame:superframe];
        }break;
        case FrameAlignmentTopCenter: {
            resultFrame = [[self class] centerFrame:resultFrame horizontallyInFrame:superframe];
            resultFrame.origin.y = 0.0;
        }break;
        case FrameAlignmentBottomCenter: {
            resultFrame = [[self class] centerFrame:resultFrame horizontallyInFrame:superframe];
            resultFrame = [[self class] layoutFrame:resultFrame toBottomOfFrame:superframe];
        }break;
        case FrameAlignmentLeftCenter: {
            resultFrame.origin.x = 0.0;
            resultFrame = [[self class] centerFrame:resultFrame verticallyInFrame:superframe];
        }break;
        case FrameAlignmentRightCenter: {
            resultFrame = [[self class] layoutFrame:resultFrame toRightSideOfFrame:superframe];
            resultFrame = [[self class] centerFrame:resultFrame verticallyInFrame:superframe];
        }break;
        case FrameAlignmentTopLeft: {
            resultFrame.origin.x = 0.0;
            resultFrame.origin.y = 0.0;
        }break;
        case FrameAlignmentTopRight: {
            resultFrame = [[self class] layoutFrame:resultFrame toRightSideOfFrame:superframe];
            resultFrame.origin.y = 0.0;
        }break;
        case FrameAlignmentBottomLeft: {
            resultFrame.origin.x = 0.0;
            resultFrame = [[self class] layoutFrame:resultFrame toBottomOfFrame:superframe];
        }break;
        case FrameAlignmentBottomRight: {
            resultFrame = [[self class] layoutFrame:resultFrame toRightSideOfFrame:superframe];
            resultFrame = [[self class] layoutFrame:resultFrame toBottomOfFrame:superframe];
        }break;
        case FrameAlignmentXCenter: {
            resultFrame = [[self class] centerFrame:resultFrame horizontallyInFrame:superframe];
        }break;
        case FrameAlignmentYCenter: {
            resultFrame = [[self class] centerFrame:resultFrame verticallyInFrame:superframe];
        }break;
            
        default:
            break;
    }
    return resultFrame;
}

+ (CGRect)centerFrame:(CGRect)frame horizontallyInFrame:(CGRect)superframe
{
    CGRect resultFrame = frame;
    resultFrame.origin.x = (superframe.size.width - frame.size.width) / 2.0;
    return resultFrame;
}

+ (CGRect)centerFrame:(CGRect)frame verticallyInFrame:(CGRect)superframe
{
    CGRect resultFrame = frame;
    resultFrame.origin.y = (superframe.size.height - frame.size.height) / 2.0;
    return resultFrame;
}

+ (CGRect)layoutFrame:(CGRect)frame toRightSideOfFrame:(CGRect)superframe
{
    CGRect resultFrame = frame;
    resultFrame.origin.x = superframe.size.width - frame.size.width;
    return resultFrame;
}

+ (CGRect)layoutFrame:(CGRect)frame toBottomOfFrame:(CGRect)superframe
{
    CGRect resultFrame = frame;
    resultFrame.origin.y = superframe.size.height - frame.size.height;
    return resultFrame;
}

@end
