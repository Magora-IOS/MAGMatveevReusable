
#import "MAGTapDetector.h"

typedef BOOL (^TappedViewBlock)(UIView *view);

@interface MAGFreeSpaceTouchDetector : MAGTapDetector

@property (strong, nonatomic) TappedViewBlock shouldRecognizeViewAsFreespaceBlock;

@end
