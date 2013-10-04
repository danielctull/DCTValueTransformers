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

- (id)transformedValue:(NSArray *)value {
	return [value componentsJoinedByString:@","];
}

- (id)reverseTransformedValue:(NSString *)value {
	return [value componentsSeparatedByString:@","];
}

@end
