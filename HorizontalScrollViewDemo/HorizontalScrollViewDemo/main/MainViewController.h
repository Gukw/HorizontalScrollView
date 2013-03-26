//
//  MainViewController.h
//  HorizontalScrollViewDemo
//
//  Created by Gukw on 3/26/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalScrollView.h"


@interface MainViewController : UIViewController<UIScrollViewDelegate,HorizontalScrollViewDelegate>
@property (nonatomic) HorizontalScrollView *horiView;
@end
