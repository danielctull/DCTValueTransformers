//
//  DCTISO8601ToDateValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTISO8601ToDateValueTransformer.h"

@implementation DCTISO8601ToDateValueTransformer

+ (NSDateFormatter *)dateFormatter {
	static NSDateFormatter *dateFormatter;
	static dispatch_once_t dateFormatterToken;
	dispatch_once(&dateFormatterToken, ^{
		dateFormatter = [[NSDateFormatter alloc] init];
		dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
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
	return [[[self class] dateFormatter] dateFromString:value];

}

- (id)reverseTransformedValue:(id)value {
    return [[[self class] dateFormatter] stringFromDate:value];
}

@end
