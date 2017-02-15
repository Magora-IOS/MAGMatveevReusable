








#import <Foundation/Foundation.h>

//!     @return     Will we try watch on drag action
typedef BOOL (^CanHandleDragWhenTouchDownAtLocationBlock)(CGPoint touchDownPoint);
//!     @return     Will we WATCH on drag action
typedef BOOL (^WillHandleDragWhenPanRecognizedAtLocationBlock)(CGPoint touchDownPoint, CGPoint panRecognizedAtPoint, CGFloat lesserPositiveAngleInDegreesBetweenCurrentLocationPointAndAxisX);

typedef void (^DragBeganFromLocationBlock)(CGPoint location, CGPoint touchDownPoint, CGPoint panRecognizedAtPoint);
typedef void (^DragLocationChangedBlock)(CGPoint location, CGPoint fromLocationMoved, CGPoint touchDownPoint, CGPoint panRecognizedAtPoint);
typedef void (^DragFinishedAtLocationBlock)(CGPoint location, CGPoint fromLocationMoved, CGPoint touchDownPoint);

@interface MAGDragDetector : NSObject

@property (nonatomic, strong) CanHandleDragWhenTouchDownAtLocationBlock canHandleDragWhenTouchDownAtLocationBlock;
@property (nonatomic, strong) WillHandleDragWhenPanRecognizedAtLocationBlock willHandleDragWhenPanRecognizedAtLocationBlock;

@property (nonatomic, strong) DragBeganFromLocationBlock dragBeganFromLocationBlock;
@property (nonatomic, strong) DragLocationChangedBlock dragLocationChangedBlock;
@property (nonatomic, strong) DragFinishedAtLocationBlock dragFinishedAtLocationBlock;

@property (nonatomic, assign) BOOL enabled;

@property (nonatomic, assign, readonly) BOOL dragInProgress;

@property (readonly, nonatomic, assign) BOOL isPanRecognizedOnLastRecognizedTouch;


- (id)initWithFundamentView:(UIView *)fundamentView;

@end
