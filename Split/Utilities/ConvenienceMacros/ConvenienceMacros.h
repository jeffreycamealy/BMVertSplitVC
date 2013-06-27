//
//  ConvenienceMacros.h
//  DRYV
//
//  Created by Jeffrey Camealy on 5/13/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#ifndef ConvenienceMacros_h
#define ConvenienceMacros_h


/**
 * creates a formatted string
 * usage: str(@"My number:%i", 5);
 */
#define str(...) [NSString stringWithFormat:__VA_ARGS__]

#define strInt(num) str(@"%i", num)
#define strDbl(num) str(@"%f", num)

/**
 * creates a local variable named varname of type cls
 * usage: local(NSArray, myArray)
 * int count = myArray.count;
 */
#define local(cls, varname) cls *varname = [cls new]

/**
 * creates a local "weakSelf" variable
 * usage: @createWeakSelf
 */
#define createWeakSelf try {} @finally {} __weak typeof(self) weakSelf = self;

/**
 * Creates a predicate with format
 * Usage: predicate(@"val == %@", myVal);
 */
#define predicate(...) [NSPredicate predicateWithFormat:__VA_ARGS__]

/**
 * Encapsulates common `for` loop form
 * 
 * Usage:
 *   for(range(i,5)) {
 *     NSLog(@"index:%i", i);
 *   }
 */
#define forRange(i, max) for (int i = 0; i < max; i++)

#define pt(x, y) CGPointMake(x,y)

#define inRange(num1, x, num2) (x >= num1 && x <= num2)

#define url(urlString) [NSURL URLWithString:urlString]

#define img(imgName) [UIImage imageNamed:imgName]

#endif
