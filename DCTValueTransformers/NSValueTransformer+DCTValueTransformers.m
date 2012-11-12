//
//  NSValueTransformer+DCTValueTransformers.m
//  DCTValueTransformers
//
//  Created by Daniel Tull on 12/11/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "NSValueTransformer+DCTValueTransformers.h"

@implementation NSValueTransformer (DCTValueTransformers)

+ (instancetype)dct_transformer {
	return [NSValueTransformer valueTransformerForName:[self dct_name]];
}

+ (NSString *)dct_name {
	return NSStringFromClass([self class]);
}

@end
