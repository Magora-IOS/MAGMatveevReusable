








/**
		@brief Now works just for views with autolayout support (MaterializerView must has UseAutolayouts flag enabled)
		@TODO Work with enabled autolayouts / disabled autolayouts
*/

@interface MAGMaterializerView <ViewClass> : UIView

@property (strong, nonatomic) ViewClass view;

@property (copy, nonatomic) IBInspectable NSString *generableClassname;

@end
