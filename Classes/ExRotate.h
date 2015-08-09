//
//  ExRotate.h
//  Example
//
//  Created by dwcomms on 11. 3. 5..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExRotate : UIViewController {
	
	UILabel *lblTop;
	UILabel *lblBottom;

}

- (void) viewWillRotate:(UIInterfaceOrientation)toInterfaceOrientation;

@end

