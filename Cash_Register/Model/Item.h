//
//  Item.h
//  Cash_Register
//
//  Created by Yinhuan Yuan on 4/30/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

-(instancetype)initWithName: (NSString*)name
               price: (double) price
            quantity: (int) quantity;
-(NSString*) name;
-(double) price;
-(int) quantity;
-(void) setQuantity: (int)quantity;

-(NSString*)description;


@end

NS_ASSUME_NONNULL_END
