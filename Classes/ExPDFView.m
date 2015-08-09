    //
//  ExPDFView.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExPDFView.h"


@implementation ExPDFView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	countNum = 0;
	
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
	[scrollView setBackgroundColor:[UIColor clearColor]];;
	[scrollView setPagingEnabled:YES];
	[self.view addSubview:scrollView];	
	
	float posX = 0.0;
	
	CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("/The_iPhone_Developers_Cookbook Building.pdf"), NULL, NULL);

	CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	
	for (int i = 0; i < CGPDFDocumentGetNumberOfPages(pdf); ++i) {
		
		UIGraphicsBeginImageContext(CGSizeMake(320.0, 420.0));		
		
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGContextSetInterpolationQuality(context, kCGInterpolationHigh); 
		
		CGContextSetRenderingIntent(context, kCGRenderingIntentDefault); 
		
		CGContextTranslateCTM(context, 0.0, 420.0);
		
		CGContextScaleCTM(context, 1.0, -1.0);
		
		CGPDFPageRef page = CGPDFDocumentGetPage(pdf, (i+1));
		
		CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
		
		CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
		CGContextFillRect(context,pageRect);
		
		CGContextSaveGState(context);
		
		CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFMediaBox, CGRectMake(0.0, 0.0, 320.0, 420.0), 0, true);
		
		CGContextConcatCTM(context, pdfTransform);

		CGContextDrawPDFPage(context, page);
		
		CGContextRestoreGState(context);
		
		UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
		
		UIButton *imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(posX, 0.0, 320.0, 420.0)];
		[imgBtn setImage:resultingImage forState:UIControlStateNormal];
		[imgBtn setImage:resultingImage forState:UIControlStateHighlighted];
		[imgBtn setTag:i];
		[imgBtn addTarget:self action: @selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
		[scrollView addSubview:imgBtn];
		[imgBtn release];
		
		posX += 320.0;
		
	}
	
	
	[scrollView setContentSize:CGSizeMake(posX, 420.0)];
	
	
	downScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 420.0, 320.0, 200.0)];
	[downScroll setBackgroundColor:[UIColor blackColor]];
	[downScroll setPagingEnabled:YES];
	[self.view addSubview:downScroll];	
	
	
	
	posX = 0.0;
	
	
	for (int i = 0; i < CGPDFDocumentGetNumberOfPages(pdf); ++i) {
		
		UIGraphicsBeginImageContext(CGSizeMake(100.0, 150.0));		
		
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGContextSetInterpolationQuality(context, kCGInterpolationHigh); 
		
		CGContextSetRenderingIntent(context, kCGRenderingIntentDefault); 
		
		CGContextTranslateCTM(context, 0.0, 150.0);
		
		CGContextScaleCTM(context, 1.0, -1.0);
		
		CGPDFPageRef page = CGPDFDocumentGetPage(pdf, (i+1));
		
		CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
		
		CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
		CGContextFillRect(context,pageRect);
		
		CGContextSaveGState(context);
		
		CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFMediaBox, CGRectMake(0.0, 0.0, 100.0, 150.0), 0, true);
		
		CGContextConcatCTM(context, pdfTransform);
		
		CGContextDrawPDFPage(context, page);
		
		CGContextRestoreGState(context);
		
		UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
		
		
		if (i%3 == 0) {
			
			posX += 5.0;
		}
		
		UIButton *thumbBtn = [[UIButton alloc]initWithFrame:CGRectMake(posX, 20.0, 100.0, 150.0)];
		[thumbBtn setImage:resultingImage forState:UIControlStateNormal];
		[thumbBtn setImage:resultingImage forState:UIControlStateHighlighted];
		[thumbBtn setTag:i];
		[thumbBtn addTarget:self action: @selector(selectThumb:) forControlEvents:UIControlEventTouchUpInside];
		[downScroll addSubview:thumbBtn];
		[thumbBtn release];
		

		posX += 105.0;
		
	}
	
	CGPDFDocumentRelease(pdf);
	CFRelease (pdfURL);
	
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
