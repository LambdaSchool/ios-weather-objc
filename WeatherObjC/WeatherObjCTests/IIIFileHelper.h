//
//  IIIFileHelper.h
//  WeatherObjC
//
//  Created by Gi Pyo Kim on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NSData *loadFile(NSString *filename, NSBundle *bundle) {
    NSString *basename = [filename stringByDeletingPathExtension];
    NSString *extension = [filename pathExtension];
    
    NSString *path = [bundle pathForResource:basename ofType:extension];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
