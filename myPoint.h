//
//  myPoint.h
//  myDraw
//
//  Created by andrew hazlett on 1/10/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myPoint : NSObject {
    NSPoint myNSPoint;
}
- (id) initWithNSPoint:(NSPoint)pNSPoint;
- (NSPoint) myNSPoint;
- (float)x;
- (float)y;

@end
