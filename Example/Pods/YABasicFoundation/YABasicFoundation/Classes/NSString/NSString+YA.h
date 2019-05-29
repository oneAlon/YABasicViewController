//
//  NSString+YA.h
//  YABasicFoundation
//
//  Created by OneAlon on 2017/12/5.
//

#import <Foundation/Foundation.h>

@interface NSString (YA)

#pragma mark - Json
// 转换成Json字典
- (id)ya_jsonValue;

// url参数转换成Json字典
- (id)ya_urlConvertJson;

// 将URL参数转换成字典
- (NSDictionary *)ya_urlConvertDictionary;

#pragma mark - BOOL
// 是否包含指定字符串
- (BOOL)ya_contains:(NSString *)string;

// 是否以某字符串结尾
// caseInsensitive 不区分大小写
- (BOOL)ya_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive;

// 判断字符串是否为空或者长度为0
- (BOOL)ya_nilOrEmpty;

// 验证邮箱格式
- (BOOL)ya_validEmail;

// 验证电话格式
- (BOOL)ya_validMobile;

// 验证手机格式
- (BOOL)ya_validFixPhone;

// 验证身份证格式
- (BOOL)ya_validIDCard;

// 是否全部是数字
- (BOOL)ya_allNumbers;

// 是否全部为数字，且可以包含小数点
- (BOOL)ya_allDecimalDigit;

// 是否包含中文 英文 数字 下划线
- (BOOL)ya_validContainsChiEng;

// 是否包含英文 数字
- (BOOL)ya_validContainsNumEng;

// 是否包含中文
- (BOOL)ya_hasChinese;

// 是否为图片链接
- (BOOL)ya_imageURLString;

// 是否为JavaScript文件链接
- (BOOL)ya_javascriptURLString;

// 是否为URL链接
- (BOOL)ya_urlString;

// 是否包含emoji表情
- (BOOL)ya_containsEmoji;

// 去除两端空格
- (NSString *)ya_stringByTrim;
// url编码(百分号)
-(NSString *)ya_stringByURLEncoding;

//文本单行宽度
- (CGFloat)ya_widthForFont:(UIFont *)font;

//文本高度
- (CGFloat)ya_heightForFont:(UIFont *)font width:(CGFloat)width;
//文本size
- (CGSize)ya_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
@end
