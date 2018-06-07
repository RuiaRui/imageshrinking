//
//  ViewController.m
//  homework7
//
//  Created by Yuan Ren on 22/05/2018.
//  Copyright © 2018 ry. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self enableGestureOnView:self.imageView];
    
}

- (void)enableGestureOnView:(UIView *)view{
    [view setUserInteractionEnabled:YES];
    // create and configure the pinch gesture
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureDetected:)];
    [pinchGestureRecognizer setDelegate:self];
    [view addGestureRecognizer:pinchGestureRecognizer];
   
    
    // create and configure the rotation gesture
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureDetected:)];
    [rotationGestureRecognizer setDelegate:self];
    [view addGestureRecognizer:rotationGestureRecognizer];

    // creat and configure the pan gesture
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureDetected:)];
    [panGestureRecognizer setDelegate:self];
    [view addGestureRecognizer:panGestureRecognizer];
    
}

- (void)pinchGestureDetected:(UIPinchGestureRecognizer *)recognizer
{
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat scale = [recognizer scale];
        [recognizer.view setTransform:CGAffineTransformScale(recognizer.view.transform, scale, scale)];
        [recognizer setScale:1.0];
    }
}

- (void)rotationGestureDetected:(UIRotationGestureRecognizer *)recognizer
{
    UIGestureRecognizerState state = [recognizer state];

    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat rotation = [recognizer rotation];
        [recognizer.view setTransform:CGAffineTransformRotate(recognizer.view.transform, rotation)];
        [recognizer setRotation:0];
    }
}

- (void)panGestureDetected:(UIPanGestureRecognizer *)recognizer
{
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [recognizer translationInView:recognizer.view];
        [recognizer.view setTransform:CGAffineTransformTranslate(recognizer.view.transform, translation.x, translation.y)];
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
    }
}


//重写方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
@end
