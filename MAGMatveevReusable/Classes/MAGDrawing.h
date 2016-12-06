//
//  MAGDrawing.h
//  Pods
//
//  Created by Matveev on 06/12/16.
//
//

#import <Foundation/Foundation.h>

@interface MAGDrawing : NSObject

#define RGBA_FROM_HEX_STR(hexString) [Utils rgbFromHexString:hexString]
+ (UIColor *)rgbFromHexString:(NSString *)hexString;

+ (UIImage *)image:(UIImage *)image maskedByColor:(UIColor *)color;
+ (UIImage *)imageNamed:(NSString *)name maskedByColor:(UIColor *)color;
+ (UIImage *)image:(UIImage*)image withCornerRadius:(CGFloat)cornerRadius drawnInRect:(CGRect)rect;
+ (UIImage *)coloredRectImageWithFrame:(CGRect)frame withColor:(UIColor *)color;
+ (UIImage *)coloredRectImageWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor withVerticalLinesWidth:(CGFloat)verticalLineWidth withVerticalLinesColor:(UIColor *)verticalLinesColor withIntervalBetweenVerticalLines:(CGFloat)intervalBetweenVerticalLines withFirstVerticalLineShift:(CGFloat)firstVerticalLineShift;
+ (UIImage *)image:(UIImage *)sourceImage byApplyingAlpha:(CGFloat)alpha;

+ (NSDictionary *)drawingAttributesWithFont:(UIFont *)font withForegroundColor:(UIColor *)foregroundColor;
+ (NSDictionary *)drawingAttributesWithFont:(UIFont *)font foregroundColor:(UIColor *)foregroundColor lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment paragraphSpacingAfter:(CGFloat)paragraphSpacingAftert;
+ (void)addUnderlineForAttributedString:(NSMutableAttributedString *)attributedString underlineStyle:(NSUnderlineStyle)underlineStyle underlineColor:(UIColor *)underlineColor range:(NSRange)range;
//+ (NSDictionary *)drawingAttributesWithFont:(UIFont *)font withForegroundColor:(UIColor *)foregroundColor withLineBreakMode:(NSLineBreakMode)lineBreakMode withAlignment:(NSTextAlignment)alignment;
//
//+ (UIImage *)drawSectorWithColor:(UIColor *)color withLineWidth:(CGFloat)lineWidth inRect:(CGRect)rect withStartDegreesAngle:(CGFloat)startDegreesAngle withEndDegreesAngle:(CGFloat)endDegreesAngle withClockwise:(BOOL)clockwise;

@end
