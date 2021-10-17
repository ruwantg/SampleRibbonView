//
//  ViewController.m
//  SampleRibbonView
//
//  Created by Ruwan Thalgahage on 2021-10-14.
//

#import "ViewController.h"

#define highlight_ribbon_view_width 492
#define highlight_edit_view_width 350

@interface ViewController ()

@property(nonatomic, strong) AnnotationRibbonView *annotationRibbonView;

@end


@implementation ViewController

@synthesize annotationRibbonView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self showHighlightView];
    [self showHighlightEditView];
}

- (void)showHighlightView {
    //add ribbon view
    CGRect frame = CGRectMake([self screenSize].width - highlight_ribbon_view_width, 50, highlight_ribbon_view_width, 60);
    //[Util screenSize].width
    self.annotationRibbonView = [[AnnotationRibbonView alloc]initWithFrame: frame];
//    self.annotationRibbonView.delegate = self;
    
    
    CGRect tempBottomFrame = annotationRibbonView.frame;
    CGRect napkinBottomFrame = annotationRibbonView.frame;
    tempBottomFrame.origin.x = [self screenSize].width;
    [self.annotationRibbonView setFrame:tempBottomFrame];
    napkinBottomFrame.origin.x = [self screenSize].width-highlight_ribbon_view_width;
    [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ annotationRibbonView.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
    
    
    [self.view addSubview:annotationRibbonView];
}

- (void)showHighlightEditView {
    //add ribbon view
    CGRect frame = CGRectMake([self screenSize].width - highlight_edit_view_width, 50, highlight_edit_view_width, 60);
    //[Util screenSize].width
    self.annotationRibbonView = [[AnnotationRibbonView alloc]initWithFrame: frame];
//    self.annotationRibbonView.delegate = self;
    
    
    CGRect tempBottomFrame = annotationRibbonView.frame;
    CGRect napkinBottomFrame = annotationRibbonView.frame;
    tempBottomFrame.origin.x = [self screenSize].width;
    [self.annotationRibbonView setFrame:tempBottomFrame];
    napkinBottomFrame.origin.x = [self screenSize].width-highlight_edit_view_width;
    [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ annotationRibbonView.frame = napkinBottomFrame; } completion:^(BOOL finished){/*done*/}];
    
    
    [self.view addSubview:annotationRibbonView];
}

- (CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
        if (orientation == UIDeviceOrientationFaceUp || orientation == UIDeviceOrientationFaceDown || orientation == UIDeviceOrientationUnknown) {
            orientation = [[UIApplication sharedApplication]statusBarOrientation];
        }
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape(orientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


@end
