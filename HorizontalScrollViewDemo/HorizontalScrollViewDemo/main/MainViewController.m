
//
//  MainViewController.m
//  HorizontalScrollViewDemo
//
//  Created by Gukw on 3/26/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
//    _horiView =  [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) withRow:5];
    _horiView = [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    _horiView.delegate = self;
    _horiView.delegateHorizontal = self;
    [self.view addSubview:_horiView];
    _horiView.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - HorizontalScrollViewDelegate
-(NSInteger)numbersOfRowsInHorizontalScrollView:(UIScrollView *)horizontalScrollView{
    return 7;
}
-(UIView *)horizontalScrollView:(UIScrollView *)horizontalScrollView cellForRow:(NSInteger)row{
    NSString *identifier = @"horicell";
    HorizontalCell *cell = [_horiView dequeueReusableCellWithIdentifier:identifier];
    UILabel *label;
    if(cell == nil){
        cell = [[HorizontalCell alloc] initWithIndentifier:identifier];
        cell.frame = CGRectMake(0, 0, 320, 460);
        label = [[UILabel alloc] initWithFrame:CGRectMake(160, 240, 100, 30)];
        label.textColor = [UIColor blueColor];
        label.font = [UIFont systemFontOfSize:14.0];
        label.tag = 1;
        [cell addSubview:label];
        NSLog(@"new cell for row:%d", row);
    }else{
        NSLog(@"reuseable cell for row:%d", row);
    }
    if(row%2 == 0){
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor yellowColor];
    }
    label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%d", row];
    return cell;
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView == _horiView){
        [_horiView scrollViewDidScroll:scrollView];
    }
}

@end
