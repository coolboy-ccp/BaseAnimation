//
//  MenuTableViewController.m
//  BaseAnimation
//
//  Created by liqunfei on 15/8/12.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "MenuTableViewController.h"
#import "FirstViewController.h"
#import "MyLoginViewController.h"
#import "MyDefineAnimation.h"

@interface MenuTableViewController ()
{
    MyDefineAnimation *animation;
}
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MenuView";
    animation = [[MyDefineAnimation alloc] init];
    self.navigationController.delegate = (id<UINavigationControllerDelegate>)self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - navigationDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return animation;
    }
    else {
        return nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0?8:1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
    NSArray *names = @[@"Position",@"Opacity",@"Scale",@"Color",@"Rotation",@"Combination",@"Easing",@"Spring"];
    if (indexPath.section == 0) {
        cell.textLabel.text = names[indexPath.row];
    }
    else {
        cell.textLabel.text = @"Logining";
    }
  
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0?@"SimpleAnimationEffect":@"ComprehensiveAnimation";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MyLoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    FirstViewController *firstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    if (indexPath.section == 1) {
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    else {
        switch (indexPath.row) {
            case 0:
            {
                firstVC.animationType = POSITION_TYPE;
            }
                break;
            case 1:
            {
                firstVC.animationType = OPACITY_TYPE;
            }
                break;
            case 2:
            {
                firstVC.animationType = SCALE_TYPE;
            }
                break;
            case 3:
            {
                firstVC.animationType = COLOR_TYPE;
            }
                break;
            case 4:
            {
                firstVC.animationType = ROTATION_TYPE;
            }
                break;
            case 5:
            {
                firstVC.animationType = COMBINATION_TYPE;
            }
                break;
            case 6:
            {
                firstVC.animationType = EASING_TYPE;
            }
                break;
            case 7:
            {
                firstVC.animationType = SPRING_TYPE;
            }
                break;
                
            default:
            {
                firstVC.animationType = NONE_TYPE;
            }
                break;
        }
        [self.navigationController pushViewController:firstVC animated:YES];
    }
   }

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
