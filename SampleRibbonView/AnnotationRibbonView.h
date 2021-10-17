//
//  AnnotationRibbonView.h
//  SampleRibbonView
//
//  Created by Ruwan Thalgahage on 2021-10-14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnnotationRibbonView : UIView

@property (strong, nonatomic) UIImageView *bgView;
@property (strong, nonatomic) UIButton *btnColorPicker;
@property (strong, nonatomic) UIButton *btnCancel;

@property (assign) int leftMargin;
@property (assign) int viewWidth;


@end

NS_ASSUME_NONNULL_END
