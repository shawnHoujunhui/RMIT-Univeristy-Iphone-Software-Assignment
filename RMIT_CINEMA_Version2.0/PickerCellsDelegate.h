//
//  PickerCellsDelegate.h
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

#ifndef PickerCellsDelegate_h
#define PickerCellsDelegate_h
#import <UIKit/UIKit.h>

@class PickerCellsController;
@protocol PickerCellsDelegate <UITableViewDataSource, UITableViewDelegate>

@optional
- (void)pickerCellsController:(PickerCellsController *)controller willExpandTableViewContent:(UITableView *)tableView forHeight:(CGFloat)expandHeight;
- (void)pickerCellsController:(PickerCellsController *)controller willCollapseTableViewContent:(UITableView *)tableView forHeight:(CGFloat)expandHeight;

@end

#endif /* PickerCellsDelegate_h */
