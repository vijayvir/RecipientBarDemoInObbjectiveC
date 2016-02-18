//
//  ChipsViewController.m
//  CategoriesChipDemo
//
//  Created by OSX on 18/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import "ChipsViewController.h"

#import "ChipView.h"
@implementation ChipsViewController
@synthesize leoDelegate;
#pragma mark - CLC
- (void)drawRect:(CGRect)rect
{
   

  
}
-(void)initializeClassWithFrame:(CGRect)frame
{

    
    scrollView = [[UIScrollView  alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, self.frame.size.height)];
    
    contentView = [[UIControl alloc]initWithFrame:scrollView.bounds];
  
    [scrollView addSubview:contentView];
    [self addSubview:scrollView];
    
    
    if ([leoDelegate respondsToSelector:@selector(leoGetArray)])
    {
       arrOfChips   = [leoDelegate leoGetArray];
       [self setupContentView];
        
    }
}



- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
   
    
  
}
-(void)resetArray:(NSMutableArray*)arry{
    arrOfChips = arry;
    [self setupContentView] ;
}
#pragma mark - helper Method

-(void)setupContentView
{
    for (UIView * view  in contentView.subviews)
    {
        [view removeFromSuperview];
        
    }
    __block CGRect previousRect = CGRectMake(5, 5, 0, 0);
    

    [arrOfChips
     enumerateObjectsUsingBlock:
     
     ^(NSString *string, NSUInteger index, BOOL *stop)
     {
        __block ChipView * chip =[[ChipView alloc]initWithText: [string mutableCopy]  withIndex:index];
         
         
         if (previousRect.origin.x + chip.frame.size.width  < scrollView.frame.size.width)
         {
             
           chip.frame = CGRectMake(previousRect.origin.x ,  previousRect.origin.y , chip.frame.size.width, chip.frame.size.height);
             
             previousRect.origin.x = previousRect.origin.x + chip.frame.size.width + 5  ;
             previousRect.origin.y = previousRect.origin.y;
             
        
         }
         else
         {
            previousRect.origin.x =  0  ;
            previousRect.origin.y = chip.frame.size.height + previousRect.origin.y +5  ;
            
             chip.frame = CGRectMake(previousRect.origin.x ,  previousRect.origin.y  , chip.frame.size.width,   chip.frame.size.height);
             
            
             previousRect.origin.x = previousRect.origin.x + chip.frame.size.width + 5  ;
             
         }
     
         chip.leoCallback = ^(NSString* name ,   NSInteger index)
         {
             if ([leoDelegate respondsToSelector:@selector(leoShouldDeleteChipsAtIndex:inArray:)])
             {
                 
                 if ([leoDelegate leoShouldDeleteChipsAtIndex:index inArray:arrOfChips])
                 {
                     [arrOfChips removeObjectAtIndex:index];
                     
                     if ([leoDelegate respondsToSelector:@selector(leoResultedArrayAfterDeletion:)])
                     {
                         [leoDelegate leoResultedArrayAfterDeletion:arrOfChips];
                     }
                     
                     [self setupContentView];
                 }
             }
         };
         
         [contentView addSubview:chip];
     }];
    
      contentView.frame = CGRectMake(0, 0, scrollView.frame.size.width, previousRect.origin.y + [ChipView fontSize]*2 );
       scrollView.contentSize = contentView.frame.size;
}







@end
