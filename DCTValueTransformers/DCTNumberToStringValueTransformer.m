//
//  DCTNumberToStringValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTNumberToStringValueTransformer.h"
#import "DCTStringToNumberValueTransformer.h"

@implementation DCTNumberToStringValueTransformer

+ (Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSNumber class]]) {
		return value;
	}

	return [value description];
}

- (id)reverseTransformedValue:(id)value {
	DCTStringToNumberValueTransformer *transformer = [DCTStringToNumberValueTransformer dct_transformer];
	return [transformer transformedValue:value];
}

@end
