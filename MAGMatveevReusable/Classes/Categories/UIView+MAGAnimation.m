








#import "UIView+MAGAnimation.h"
#import "MAGCommonDefines.h"

@implementation UIView (MAGAnimation)

+ (void)displayImage:(UIImage *)image fromFrame:(CGRect)fromFrame ofView:(UIView *)sourceView fromScale:(CGSize)fromScale toScale:(CGSize)toScale contentMode:(UIViewContentMode)contentMode duration:(NSTimeInterval)duration completion:(dispatch_block_t)completion {
    UIImage *imageOnFinish = image;
    UIImageView *newImageView = [[UIImageView alloc] initWithFrame:fromFrame];
    newImageView.image = imageOnFinish;
    newImageView.contentMode = contentMode;
    newImageView.alpha = 1;
    newImageView.transform = CGAffineTransformMakeScale(fromScale.width, fromScale.height);
    [sourceView addSubview:newImageView];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:(void (^)(void)) ^{
                         newImageView.alpha = 0;
                         newImageView.transform = CGAffineTransformMakeScale(toScale.width,toScale.height);
                     }
                     completion:^(BOOL finished){
                         [newImageView removeFromSuperview];
                         RUN_BLOCK(completion);
                     }];
}

@end
