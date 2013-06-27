

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

- (void)addConstraintForSubview:(UIView *)subview withVisualFormat:(NSString *)format {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[(\\w*)[(\\]]"
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:format
                                      options:0
                                        range:NSMakeRange(0, format.length)];
    NSTextCheckingResult *result = matches[0];
    NSRange range = [result rangeAtIndex:1];
    NSString *viewName = [format substringWithRange:range];
    NSDictionary *viewDict = @{viewName: subview};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                 options:0
                                                                 metrics:nil
                                                                   views:viewDict]];
}

@end
