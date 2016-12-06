//
//  NSString+Utlity.h
//  eDiancheDriver
//
//  Created by Mars on 13-5-9.
//  Copyright (c) 2013年 SKTLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utlity)

+ (BOOL) isEmptyString:(NSString *)string;
+ (BOOL) isEmptyString:(NSString *)string WithPromptString:(NSString*) promptString;

+ (BOOL)isValidateEmail:(NSString *)email;

+ (BOOL)stringContainsEmoji:(NSString *)string;

+ (BOOL) checkPlateNumberStringFormat:(NSString *) plateNumber;
+ (BOOL) checkPhoneNumberStringFormat:(NSString *) phoneNumber;
+ (BOOL) checkPasswordStringFormat:(NSString*) password ConfrimPassword:(NSString *)confrimPassword;
+ (BOOL) checkNameStringFormat:(NSString *) nameString;

- (void) callPhoneNumber;

+ (NSString *) turnToStringWithObejct:(id) object;

@end
