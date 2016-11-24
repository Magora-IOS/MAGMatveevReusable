








#import <UIKit/UIKit.h>

@interface UIView (MAGAnimation)

+ (void)displayImage:(UIImage *)image fromFrame:(CGRect)fromFrame ofView:(UIView *)sourceView fromScale:(CGSize)fromScale toScale:(CGSize)toScale contentMode:(UIViewContentMode)contentMode duration:(NSTimeInterval)duration completion:(dispatch_block_t)completion;

@end
