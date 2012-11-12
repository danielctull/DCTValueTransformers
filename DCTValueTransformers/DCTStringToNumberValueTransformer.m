//
//  DCTStringToNumberValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTStringToNumberValueTransformer.h"
#import "DCTNumberToStringValueTransformer.h"

@implementation DCTStringToNumberValueTransformer

+ (Class)transformedValueClass {
	return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(NSString *)value {

	static NSNumberFormatter *numberFormatter;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		numberFormatter = [NSNumberFormatter new];
	});

	return [numberFormatter numberFromString:value];
}

- (id)reverseTransformedValue:(id)value {
	DCTNumberToStringValueTransformer *transformer = [DCTNumberToStringValueTransformer dct_transformer];
	return [transformer transformedValue:value];
}

@end
