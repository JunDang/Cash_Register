//
//  PurchaseHistoryTableViewController.h
//  Cash_Register
//
//  Created by Yinhuan Yuan on 5/1/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistoryTableViewController : UITableViewController
@property (nonatomic) NSMutableArray *purchases;
@property(nonatomic) PurchaseHistory* singlePurchase;
-(NSMutableArray*) purchases;
-(void)setPurchases:(NSMutableArray *)purchases;

@end

NS_ASSUME_NONNULL_END
