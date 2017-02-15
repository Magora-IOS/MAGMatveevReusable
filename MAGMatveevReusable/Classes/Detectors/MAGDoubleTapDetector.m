
#import "MAGDoubleTapDetector.h"

@implementation MAGDoubleTapDetector

- (void)attachToTargetView:(UIView *)targetView {
    [super attachToTargetView:targetView];
    self.recognizer.numberOfTapsRequired = 2;
}

@end
