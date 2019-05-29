//
//  YAObjectCheck.m
//  Pods-YABasicFoundation_Example
//
//  Created by 郦道元  on 2017/12/13.
//

#import "YAObjectCheck.h"

@implementation YAObjectCheck


+(BOOL)isEmpty:(id)obj
{
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return YES;
    } else if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        
        NSString *trimStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([trimStr isEqualToString:@""] || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"] || [str isEqualToString:@"<nil>"]) {
            return YES;
        }
    } else if ([obj respondsToSelector:@selector(length)]
               && [(NSData *)obj length] == 0) {
        return YES;
    } else if ([obj respondsToSelector:@selector(count)]
               && [(NSArray *)obj count] == 0) {
        return YES;
    }
    return NO;
    
}
@end
