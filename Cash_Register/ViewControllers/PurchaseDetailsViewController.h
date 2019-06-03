//
//  PurchaseDetailsViewController.h
//  Cash_Register
//
//  Created by Yinhuan Yuan on 5/1/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseDetailsViewController : UIViewController
@property (nonatomic) PurchaseHistory *singlePurchase;
@end

NS_ASSUME_NONNULL_END
