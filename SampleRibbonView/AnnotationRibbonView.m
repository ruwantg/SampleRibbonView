//
//  AnnotationRibbonView.m
//  SampleRibbonView
//
//  Created by Ruwan Thalgahage on 2021-10-14.
//

#import "AnnotationRibbonView.h"
#import <UIKit/UIKit.h>

@implementation AnnotationRibbonView

@synthesize bgView = _bgView;
@synthesize btnColorPicker = _btnColorPicker;
@synthesize btnCancel = _btnCancel;

@synthesize leftMargin = _leftMargin;
@synthesize viewWidth = _viewWidth;

- (id)initWithFrame: (CGRect)frame {
    self = [super initWithFrame:frame];
    
    _leftMargin = 0;
    _viewWidth = frame.size.width;
    
    // Set Background
    self.bgView = [[UIImageView alloc]initWithFrame: CGRectMake(self.leftMargin + 40, 0,
                                                                self.viewWidth - 40, 68)];
    UIImage* cappedCloud = [[UIImage imageNamed: @"signature_ribbon_bg.png"]
                            resizableImageWithCapInsets: UIEdgeInsetsMake(0, 20, 20, 0)
                            resizingMode: UIImageResizingModeStretch];
    [self.bgView setImage:cappedCloud];
    [self addSubview:self.bgView];
    
    UIImageView *tagViewBg = [[UIImageView alloc]initWithFrame: CGRectMake(self.leftMargin, 0, 50, 54)];
    UIImage* tagViewBgImage = [[UIImage imageNamed: @"signature_ribbon_tag_bg.png"]
                               resizableImageWithCapInsets: UIEdgeInsetsMake(0, 20, 20, 0)
                               resizingMode: UIImageResizingModeStretch];
    [tagViewBg setImage:tagViewBgImage];
    [self addSubview:tagViewBg];
    
    //Create highlight
//    [self createHighlightView];
    
    //Create Highlight Edit
    [self createHighlightEditView];
    
    return self;
}

- (void)createHighlightView {
    // Add highlight tool bar - icon
    [self setToolBarIcon:@"AP_Highlight_navIcon.png"];
    
    // Add info lable
    [self addTextViewInfo: @"Drag your finger over text to highlight."];
    
    // Add color picker Button
    UIButton *btnColorPicker = [self addNewButtonWithX:self.leftMargin+308
                                            title:@"COLOR"
                                            image:@""
                                    isColorPicker:true];
    btnColorPicker.backgroundColor = [UIColor yellowColor];
    [btnColorPicker addTarget: self action:@selector(btnColorPickerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // Add scroll Button
    UIButton *btnScroll = [self addNewButtonWithX:self.leftMargin+360
                                            title:@"SCROLL"
                                            image:@"AP_scrollMode_toolbar.png"
                                    isColorPicker:false];
    [btnScroll addTarget: self action:@selector(btnScrollClicked:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)createHighlightEditView {
    // Add highlight tool bar - icon
    [self setToolBarIcon:@"AP_Highlight_navIcon.png"];
    
    [_btnCancel setTitle:@"DONE" forState:UIControlStateNormal];
}

- (void) setToolBarIcon:(NSString *)icon {
    UIImageView *tagViewIconBg = [[UIImageView alloc]initWithFrame: CGRectMake(self.leftMargin + 14, 2, 32, 32)];
    UIImage* tagViewIconImage = [UIImage imageNamed: icon];
    [tagViewIconBg setImage:tagViewIconImage];
    [self addSubview:tagViewIconBg];
}

- (void) addTextViewInfo:(NSString *)info {
    UITextView *text = [[UITextView alloc] initWithFrame: CGRectMake(self.leftMargin + 90, 5, 180, 50)];
    [text setScrollEnabled:NO];
    [text setUserInteractionEnabled:NO];
    [text setBackgroundColor:[UIColor clearColor]];
    UIFont *textFont = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    
    UIColor *fontColor = [UIColor colorWithRed:101.0/255 green:101.0/255 blue:100.0/255 alpha:1.0];
    [text setTextColor:fontColor];
    [text setFont:textFont];
    [text setText:info];
    text.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    text.textAlignment = NSTextAlignmentCenter;
    [self addSubview:text];
}

- (UIButton *) addNewButtonWithX:(int)x title:(NSString *)title image:(NSString *)image isColorPicker:(BOOL)isColorPicker {
    
    UIView *buttonView = [[UIView alloc] initWithFrame: CGRectMake(x, 0, 60, 60)];
    
    // Add Seperater line
    UIView *seperater = [self addSeperaterLineWithX: 0];
    [buttonView addSubview: seperater];
    
    // Button
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    if (isColorPicker) {
        button.frame = CGRectMake(8, 2, 40, 35);
        button.layer.cornerRadius = 5;
    } else {
        button.frame = CGRectMake(14, 2, 32, 32);
        [button setImage: [UIImage imageNamed: image] forState:UIControlStateNormal];
    }
    [buttonView addSubview: button];
    
    // Button text
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(10, 36, 60, 26)];
    UIFont *btnFont = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    UIColor *fontColor = [UIColor colorWithRed:101.0/255 green:101.0/255 blue:100.0/255 alpha:1.0];
    [text setTextColor:fontColor];
    [text setFont:btnFont];
    [text setText:title];
//    [text setCenter: CGPointMake(buttonView.frame.size.width/2, 36)];
    [buttonView addSubview:text];
    
    [self addSubview: buttonView];
    
    return button;
}

- (UIButton *) addCancellButton {
    self.btnCancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect imageFrameCancel = CGRectMake(_viewWidth-75, 15, 60, 25);
    self.btnCancel.frame = imageFrameCancel;
    
    UIFont *textFont = [UIFont fontWithName:@"Helvetica" size:13];
    [self.btnCancel.titleLabel setFont:textFont];
    [self.btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    
    UIColor *fontColor = [UIColor colorWithRed:96.0/255 green:96.0/255 blue:95.0/255 alpha:1.0];
    [self.btnCancel  setTitleColor:fontColor forState:UIControlStateNormal];
    
    UIImage *btnImageCancel = [UIImage imageNamed:@"signature_ribbon_btn_cancel_inactive.png"];
    //UIImage *btnImageCancel = [UIImage imageNamed:@"signature_ribbon_btn_cancel_inactive_text.png"];
    [self.btnCancel setBackgroundImage:btnImageCancel forState:UIControlStateNormal];
    //[self.btnCancel setImage:btnImageCancel forState:UIControlStateNormal];
    
    ////UIImage *btnImageCancelSelected = [UIImage imageNamed:@"signature_ribbon_btn_cancel_active.png"];
    //UIImage *btnImageCancelSelected = [UIImage imageNamed:@"signature_ribbon_btn_cancel_active_text.png"];
    ////[self.btnCancel setBackgroundImage:btnImageCancelSelected forState:UIControlStateHighlighted];
    //[self.btnCancel setImage:btnImageCancelSelected forState:UIControlStateHighlighted];
    
    [self.btnCancel addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnCancel];
    
    return _btnCancel;
}


- (UIView *) addSeperaterLineWithX:(int)x {
    UIView *seperaterLine = [[UIView alloc] initWithFrame:CGRectMake(x, 2, 2, 48)];
    seperaterLine.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0];
//    [self addSubview:seperaterLine];
    return seperaterLine;
}

- (void)btnColorPickerClicked:(UIButton *)sender
{
    NSLog(@"Button Color Picker Clicked");
}

- (void)btnScrollClicked:(UIButton *)sender
{
    NSLog(@"Button Scroll Clicked");
}

- (void)layoutSubviews {
    [super layoutSubviews];
//        self.btnColorPicker = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        self.btnColorPicker.layer.cornerRadius = 5;
//        CGRect imageFrame = CGRectMake(signature_ribbon_view_width-130, 2, 40, 35);
//        self.btnColorPicker.frame = imageFrame;
//        [self.btnColorPicker addTarget:self action:@selector(btnColorPickerClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.btnColorPicker setBackgroundColor:[UIColor blueColor]];
    

}

@end
