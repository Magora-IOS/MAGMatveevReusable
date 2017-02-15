
#import <Foundation/Foundation.h>

typedef void (^DidFinishedAtTargetViewLocationBlock)(CGPoint location);

@interface MAGLongTouchDetector : NSObject

@property (nonatomic) NSNumber *minimumRequiredPressDuration;
@property (nonatomic) NSInteger maxDistanceBetweenStartEndPointsForCallAction;
@property (nonatomic) BOOL passTouchEventThroughSelf;
@property (nonatomic) BOOL delayedSelection;//      for example for avoid of displaying of selection on UITableView cells during recognizing
@property (strong, nonatomic) DidFinishedAtTargetViewLocationBlock didFinishedWithTouchDownAtTargetViewLocationBlock;
@property (strong, nonatomic) DidFinishedAtTargetViewLocationBlock didFinishedWithTouchUpAtTargetViewLocationBlock;

@property (readonly, assign, nonatomic) BOOL touchInProgress;//     touchDowned yet, but not touchUpped still

- (void)attachToTargetView:(UIView *)targetView;

@end
