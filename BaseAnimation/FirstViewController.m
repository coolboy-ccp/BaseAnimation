//
//  FirstViewController.m
//  BaseAnimation
//
//  Created by liqunfei on 15/8/12.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "FirstViewController.h"
#define ksMainScreenSize [UIScreen mainScreen].bounds.size

@interface FirstViewController ()
{
    CGFloat blockX;
    CGFloat blockY;
    CGFloat blockW;
    CGFloat blockH;
    BOOL    isFirstAppear;
    BOOL    isFinished;
    UIColor *originColor;
    UIColor *purpuseColor;
    UIColor *pinkColor;
}

@property (weak, nonatomic) IBOutlet UIView *originBlock;
@property (weak, nonatomic) IBOutlet UIView *purpuseBlock;
@property (weak, nonatomic) IBOutlet UIView *pinkBlock;
@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"animationView";
    isFirstAppear = YES;
    isFinished = YES;
    
}

- (void)viewDidLayoutSubviews {
    if (isFirstAppear) {
        blockX = self.originBlock.center.x;
        blockY = self.originBlock.center.y;
        blockH = self.originBlock.bounds.size.height;
        originColor = self.originBlock.backgroundColor;
        purpuseColor = self.purpuseBlock.backgroundColor;
        pinkColor = self.pinkBlock.backgroundColor;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetFrame:(UIButton *)sender {
    self.originBlock.center = CGPointMake(blockX, blockY);
    self.purpuseBlock.center = CGPointMake(blockX, blockY);
    self.pinkBlock.center = CGPointMake(blockX, blockY);
    self.originBlock.alpha = 1.0;
    self.purpuseBlock.alpha = 1.0;
    self.pinkBlock.alpha = 1.0;
    self.originBlock.backgroundColor = originColor;
    self.purpuseBlock.backgroundColor = purpuseColor;
    self.pinkBlock.backgroundColor = pinkColor;
}

- (IBAction)playAnimation:(UIButton *)sender {
    [self displayAnimation];
}

- (void)baseAnimation {
    isFinished = YES;
    [UIView animateWithDuration:1.0 animations:^{
        self.purpuseBlock.center = CGPointMake(blockX, blockY+blockH+40.0);
        self.pinkBlock.center = CGPointMake(blockX, blockY+blockH+40.0);
        self.pinkBlock.center = CGPointMake(blockX, blockY+2*blockH+2*40.0);
    } completion:^(BOOL finished) {

    }];
    
}

- (void)rotationAnimation {
    [self baseAnimation];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.originBlock.transform = CGAffineTransformRotate(self.originBlock.transform, M_PI);
        self.purpuseBlock.transform = CGAffineTransformRotate(self.purpuseBlock.transform, M_PI);
        self.purpuseBlock.center = CGPointMake(ksMainScreenSize.width/2, self.purpuseBlock.center.y);
        self.pinkBlock.transform = CGAffineTransformRotate(self.pinkBlock.transform, M_PI);
        self.pinkBlock.center = CGPointMake(ksMainScreenSize.width-54, self.pinkBlock.center.y);
        self.roundImageView.transform = CGAffineTransformRotate(self.roundImageView.transform, M_PI);
    } completion:^(BOOL finished) {
        [self resetFrame:nil];
        [self rotationAnimation];
    }];
}

- (void)displayAnimation {
    if (!isFinished) {
        return;
    }
    switch (self.animationType) {
        case NONE_TYPE:
        {
            
        }
            break;
        case POSITION_TYPE:
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.originBlock.center = CGPointMake(ksMainScreenSize.width - blockX, blockY);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.5 animations:^{
                    self.purpuseBlock.center = CGPointMake(blockX, ksMainScreenSize.height - blockY);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.5 animations:^{
                        self.pinkBlock.center = CGPointMake(ksMainScreenSize.width - blockX, ksMainScreenSize.height - blockY);
                    } completion:^(BOOL finished) {
                      
                    }];
                }];
            }];
        }
            break;
        case OPACITY_TYPE:
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.originBlock.alpha = 0.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.5 animations:^{
                    self.purpuseBlock.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.5 animations:^{
                        self.pinkBlock.alpha = 0.0;
                    } completion:nil];
                }];
            }];
        }
            break;
        case SCALE_TYPE:
        {
            
            [self baseAnimation];
            [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionAutoreverse animations:^{
                self.originBlock.transform = CGAffineTransformMakeScale(0.5, 0.5);
                self.purpuseBlock.center = CGPointMake(ksMainScreenSize.width/2, self.purpuseBlock.center.y);
                self.purpuseBlock.transform = CGAffineTransformMakeScale(2.0, 2.0);
                self.pinkBlock.transform = CGAffineTransformMakeScale(1.5, 1.5);
            } completion:^(BOOL finished) {
                  self.originBlock.transform = CGAffineTransformIdentity;
                  self.purpuseBlock.transform = CGAffineTransformIdentity;
                  self.pinkBlock.transform = CGAffineTransformIdentity;
            }];
        }
            break;
        case COLOR_TYPE:
        {
            [self baseAnimation];
            [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionAutoreverse animations:^{
                self.originBlock.backgroundColor = [UIColor whiteColor];
                self.purpuseBlock.backgroundColor = [UIColor whiteColor];
                self.pinkBlock.backgroundColor = [UIColor whiteColor];
            } completion:nil];
        }
            break;
        case ROTATION_TYPE:
        {
            [self rotationAnimation];
        }
            break;
        case COMBINATION_TYPE:
        {
            
        }
            break;
        case EASING_TYPE:
        {
            
        }
            break;
        case SPRING_TYPE:
        {
            
        }
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
