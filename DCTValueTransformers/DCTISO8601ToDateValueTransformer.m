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

- (id)transformedValue:(NSString *)value {
	if (!value || [value isKindOfClass:[NSNull class]]) return nil;
	return [[[self class] dateFormatter] dateFromString:value];
}

- (id)reverseTransformedValue:(NSDate *)value {
	if (!value || [value isKindOfClass:[NSNull class]]) return nil;
	return [[[self class] dateFormatter] stringFromDate:value];
}

@end
