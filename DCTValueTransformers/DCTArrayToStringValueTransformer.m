//
//  DCTArrayToStringValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 04.02.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "DCTArrayToStringValueTransformer.h"

@implementation DCTArrayToStringValueTransformer

+ (Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSArray class]]) {
		return value;
	}

	return [value componentsJoinedByString:@","];
}

- (id)reverseTransformedValue:(id)value {

	if (![value isKindOfClass:[NSString class]]) {
		return value;
	}

	return [value componentsSeparatedByString:@","];
}

@end
