
//@import MAGMatveevReusable;

#import "MAGCommonDefines.h"

@interface MAGTapDetector : NSObject

@property (strong, nonatomic) MAGPointBlock willTappedBlock;
@property (strong, nonatomic) MAGPointBlock didTappedBlock;
@property (readonly, strong, nonatomic) UITapGestureRecognizer *recognizer;

- (void)attachToTargetView:(UIView *)targetView;

@end
