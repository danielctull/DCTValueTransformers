
#import "DCTColorValueTransformer.h"

#if TARGET_OS_IPHONE
@import UIKit;
typedef UIColor DCTColorValueTransformerColor;
#else
@import AppKit;
typedef NSColor DCTColorValueTransformerColor;
#endif

@implementation DCTColorValueTransformer

+ (Class)transformedValueClass {
	return [DCTColorValueTransformerColor class];
}

+ (BOOL)allowsReverseTransformation {
	return NO;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSString class]]) return nil;

	NSCharacterSet *allowedCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
	NSString *string = [[value componentsSeparatedByCharactersInSet:allowedCharacters.invertedSet] componentsJoinedByString:@""];

	if (string.length == 6) {
		return [self colorFromHexString:string];
	}

	return [self colorFromName:value];
}

- (DCTColorValueTransformerColor *)colorFromHexString:(NSString *)hexString {

	NSScanner *scanner = [NSScanner scannerWithString:hexString];

	unsigned int color;
	[scanner scanHexInt:&color];

	CGFloat red = ((color & 0xFF0000) >> 16) / 255.0f;
	CGFloat green = ((color & 0x00FF00) >>  8) / 255.0f;
	CGFloat blue = (color & 0x0000FF) / 255.0f;

	return [DCTColorValueTransformerColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (DCTColorValueTransformerColor *)colorFromName:(NSString *)colorName {

	NSDictionary *translations = @{
		@"grey" : @"gray"
	};

	if ([translations.allKeys containsObject:colorName]) {
		colorName = translations[colorName];
	}

	NSString *selectorName = [colorName stringByAppendingString:@"Color"];
	SEL colorSelector = NSSelectorFromString(selectorName);

	if (![DCTColorValueTransformerColor respondsToSelector:colorSelector]) {
		return nil;
	}

#if TARGET_OS_IPHONE
	return [UIColor performSelector:colorSelector];
#else
	return [NSColor performSelector:colorSelector];
#endif
}

@end
