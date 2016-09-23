//
//  DCTISO8601ToDateValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTISO8601ToDateValueTransformer.h"

@implementation DCTISO8601ToDateValueTransformer

+ (NSISO8601DateFormatter *)RFC3399Formatter {
	static NSISO8601DateFormatter *RFC3399Formatter;
	static dispatch_once_t RFC3399FormatterToken;
	dispatch_once(&RFC3399FormatterToken, ^{
		RFC3399Formatter = [NSISO8601DateFormatter new];
		RFC3399Formatter.formatOptions =  NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone;
	});
	return RFC3399Formatter;
}


+ (NSISO8601DateFormatter *)dateFormatter {
	static NSISO8601DateFormatter *dateFormatter;
	static dispatch_once_t dateFormatterToken;
	dispatch_once(&dateFormatterToken, ^{
		dateFormatter = [NSISO8601DateFormatter new];
		dateFormatter.formatOptions =  NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone | NSISO8601DateFormatWithSpaceBetweenDateAndTime;
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

	NSDate *date = [[[self class] RFC3399Formatter] dateFromString:value];
	if (date) {
		return date;
	}

	date = [[[self class] dateFormatter] dateFromString:value];
	return date;
}

- (id)reverseTransformedValue:(id)value {

	if (![value isKindOfClass:[NSDate class]]) {
		return nil;
	}

	return [[[self class] dateFormatter] stringFromDate:value];
}

@end
