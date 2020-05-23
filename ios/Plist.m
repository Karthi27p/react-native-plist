#import "Plist.h"


@implementation Plist

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(createPlist, plistName:(NSString *)plistName createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if (![fileManager fileExistsAtPath: path]) {
        
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        [data writeToFile:path atomically:YES];
        [event setValue:path forKey:@"plistPath"];
        resolve(event);
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"A plist already exits with the same name"
                                         }];
        reject(@"A plist already exits with the same name", @"A plist already exits with the same name", error);
    }
    
    
}

RCT_REMAP_METHOD(getDataFromPlist, plistName:(NSString *)plistName key:(NSString *)key createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    
    if (![fileManager fileExistsAtPath: path]) {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
        
    } else {
        NSMutableDictionary *savedValue = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
        NSString *value = [savedValue objectForKey:key];
        [event setValue:value forKey:@"Value"];
        if (value.length > 0) {
            resolve(event);
        } else {
            NSError *error = [NSError errorWithDomain:@"value_not_found"
                                                 code:100
                                             userInfo:@{
                                                 NSLocalizedDescriptionKey:@"Requested key doesn't exist"
                                             }];
            
            reject(@"key Doesn't exist", @"Requested value for key doesn't exist", error);
        }
        
    }
    
}

RCT_REMAP_METHOD(updatePlistWithString, plistName:(NSString *)plistName key:(NSString *)key withStringType:(NSString *)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:value forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithNumber, plistName:(NSString *)plistName key:(NSString *)key withNumberType:(int)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:[NSNumber numberWithInt:value] forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithBool, plistName:(NSString *)plistName key:(NSString *)key withBoolType:(BOOL)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:@(value) forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithDate, plistName:(NSString *)plistName key:(NSString *)key withDateType:(NSDate *)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:value forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithArray, plistName:(NSString *)plistName key:(NSString *)key withArrayType:(NSArray *)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:value forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithDictionary, plistName:(NSString *)plistName key:(NSString *)key withDictionaryType:(NSDictionary *)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:value forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

RCT_REMAP_METHOD(updatePlistWithData, plistName:(NSString *)plistName key:(NSString *)key withDataType:(NSData *)value createPlistEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath]; //Path of your bundle
    NSString *path = [bundlePath stringByAppendingPathComponent:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    if ([fileManager fileExistsAtPath: path]) {
        
        if ([key length] > 0 && value) {
            NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            [data setObject:value forKey:key];
            [data writeToFile:path atomically:YES];
            [event setValue:path forKey:@"plistPath"];
            resolve(event);
        }
        
    } else {
        NSError *error = [NSError errorWithDomain:@"plist_not_found"
                                             code:100
                                         userInfo:@{
                                             NSLocalizedDescriptionKey:@"Requested plist doesn't exist"
                                         }];
        
        reject(@"plist Doesn't exist", @"Requested plist doesn't exist", error);
    }
    
}

@end





