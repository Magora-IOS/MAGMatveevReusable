








#import <Masonry/Masonry.h>

#import "MAGMaterializerView.h"
#import "UIView+MAGMore.h"

@implementation MAGMaterializerView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.view = [NSClassFromString(self.generableClassname)
		mag_loadFromNib:self.generableClassname];
	
    [self mag_inscribeSubview:self.view];
	
	[self.view mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
    }];
}

@end
