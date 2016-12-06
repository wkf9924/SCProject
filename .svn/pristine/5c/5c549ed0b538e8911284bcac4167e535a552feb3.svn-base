//
//  NSString+Utlity.m
//  eDiancheDriver
//
//  Created by Mars on 13-5-9.
//  Copyright (c) 2013年 SKTLab. All rights reserved.
//

#import "NSString+Utlity.h"
#import "AppConfigure.h"

//#import "UIFunction.h"
@implementation NSString (Utlity)

+ (BOOL) isEmptyString:(NSString *)string {
    return (string == nil || [string isEqualToString:@""]);
}

+ (BOOL) isEmptyString:(NSString *)string WithPromptString:(NSString*) promptString{
    BOOL returnValue = (string == nil || [string isEqualToString:@""]);
    if (returnValue) {
//        [UIFunction showAlertWithMessage:promptString];
    }
    return returnValue;
}

// validate email
+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// validate Plate
+ (BOOL)isValidatePlate:(NSString *) plate {
    NSString *plateRegex = @"[\u4e00-\u9fa5][a-zA-Z0-9]+";
    NSPredicate *plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", plateRegex];
    return [plateTest evaluateWithObject:plate];
}

+ (BOOL) isValidateName:(NSString *) name{
    NSString *nameRegex = @"[\u4e00-\u9fa5a-zA-Z0-9]+";
    NSPredicate *plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [plateTest evaluateWithObject:name];
}

+ (BOOL) isValidatePass:(NSString *) name{
    NSString *nameRegex = @"[a-zA-Z0-9]+";
    NSPredicate *plateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [plateTest evaluateWithObject:name];
}


//是否韩哟表情符号
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {

         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }

         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];

    return returnValue;
}

+ (BOOL) checkPlateNumberStringFormat:(NSString *) plateNumber{
    //  车牌号不能为空
    if ([NSString isEmptyString:plateNumber]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PLATE_NUMBER_FELID_NOT_NULL")];
        return NO;
    }
    //  车牌号不能大于20位
    NSInteger vehicleNumberLength = [plateNumber length];
    if (vehicleNumberLength > 20) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PLATE_NUMBER_LIMIT")];
        return NO;
    }
    //  车牌不能包含表情符号
    if ([NSString stringContainsEmoji:plateNumber]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PLATE_NUMBER_CONTAIN_EMOJI")];
        return NO;
    }

    if (![NSString isValidatePlate:plateNumber]) {
//        [UIFunction showAlertWithMessage:@"车牌号仅限字母数字和汉字，例如:陕AT8888。"];
        return NO;
    }
    return YES;
}

//判断手机号
+ (BOOL) checkPhoneNumberStringFormat:(NSString *) phoneNumber{
    // 手机号不能为空
    if ([NSString isEmptyString:phoneNumber]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PHONE_FELID_NOT_NULL")];
        return NO;
    }
    // 手机号码格式不符
    NSUInteger phoneLength = [phoneNumber length];
    if (phoneLength != 11) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PROMPT_PHONE_FORMAT")];
        return NO;
    }
    return YES;
}

+ (BOOL) checkPasswordStringFormat:(NSString*) password ConfrimPassword:(NSString *)confrimPassword {
    // 密码不能为空
    if ([NSString isEmptyString:password]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PASSWORD_FELID_NOT_NULL")];
        return NO;
    }
    // 确认密码不能为空
    if ([NSString isEmptyString:confrimPassword]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PASSWORDREPEAT_FELID_NOT_NULL")];
        return NO;
    }
    // 密码不匹配
    if (![password isEqualToString:confrimPassword]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PASSWORD_NOT_MATCH")];
        return NO;
    }
    // 密码不得大于20位
    NSUInteger passLength = [password length];
    if (passLength > 20) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PROMPT_PASS_FORMAT_BIG")];
        return NO;
    }
    // 密码不得小于6位
    if (passLength < 6) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PROMPT_PASS_FORMAT_SAMLL")];
        return NO;
    }
    //  密码不能包含表情符号
    if ([NSString stringContainsEmoji:password]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PASSWORD_CONTAIN_EMOJI")];
        return NO;
    }
    if (![NSString isValidatePass:password]) {
//        [UIFunction showAlertWithMessage:@"密码仅限字母和数字"];
        return NO;
    }
    return YES;
}

+ (BOOL) checkNameStringFormat:(NSString *) nameString{
    // 姓名不得为空
    if ([NSString isEmptyString:nameString]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"PROMPT_NAME_NOT_NULL")];
        return  NO;
    }
    // 姓名不能大于20位
    NSInteger nameLength = [nameString length];
    if (nameLength > 20) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"NAME_LENGHT_LIMIT")];
        return NO;
    }
    //  姓名不能包含表情符号
    if ([NSString stringContainsEmoji:nameString]) {
//        [UIFunction showAlertWithMessage:LOCALIZED_STRING(@"NAME_CONTAIN_EMOJI")];
        return NO;
    }
    if (![NSString isValidateName:nameString]) {
//        [UIFunction showAlertWithMessage:@"姓名仅限字母数字和汉字"];
        return NO;
    }
    return YES;
}

- (void) callPhoneNumber {
    NSString *phoneNumber = self;
    NSString *telUrl = [NSString stringWithFormat:@"telprompt:%@",phoneNumber];

    NSURL *url = [[NSURL alloc] initWithString:telUrl];
    [[UIApplication sharedApplication] openURL:url];
}

+ (NSString *) turnToStringWithObejct:(id) object {
    NSString *turnString = nil;
    if ([object respondsToSelector:@selector(stringValue)]) {
        turnString = [object stringValue];
    }else {
        turnString = object;
    }
    return turnString;
}

@end
