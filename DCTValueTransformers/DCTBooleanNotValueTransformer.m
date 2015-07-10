
#import "DCTBooleanNotValueTransformer.h"

@implementation DCTBooleanNotValueTransformer

+ (Class)transformedValueClass {
	return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSNumber class]]) {
		return value;
	}

	NSNumber *number = value;
	BOOL boolean = [number boolValue];
	return @(!boolean);
}

- (id)reverseTransformedValue:(id)value {
	return [self transformedValue:value];
}

@end
