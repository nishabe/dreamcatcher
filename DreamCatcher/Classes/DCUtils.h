//
//  DCUtils.h
//  DreamCatcher
//
//  Created by Aneesh on 15/01/14.
//  Copyright (c) 2014 Ammini Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCUtils : NSObject
+(NSString*)getFileName:(NSString*)parentFolderName withExtension:(NSString*)fileExtension;
+(NSString*)getTimeStamp;

@end
