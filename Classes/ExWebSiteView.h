//
//  ExWebSiteView.h
//  Example
//
//  Created by dwcomms on 11. 3. 27..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExWebSiteView : UIViewController <UITextFieldDelegate, UIWebViewDelegate>{
	
	UITextField *urlText;
	UIWebView *webPageView;
	UIActivityIndicatorView *indicator;

}

@end
