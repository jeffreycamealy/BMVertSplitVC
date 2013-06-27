

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)

- (void)addConstraintForSubview:(UIView *)subview visualFormat:(NSString *)format;
- (void)addConstraintsForViews:(NSDictionary *)views visualFormat:(NSString *)format;

@end
