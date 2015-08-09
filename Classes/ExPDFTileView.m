    //
//  ExPDFTileView.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExPDFTileView.h"


@implementation ExPDFTileView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
	[scrollView setBackgroundColor:[UIColor clearColor]];
	[scrollView setPagingEnabled:YES];
	[self.view addSubview:scrollView];	
	
	float posX = 0.0;
	
	CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("/The_iPhone_Developers_Cookbook Building.pdf"), NULL, NULL);
	
	CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	
	int pageNo = CGPDFDocumentGetNumberOfPages(pdf);
	
	for (int i = 0; i < pageNo; i++) {
		
		CGPDFPageRef page = CGPDFDocumentGetPage(pdf, (i+1));
		
		TiledPDFView *pdfView = [[TiledPDFView alloc] initWithFrame:CGRectMake(posX, 0.0, 320.0, 420.0) andScale:1.0];
		[pdfView setPage:page];
		[scrollView addSubview:pdfView];
		[pdfView release];

		
		

		
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(posX, 0.0, 320.0, 420.0)];
		[btn setBackgroundColor:[UIColor clearColor]];
		[btn setTag:i];
		[btn addTarget:self action: @selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
		[scrollView addSubview:btn];
		[btn release];
		
		posX += 320.0;
	}
	
	[scrollView setContentSize:CGSizeMake(posX, 420.0)];
	
	
	downScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 420.0, 320.0, 200.0)];
	[downScroll setBackgroundColor:[UIColor blackColor]];
	[downScroll setPagingEnabled:YES];
	[self.view addSubview:downScroll];	
	
	
	
	posX = 0.0;
	
	for (int i = 0; i < pageNo; i++) {
		
		CGPDFPageRef page = CGPDFDocumentGetPage(pdf, (i +1));
		
		if (i%3 == 0) {
			
			posX += 5.0;
		}
		
		TiledPDFView *pdfView = [[TiledPDFView alloc] initWithFrame:CGRectMake(posX, 20.0, 100.0, 150.0) andScale:1.0];
		[pdfView setPage:page];
		[downScroll addSubview:pdfView];
		
		[pdfView release];
		
		UIButton *thumbBtn = [[UIButton alloc]initWithFrame:CGRectMake(posX, 20.0, 100.0, 150.0)];
		[thumbBtn setBackgroundColor:[UIColor clearColor]];
		[thumbBtn setTag:i];
		[thumbBtn addTarget:self action: @selector(selectThumb:) forControlEvents:UIControlEventTouchUpInside];
		[downScroll addSubview:thumbBtn];
		[thumbBtn release];
		
		posX += 105.0;
	}
	
	
	[downScroll setContentSize:CGSizeMake(posX, 200.0)];
}

- (void) selectBtn: (UIButton *)btn {
	
	if (countNum%2 == 0) {
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[downScroll setFrame:CGRectMake(0.0, 220.0, 320.0, 200.0)];
		
		[UIView commitAnimations];
		
	}
	else {
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[downScroll setFrame:CGRectMake(0.0, 420.0, 320.0, 200.0)];
		
		[UIView commitAnimations];
	}
	
	countNum += 1;
	
}

- (void) selectThumb: (UIButton *)btn {
	
	CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * btn.tag;
    [scrollView scrollRectToVisible:frame animated:YES];	
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[scrollView release];
	[downScroll release];
}


@end
