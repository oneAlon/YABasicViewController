//
//  NSString+YA.m
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import "NSString+YA.h"

@implementation NSString (YA)

- (id)ya_jsonValue
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data.length) {
        NSError *error = nil;
        id jsonValue = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        return jsonValue ? jsonValue : nil;
    }
    
    return nil;
}

- (id)ya_urlConvertJson
{
    NSString * jsonValue = [self stringByReplacingOccurrencesOfString:@"&" withString:@"\",\""];
    jsonValue = [jsonValue stringByReplacingOccurrencesOfString:@"=" withString:@"\":\""];
    jsonValue = [NSString stringWithFormat:@"%@%@%@",@"{\"",jsonValue,@"\"}"];
    
    return [jsonValue ya_jsonValue];
}

- (NSDictionary *)ya_urlConvertDictionary
{
    if (self.length) {
        NSString *parameterString =  [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSArray<NSString *> *pramaArray = [parameterString componentsSeparatedByString:@"&"];
        NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
        for (NSString *parameter in pramaArray) {
            NSArray<NSString *> *array = [parameter componentsSeparatedByString:@"="];
            NSString *key = array.firstObject;
            NSString *valueStr = array.lastObject;
            id value = valueStr;
            if (([valueStr hasPrefix:@"{"] && [valueStr hasSuffix:@"}"]) ||
                ([valueStr hasPrefix:@"["] && [valueStr hasSuffix:@"]"])) {
                NSData *data = [valueStr dataUsingEncoding:NSUTF8StringEncoding];
                value = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            }
            resultDic[key] = value;
        }
        return [NSDictionary dictionaryWithDictionary:resultDic];
    }
    return nil;
}

- (BOOL)ya_contains:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    
    return range.location != NSNotFound;
}

// 是否以某字符串结尾
- (BOOL)ya_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive
{
    NSRange range;
    if (caseInsensitive) {
        range = [self rangeOfString:endString options:NSCaseInsensitiveSearch];
    } else {
        range = [self rangeOfString:endString];
    }
    
    if (range.location != NSNotFound
        && (range.location + range.length) == self.length) {
        return YES;
    }
    return NO;
}

- (BOOL)ya_nilOrEmpty
{
    return (self == nil || [self length] == 0 || [self isEqualToString:@""]);
}

- (BOOL)ya_validEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)ya_validMobile
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{11}'"];
    return [predicate evaluateWithObject:self];
}

- (BOOL)ya_validFixPhone
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{10,12}'"];
    return [predicate evaluateWithObject:self];
}

- (BOOL)ya_validIDCard
{
    NSString *cardRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cardRegex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)ya_allNumbers
{
    if (self.length < 1) {
        return NO;
    }
    
    for (int i = 0; i < self.length; i++) {
        if (!isnumber([self characterAtIndex:i])) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)ya_allDecimalDigit
{
    if (self.length < 1) {
        return NO;
    }
    
    NSString *tmp = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(tmp.length == 0 || [tmp isEqualToString:@"."])
    {
        return YES;
    }
    return NO;
}

- (BOOL)ya_validContainsChiEng
{
    NSString * regex = @"^[\u4e00-\u9fa5A-Za-z0-9_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)ya_validContainsNumEng
{
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)ya_hasChinese {
    for (int i = 0; i < self.length; i++) {
        NSString *temp = [self substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (u8Temp != nil &&          //如果u8Temp为nil，会导致crash
            3 == strlen(u8Temp)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)ya_imageURLString
{
    if ([self hasSuffix:@".png"] || [self hasSuffix:@".jpg"] || [self hasSuffix:@".jpeg"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)ya_javascriptURLString
{
    NSString *hostStr = [[self componentsSeparatedByString:@"?"] firstObject];
    if ([hostStr hasSuffix:@".js"] && ![hostStr hasSuffix:@"indexPageFile.js"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)ya_urlString
{
    if ([self ya_contains:@"http://"] || [self ya_contains:@"https://"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)ya_containsEmoji
{
    __block BOOL result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring ya_isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

- (BOOL)ya_isEmoji
{
    const unichar high = [self characterAtIndex: 0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}


- (NSString *)ya_stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

-(NSString *)ya_stringByURLEncoding
{
     return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (CGFloat)ya_widthForFont:(UIFont *)font {
    CGSize size = [self ya_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return ceilf(size.width);
}

- (CGFloat)ya_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self ya_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return   ceilf(size.height);
}


- (CGSize)ya_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}






@end
