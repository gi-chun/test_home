//
//  ExXML.h
//  Example
//
//  Created by dwcomms on 11. 3. 27..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	etNone = 0,
	etItem
} eElementType;

@interface ExXML : UIViewController <NSXMLParserDelegate>{
	
	NSMutableData *receivedData;
	
	eElementType elementType;
	NSMutableArray *xmlParseData;
	NSMutableString *xmlValue;
	NSMutableDictionary *currectItem;
	
	NSString *xmlRootTag;
	NSMutableArray *xmlTags;
}
-(BOOL)isElementTag:(NSString *)elementName;

@end
