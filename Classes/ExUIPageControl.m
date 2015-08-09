    //
//  ExUIPageControl.m
//  Example
//
//  Created by dwcomms on 11. 1. 14..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIPageControl.h"


@implementation ExUIPageControl



- (void)viewDidLoad {
    [super viewDidLoad];
	
	ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 300.0)];
	[ScrollView setPagingEnabled:YES];
	[ScrollView setContentSize:CGSizeMake(ScrollView.frame.size.width * 3, ScrollView.frame.size.height)];
	[ScrollView setShowsHorizontalScrollIndicator:NO];
	[ScrollView setShowsVerticalScrollIndicator:NO];
	[ScrollView setBackgroundColor:[UIColor blackColor]];
	[ScrollView setScrollsToTop:NO];
	[ScrollView setDelegate:self];
	[self.view addSubview:ScrollView];
	
	UIImage *img1 = [UIImage imageNamed:@"a.png"];
	UIImage *img2 = [UIImage imageNamed:@"b.png"];
	UIImage *img3 = [UIImage imageNamed:@"c.png"];
	
	float posX = (320.0 - img1.size.width)/2;
	float posY = (300.0 -img1.size.height)/2;
	
	UIImageView *imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(posX, posY, img1.size.width, img1.size.height)];
	[imgView1 setImage:img1];
	[ScrollView addSubview:imgView1];
	[imgView1 release];

	posX += 320.0;
	
	UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(posX, posY, img2.size.width, img2.size.height)];
	[imgView2 setImage:img2];
	[ScrollView addSubview:imgView2];
	[imgView2 release];
	
	posX += 320.0;
	
	UIImageView *imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(posX, posY, img3.size.width, img3.size.height)];
	[imgView3 setImage:img3];
	[ScrollView addSubview:imgView3];
	[imgView3 release];
	
	posX += 320.0;
	
	pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, 282.0, 320.0, 18.0)];
	[pageControl setNumberOfPages:3];
	[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:pageControl];
}


- (void)changePage:(id)sender {
	
	int page = pageControl.currentPage;
	
    CGRect frame = ScrollView.frame;
    frame.origin.x = frame.size.width * page;
    [ScrollView scrollRectToVisible:frame animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	
	CGFloat pageWidth = ScrollView.frame.size.width;
	int page = ScrollView.contentOffset.x/pageWidth;
	pageControl.currentPage = page;
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[ScrollView release];
	[pageControl release];
	
}


@end
