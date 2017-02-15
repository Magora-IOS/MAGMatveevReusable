
#import "MAGTapDetector.h"

@interface MAGTapDetector () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIView *targetView;

@end


@implementation MAGTapDetector

- (void)attachToTargetView:(UIView *)targetView {
    self.targetView = targetView;
    _recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    self.recognizer.numberOfTouchesRequired = 1;
    [self.targetView addGestureRecognizer:self.recognizer];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint tapPoint = [recognizer locationInView:_targetView];
        RUN_BLOCK(self.willTappedBlock, tapPoint);
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint tapPoint = [recognizer locationInView:_targetView];
        RUN_BLOCK(self.didTappedBlock, tapPoint);
    }
}

@end
