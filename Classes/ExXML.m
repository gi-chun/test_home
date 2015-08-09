    //
//  ExXML.m
//  Example
//
//  Created by dwcomms on 11. 3. 27..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExXML.h"


@implementation ExXML


- (void)viewDidLoad {
    [super viewDidLoad];
	
	xmlRootTag = @"user";
	
	xmlTags = [[NSMutableArray alloc] init];
	
	[xmlTags addObject:@"id"];
	[xmlTags addObject:@"name"];
	[xmlTags addObject:@"screen_name"];
	[xmlTags addObject:@"location"];
	[xmlTags addObject:@"description"];
	[xmlTags addObject:@"profile_image_url"];
	[xmlTags addObject:@"url"];
	[xmlTags addObject:@"protected"];
	[xmlTags addObject:@"followers_count"];
	[xmlTags addObject:@"profile_background_color"];
	[xmlTags addObject:@"profile_text_color"];
	[xmlTags addObject:@"profile_link_color"];
	[xmlTags addObject:@"profile_sidebar_fill_color"];
	[xmlTags addObject:@"profile_sidebar_border_color"];
	[xmlTags addObject:@"friends_count"];
	[xmlTags addObject:@"created_at"];
	[xmlTags addObject:@"favourites_count"];
	[xmlTags addObject:@"utc_offset"];
	[xmlTags addObject:@"time_zone"];
	[xmlTags addObject:@"profile_background_image_url"];
	
	
	NSString *URL = @"http://api.twitter.com/1/users/show.xml?user_id=12345";
	
	NSURL *fileURL = [NSURL URLWithString:URL]; 
	
	NSURLRequest *req = [NSURLRequest requestWithURL:fileURL]; 
	
	NSURLConnection *conn = [NSURLConnection connectionWithRequest:req delegate:self]; 
	
	if (conn)  
	{         
		receivedData = [[NSMutableData data] retain];
		
		xmlParseData = [[NSMutableArray alloc] init];
		xmlValue = [[NSMutableString alloc] init];
		currectItem = [[NSMutableDictionary alloc] init];
		
		Log(@"downloading"); 
	}  
	else  
	{ 
		Log(@"not downloading"); 
		// inform the user that the download could not be made 
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response { 
	// this method is called when the server has determined that it 
	// has enough information to create the NSURLResponse 
	// it can be called multiple times, for example in the case of a 
	// redirect, so each time we reset the data. 
	// receivedData is declared as a method instance elsewhere 
	Log(@"Receive: %@, %@, %d", [response URL], [response MIMEType], [response expectedContentLength]);
	
	[receivedData setLength:0]; 
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data { 
	// append the new data to the receivedData 
	// receivedData is declared as a method instance elsewhere
	[receivedData appendData:data];
} 

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error { 
	
	
	if (error != NULL) {
		// Show error message...
		Log(@"save error");
    } else {
		Log(@"save success");
	}
	
	[connection release]; 
	
	// receivedData is declared as a method instance elsewhere 
	if( receivedData != nil) {
		[receivedData release]; 
		receivedData = nil;
	}
} 

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
	Log(@"receivedData : %@", receivedData);
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:receivedData];
	[parser setDelegate:self];
	[parser parse];
	[parser release];	
	
}

#pragma mark XMLParse delegate methods
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	if ([elementName isEqualToString:xmlRootTag]) {
		elementType = etItem;
	}
	[xmlValue setString:@""];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if (elementType != etItem) {
		return;
	}
	if ([self isElementTag:elementName]) {
		[currectItem setValue:[NSString stringWithString:xmlValue] forKey:elementName];
	} else if ([elementName isEqualToString:xmlRootTag]) {
		[xmlParseData addObject:[NSDictionary dictionaryWithDictionary:currectItem]];
		Log(@"xmlParseData : %@", xmlParseData);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (elementType == etItem)
		[xmlValue appendString:string];
}

- (BOOL)isElementTag:(NSString *)elementName {
	BOOL isElement = FALSE;
	
	for (int i = 0; i < [xmlTags count]; i++) {
		if ([elementName isEqualToString:[xmlTags objectAtIndex:i]]) {
			isElement = TRUE;
			break;
		}
	}
	
	return isElement;
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
	
}


@end
