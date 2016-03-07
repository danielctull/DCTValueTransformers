//
//  DCTStringToURLValueTransformer.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 07/03/2016.
//  Copyright © 2016 Daniel Tull. All rights reserved.
//

#import "DCTStringToURLValueTransformer.h"
#import "NSValueTransformer+DCTValueTransformers.h"

@implementation DCTStringToURLValueTransformer

+ (Class)transformedValueClass {
	return [NSURL class];
}

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)transformedValue:(id)value {

	if (![value isKindOfClass:[NSString class]]) {
		return nil;
	}

	return [NSURL URLWithString:value];
}

- (id)reverseTransformedValue:(id)value {

	if (![value isKindOfClass:[NSURL class]]) {
		return value;
	}

	NSURL *URL = value;
	return URL.absoluteString;
}

@end
