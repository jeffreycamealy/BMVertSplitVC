

#import "UIView+Utilities.h"

@implementation UIView (Utilities)

+ (instancetype)autoLayoutViewAddedToView:(UIView *)baseView {
    UIView *view = self.new;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [baseView addSubview:view];
    return view;
}

@end
