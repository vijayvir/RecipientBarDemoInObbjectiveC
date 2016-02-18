//
//  ChipsViewController.h
//  CategoriesChipDemo
//
//  Created by OSX on 18/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - ChipsViewControllerDelegate
@protocol  ChipsViewControllerDelegate <NSObject>



@optional

-(NSMutableArray*)leoGetArray;
-(BOOL)leoShouldDeleteChipsAtIndex:(NSInteger)index inArray:(NSMutableArray*)array;
-(void)leoResultedArrayAfterDeletion:(NSMutableArray*)array;


@end




#pragma mark- ChipsViewController CLASS
@interface ChipsViewController : UIControl
{
    UIControl * contentView;
    NSMutableArray * arrOfChips;
    UIScrollView * scrollView;
    
    
}

@property (nonatomic,assign) id< ChipsViewControllerDelegate >leoDelegate;

-(void)initializeClassWithFrame:(CGRect)frame;
-(void)resetArray:(NSMutableArray*)arry;

@end
