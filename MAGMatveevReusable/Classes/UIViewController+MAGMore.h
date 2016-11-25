








#import <UIKit/UIKit.h>

@interface UIViewController (MAGMore)

- (void)mag_addCloseButton;
- (IBAction)closeAction;

- (void)mag_presentVCinsideNC:(UIViewController *)vc animated:(BOOL)animated;
- (void)mag_presentVCinAppTopVCinsideNC:(UIViewController *)vc animated:(BOOL)animated;

@end
