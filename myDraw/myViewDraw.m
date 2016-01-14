//
//  myViewDraw.m
//  myDraw
//
//  Created by andrew hazlett on 1/10/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "myViewDraw.h"

@implementation myViewDraw

@synthesize myMutaryOfBrushStrokes,myMutaryOfPoints;

- (id) init {
    if (self = [super init]) {
        //custom init
        NSLog(@"init");
    }
    return self;
}

-(void)mouseDown:(NSEvent *)pTheEvent {
    
    if (!myMutaryOfPoints) {
        myMutaryOfPoints = [[NSMutableArray alloc]init];
    }
    
    [myMutaryOfBrushStrokes addObject:myMutaryOfPoints];
    
    NSPoint tvarMousePointInWindow = [pTheEvent locationInWindow];
    NSPoint tvarMousePointInView   = [self convertPoint:tvarMousePointInWindow fromView:nil];
    myPoint * tvarMyPointObj       = [[myPoint alloc]initWithNSPoint:tvarMousePointInView];
    
    [myMutaryOfPoints addObject:tvarMyPointObj];
   //  NSLog(@"myMutaryOfPoints:%@",myMutaryOfPoints);
} // end mouseDown

-(void)mouseDragged:(NSEvent *)pTheEvent {
    
    NSPoint tvarMousePointInWindow = [pTheEvent locationInWindow];
    NSPoint tvarMousePointInView   = [self convertPoint:tvarMousePointInWindow fromView:nil];
    myPoint * tvarMyPointObj       = [[myPoint alloc]initWithNSPoint:tvarMousePointInView];
    
    [myMutaryOfPoints addObject:tvarMyPointObj];
    
    [self setNeedsDisplay:YES];
    
   // NSLog(@"myMutaryOfPoints:%@",myMutaryOfPoints);

    
} // end mouseDragged

-(void)mouseUp:(NSEvent *)pTheEvent {
    
    NSPoint tvarMousePointInWindow = [pTheEvent locationInWindow];
    NSPoint tvarMousePointInView   = [self convertPoint:tvarMousePointInWindow fromView:nil];
    myPoint * tvarMyPointObj       = [[myPoint alloc]initWithNSPoint:tvarMousePointInView];
    
    [myMutaryOfPoints addObject:tvarMyPointObj];
    
    [self setNeedsDisplay:YES];
    
 //   NSPoint *locationData = (__bridge NSPoint *)([myMutaryOfPoints objectAtIndex:0]);
    
    NSLog(@"myMutaryOfPoints:%lu",(unsigned long)myMutaryOfPoints.count);
   // NSLog(@"myMutaryOfPoints:%f - %f",tvarMyPointObj.x,tvarMyPointObj.y);
    
   //  NSLog(@"myMutaryOfPoints:%f",[myMutaryOfPoints[0] x]);

} // end mouseUp

- (void)drawRect:(NSRect)pNSRect {
    // colour the background white
    [[NSColor blackColor] set];		// this is Cocoa
    NSRectFill( pNSRect );
    
    for (int i = 0; i < myMutaryOfPoints.count; i++) {
        
        // setup basic size and color properties
        float dm = 25;
        float rd = dm * 0.50;
        //   float qt = dm * 0.25;
        
        NSColor * white = [NSColor whiteColor];
     //   NSColor * black = [NSColor blackColor];
        
        NSBezierPath *path1;
        
        // find the center of the view
        float center = [myMutaryOfPoints[i] x];
        float middle = [myMutaryOfPoints[i] y];
        
        // create a rect in the center
        NSPoint origin  = { center - rd, middle - rd };
        NSRect mainOval = { origin.x, origin.y, dm, dm };
        
        // create a oval bezier path using the rect
        path1 = [NSBezierPath bezierPathWithOvalInRect:mainOval];
        [path1 setLineWidth:2.18];
        
        // draw the path
        [white set];[path1 fill];	
       // [black set];[path1 stroke];
    
    //     NSRect myWhitePoint = NSMakeRect([myMutaryOfPoints[i] x], [myMutaryOfPoints[i] y], 10, 10);
    //    [[NSColor blueColor] set];
    //    NSRectFill(myWhitePoint);
    }
} // end drawRect
@end