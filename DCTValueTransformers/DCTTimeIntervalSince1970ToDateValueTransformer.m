//
//  DCTTimeIntervalSince1970ToDateValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTTimeIntervalSince1970ToDateValueTransformer.h"
#import "DCTStringToNumberValueTransformer.h"
#import "NSValueTransformer+DCTValueTransformers.h"

@implementation DCTTimeIntervalSince1970ToDateValueTransformer

+ (Class)transformedValueClass {
	return [NSDate class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if ([value isKindOfClass:[NSString class]]) {
		DCTStringToNumberValueTransformer *transformer = [DCTStringToNumberValueTransformer dct_transformer];
		value = [transformer transformedValue:value];
	}

	if (![value isKindOfClass:[NSNumber class]]) {
		return nil;
	}

	return [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];

}

- (id)reverseTransformedValue:(id)value {

	if (![value isKindOfClass:[NSDate class]]) return nil;

    return @([value timeIntervalSince1970]);
}

@end
