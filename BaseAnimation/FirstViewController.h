//
//  FirstViewController.h
//  BaseAnimation
//
//  Created by liqunfei on 15/8/12.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    NONE_TYPE,
    POSITION_TYPE,
    OPACITY_TYPE,
    SCALE_TYPE,
    COLOR_TYPE,
    ROTATION_TYPE,
    COMBINATION_TYPE,
    EASING_TYPE,
    SPRING_TYPE
}AnimationType;

@interface FirstViewController : UIViewController
@property (assign,nonatomic) AnimationType animationType;
@end
