//
//  DCUtils.m
//  DreamCatcher
//
//  Created by Aneesh on 15/01/14.
//  Copyright (c) 2014 Ammini Inc. All rights reserved.
//

#import "DCUtils.h"

@implementation DCUtils

+(NSString*)getFileName:(NSString*)parentFolderName withExtension:(NSString*)fileExtension{

    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [dirPaths objectAtIndex:0];
    NSString *timeStamp=[DCUtils getTimeStamp];
    NSString *fileName=@"";
    if (parentFolderName) {
        fileName = [NSString stringWithFormat:@"%@/%@/%@%@",
                    documentsDirectory,parentFolderName,timeStamp,fileExtension];
    }
    else{
        fileName = [NSString stringWithFormat:@"%@/%@%@",
                    documentsDirectory,timeStamp,fileExtension];
    }
    return fileName;
}
+(NSString*)getTimeStamp{
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyyMMddHHMMSS"];
    NSString* timeStamp = [formatter stringFromDate:date];
    return timeStamp;
}

@end

