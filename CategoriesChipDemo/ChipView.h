//
//  ChipView.h
//  CategoriesChipDemo
//
//  Created by OSX on 18/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChipView : UIView
{
    NSString * name;
    NSInteger index;
    
}
typedef void (^ChipViewBlock)(NSString*  ,   NSInteger );

+(CGFloat)fontSize;


@property(readwrite, copy) ChipViewBlock leoCallback;

- (id)initWithText:(NSMutableString*)nameCat withIndex:(NSInteger)indexOfCat;

@end
