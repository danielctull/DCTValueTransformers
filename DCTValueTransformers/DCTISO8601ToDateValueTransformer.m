//
//  DCTISO8601ToDateValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTISO8601ToDateValueTransformer.h"
#import "ISO8601DateFormatter.h"

@implementation DCTISO8601ToDateValueTransformer

+ (ISO8601DateFormatter *)dateFormatter {
	static ISO8601DateFormatter *dateFormatter;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		dateFormatter = [ISO8601DateFormatter new];
	});
	return dateFormatter;
}

+ (Class)transformedValueClass {
	return [NSDate class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSString class]]) {
		return nil;
	}

	return [[[self class] dateFormatter] dateFromString:value];
}

- (id)reverseTransformedValue:(id)value {

	if (![value isKindOfClass:[NSDate class]]) {
		return nil;
	}

	return [[[self class] dateFormatter] stringFromDate:value];
}

@end
