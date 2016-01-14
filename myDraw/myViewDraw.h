//
//  myViewDraw.h
//  myDraw
//
//  Created by andrew hazlett on 1/10/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "myPoint.h"

@interface myViewDraw : NSView

@property (retain) NSMutableArray  * myMutaryOfBrushStrokes;
@property (retain) NSMutableArray  * myMutaryOfPoints;

- (id) init;

@end