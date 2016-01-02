//
//  main.m
//  count_code_lines_of_a_folder
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 考察NSString和NSArray的使用
 * NSFileManager
 */

// 计算单个文件的代码行数
NSUInteger countCodeLineOfAFile(NSString* path)
{
    // 获得文件管理者
    NSFileManager* fm = [NSFileManager defaultManager];

    // 判断path是文件夹路径还是文件路径
    BOOL dir = NO; // 标记是否为文件夹，yes表示是，no表示不是
    BOOL exit = [fm fileExistsAtPath:path isDirectory:&dir]; // 判断路径是否正确，并判断是否为文件夹

    NSUInteger count = 0;
    if(!exit){
        NSLog(@"path does not exit");
        return 0;
    }

    if(dir){ // 文件夹
        // NSLog(@"this is a folder");
        NSArray* array = [fm contentsOfDirectoryAtPath:path error:nil]; // 装着当前文件夹下的所有内容
        // 遍历数组中的文件和文件夹
        for(NSString* subpath in array){
            NSString* fullpath = [NSString stringWithFormat:@"%@/%@", path, subpath];

            count += countCodeLineOfAFile(fullpath);
        }
        // NSLog(@"%@", array);
    }else{ // 文件
        // NSLog(@"this is a file");

        NSString* extension = [[path pathExtension] lowercaseString]; // 获取文件拓展名并转化成小写
        if([extension isEqualToString:@"h"] ||
           [extension isEqualToString:@"m"] ||
           [extension isEqualToString:@"c"]){

            // 加载文件内容
            NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            // 以\n分割字符串并存入一个字符串数组中，并返回该数组
            NSArray* array = [content componentsSeparatedByString:@"\n"];
            count =  [array count];

            NSLog(@"%@ -- %lu", path, count);
        }else{
            count = 0;
        }
    }
    return count;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"total:%lu", countCodeLineOfAFile(@"/Users/jon/ios_dev/Dec_29"));
    }
    return 0;
}
