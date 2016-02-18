//
//  ViewController.m
//  CategoriesChipDemo
//
//  Created by OSX on 18/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{

    NSMutableArray * categoryArr ;
    
    
}
@property (weak, nonatomic) IBOutlet ChipsViewController *obj_CategoryView;

@end

@implementation ViewController
@synthesize obj_CategoryView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
     categoryArr = [[NSMutableArray alloc] init];
     [categoryArr addObject:@"Science"];
     [categoryArr addObject:@"8th Class"];
     [categoryArr addObject:@"Swift"];
     [categoryArr addObject:@"Objective c"];
     [categoryArr addObject:@"PreHyperText PreProcessor "];
     [categoryArr addObject:@"Vijayvir"];
     [categoryArr addObject:@"Traveling"];
     [categoryArr addObject:@"Solutions"];
     [categoryArr addObject:@"two"];
     [categoryArr addObject:@"VJ"];
     [categoryArr addObject:@"K"];
    
     obj_CategoryView.leoDelegate = self;
    [obj_CategoryView initializeClassWithFrame:self.view.frame];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}


#pragma mark ChipsViewController Delegate

-(NSMutableArray*)leoGetArray{
    return [categoryArr mutableCopy];
    
}

-(BOOL)leoShouldDeleteChipsAtIndex:(NSInteger)index inArray:(NSMutableArray*)array{
    return  YES;
    
}
-(void)leoResultedArrayAfterDeletion:(NSMutableArray*)array{
    
}

- (IBAction)action_ResetArray:(id)sender
{
    [obj_CategoryView resetArray:[categoryArr mutableCopy]];
    
}
@end
