//
//  PickerCellsController.h
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

#ifndef PickerCellsController_h
#define PickerCellsController_h


#import <UIKit/UIKit.h>

@protocol PickerCellsDelegate;

@interface PickerCellsController : NSObject

- (void)attachToTableView:(UITableView *)tableView tableViewsPriorDelegate:(id <UITableViewDelegate, UITableViewDataSource>)priorDelegate withDelegate:(id<PickerCellsDelegate>)delegate;
- (void)addDatePicker:(UIDatePicker *)datePicker forIndexPath:(NSIndexPath *)indexPath;
- (void)addPickerView:(UIPickerView *)pickerView forIndexPath:(NSIndexPath *)indexPath;
- (void)hidePicker;
- (id)pickerForOwnerCellIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathForPicker:(id)picker;

@end


#endif /* PickerCellsController_h */
