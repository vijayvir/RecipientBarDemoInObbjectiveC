//
//  ChipView.m
//  CategoriesChipDemo
//
//  Created by OSX on 18/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import "ChipView.h"


@implementation ChipView

@synthesize leoCallback;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
    
  
    
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer.cornerRadius = [ChipView fontSize];
    
    self.layer.masksToBounds = true;
    self.backgroundColor = [UIColor colorWithRed: .9529 green:.9529 blue:.9529 alpha:1] ;
    
    
}

- (id)initWithText:(NSMutableString*)nameCat withIndex:(NSInteger)indexOfCat
{
    [nameCat appendString:@"  x"];
    
    
    CGFloat width =  [nameCat sizeWithFont:[UIFont systemFontOfSize:[ChipView fontSize] ]].width;
    
    
    CGRect frame = CGRectMake(0, 0, width+[ChipView fontSize], [ChipView fontSize]*2);
    
    
     self = [super initWithFrame:frame];
    
    if (self)
    {
        
       self->name = [NSString new];
        self->name = nameCat ;
       self-> index = indexOfCat;
        
 
        UILabel * lbluserName =[[UILabel alloc]init];
       
        lbluserName.text = nameCat;
        
        lbluserName.font = [UIFont systemFontOfSize:[ChipView fontSize]];
        
        lbluserName.backgroundColor = [UIColor colorWithRed: .9529 green:.9529 blue:.9529 alpha:1];
        
        lbluserName.frame = CGRectMake(5, 0, width,frame.size.height);
       
        lbluserName.textAlignment = NSTextAlignmentCenter;
       
        [self addSubview:lbluserName];
        
        
        UIButton * button = [[UIButton alloc]initWithFrame:frame];
        
        [button addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
      
        button.backgroundColor = [UIColor clearColor];
       
        [self addSubview:button];
        
        [self layoutIfNeeded];
       
        self.backgroundColor = [UIColor colorWithRed: .9529 green:.9529 blue:.9529 alpha:1] ;
        
    }
    
    return self;
}


- (void) didTouchButton
{
    leoCallback(name,index);
}
+(CGFloat)fontSize
{
    return 13 ;
    
}

@end
