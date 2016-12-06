//
//  MAGDrawing.m
//  Pods
//
//  Created by Matveev on 06/12/16.
//
//

#import "MAGDrawing.h"
#import "MAGCommonDefines.h"

@implementation MAGDrawing

//      for example: "#AARRGGBB"
+ (UIColor *)rgbFromHexString:(NSString *)hexString {
    UIColor *result;
    NSMutableCharacterSet *characterSet = [[NSCharacterSet whitespaceAndNewlineCharacterSet] mutableCopy];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:characterSet] uppercaseString];
    
    if ([cString length] != 8) {
        result =  [UIColor colorWithWhite:0.0 alpha:0.0];
    } else {
        unsigned long long rgbValue = 0;
        [[NSScanner scannerWithString:cString] scanHexLongLong:&rgbValue];
        
        CGFloat alpha = ((CGFloat)((rgbValue & 0xFF000000) >> 24));
        CGFloat red = ((CGFloat)((rgbValue & 0x00FF0000) >> 16));
        CGFloat green = ((CGFloat)((rgbValue & 0x0000FF00) >> 8));
        CGFloat blue = ((CGFloat)(rgbValue & 0x000000FF));
        
        result = RGBA(red, green, blue, alpha);
    }
    return result;
}

+ (UIImage *)image:(UIImage *)image maskedByColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(c, [color CGColor]);
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    CGContextFillRect(c, rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)imageNamed:(NSString *)name maskedByColor:(UIColor *)color {
    UIImage *image = [UIImage imageNamed:name];
    UIImage *result = [MAGDrawing image:image maskedByColor:color];
    return  result;
}

+ (UIImage *)image:(UIImage*)image withCornerRadius:(CGFloat)cornerRadius drawnInRect:(CGRect)rect {
    UIImage *result;
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect
                                cornerRadius:cornerRadius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    result = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return result;
}

+ (UIImage *)drawSectorWithColor:(UIColor *)color withLineWidth:(CGFloat)lineWidth inRect:(CGRect)rect withStartDegreesAngle:(CGFloat)startDegreesAngle withEndDegreesAngle:(CGFloat)endDegreesAngle withClockwise:(BOOL)clockwise {
    //      http://stackoverflow.com/questions/15866179/draw-segments-from-a-circle-or-donut
    UIImage *result;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGFloat startRadiansAngle = startDegreesAngle * M_PI / 180.0;
    CGFloat endRadiansAngle = endDegreesAngle * M_PI / 180.0;
    
    CGFloat radius = MIN(rect.size.width,rect.size.height) / 2.0 - lineWidth;
    CGContextAddArc(c,
                    CGRectGetMidX(rect),
                    CGRectGetMidY(rect),
                    radius,
                    startRadiansAngle,
                    endRadiansAngle,
                    clockwise);
    
    
    CGContextSetFillColorWithColor(c, color.CGColor);
    CGContextSetLineWidth(c,lineWidth);
    
    CGContextSetLineCap(c, kCGLineCapButt);
    
    CGContextReplacePathWithStrokedPath(c);
    
    CGContextDrawPath(c, kCGPathFill);
    result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (UIImage *)coloredRectImageWithFrame:(CGRect)frame withColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 2.0);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(c, color.CGColor);
    CGContextFillRect(c, frame);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)coloredRectImageWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor withVerticalLinesWidth:(CGFloat)verticalLineWidth withVerticalLinesColor:(UIColor *)verticalLinesColor withIntervalBetweenVerticalLines:(CGFloat)intervalBetweenVerticalLines withFirstVerticalLineShift:(CGFloat)firstVerticalLineShift {
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 2.0);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(c, backgroundColor.CGColor);
    CGContextFillRect(c, frame);
    
    CGFloat currentX = firstVerticalLineShift;
    
    CGContextSetFillColorWithColor(c, verticalLinesColor.CGColor);
    CGRect currentLineRect = CGRectMake(0, 0, verticalLineWidth, frame.size.height);
    while (currentX < frame.size.width) {
        currentLineRect.origin.x = currentX;
        CGContextFillRect(c, currentLineRect);
        currentX += intervalBetweenVerticalLines;
    }
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)image:(UIImage *)sourceImage byApplyingAlpha:(CGFloat)alpha {
    UIImage *result;
    UIGraphicsBeginImageContextWithOptions(sourceImage.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, sourceImage.size.width, sourceImage.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, sourceImage.CGImage);
    
    result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (NSDictionary *)drawingAttributesWithFont:(UIFont *)font withForegroundColor:(UIColor *)foregroundColor {
    NSDictionary *result;
    result = @{ NSFontAttributeName: font,
                NSForegroundColorAttributeName:foregroundColor
                };
    return result;
}

+ (NSDictionary *)drawingAttributesWithFont:(UIFont *)font foregroundColor:(UIColor *)foregroundColor lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment paragraphSpacingAfter:(CGFloat)paragraphSpacingAfter {
    NSDictionary *result;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = lineBreakMode;
    paragraphStyle.alignment = alignment;
    paragraphStyle.paragraphSpacing = paragraphSpacingAfter;
    result = @{ NSFontAttributeName: font,
                NSForegroundColorAttributeName:foregroundColor,
                NSParagraphStyleAttributeName:paragraphStyle
                };
    return result;
}

+ (void)addUnderlineForAttributedString:(NSMutableAttributedString *)attributedString underlineStyle:(NSUnderlineStyle)underlineStyle underlineColor:(UIColor *)underlineColor range:(NSRange)range {
    NSDictionary *underlineAttributes = @{NSUnderlineStyleAttributeName : @(underlineStyle),NSUnderlineColorAttributeName : underlineColor};
    [attributedString setAttributes:underlineAttributes range:range];
}


@end
