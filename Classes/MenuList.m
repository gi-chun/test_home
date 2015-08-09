    //
//  MenuList.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuList.h"

@implementation MenuList

- (void) viewWillAppear:(BOOL)animated {
	
	[self connectedToNetwork];
	
	
	
}

- (void) connectedToNetwork {
	
    
	struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
       NSLog(@"error");
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	
	
	if (isReachable && !needsConnection && !nonWiFi) {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Wifi 네크워크에 연결되었습니다." 
							  message:nil
							  delegate:self  
							  cancelButtonTitle:nil 
							  otherButtonTitles:@"확인",nil];
		[alert show];
		[alert release];
		
	}
	else if(isReachable && !needsConnection && nonWiFi){
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"3G 네트워크 연결" 
							  message:@"3G 네트워크 이용시 데이터 이용료가 부과됩니다.\nWi-Fi로 접속하시면 더욱 원활하게\n서비스를 이용하실 수 있습니다."
							  delegate:self  
							  cancelButtonTitle:nil 
							  otherButtonTitles:@"확인",nil];
		[alert show];
		[alert release];
		
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"연결 없음" 
							  message:@"네트워크 연결이 필요합니다.\n사용 가능한 Wifi 네트워크나\n3G 네트워크에 접속해 주세요."
							  delegate:self  
							  cancelButtonTitle:nil 
							  otherButtonTitles:@"확인",nil];
		[alert show];
		[alert release];
		
	}


	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Example";

	nav = (UINavigationController *)[self parentViewController];
		
	menuItem = [[NSMutableArray alloc] init];
	
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"HelloWorld",@"title",[HelloWorld new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"UIView",@"title",[ExUIView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"UIScrollViewY",@"title",[ExUIScrollViewY new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"UIScrollViewX",@"title",[ExUIScrollViewX new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIScrollViewPage",@"title",[ExUIScrollViewPage new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIImageView",@"title",[ExUIImageView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUILabel",@"title",[ExUILabel new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIButton",@"title",[ExUIButton new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUISwitch",@"title",[ExUISwitch new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIPickerView",@"title",[ExUIPickerView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"EXUIPickerViewYMD",@"title",[EXUIPickerViewYMD new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIPickerView3Com",@"title",[ExUIPickerView3Com new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITableView",@"title",[ExUITableView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExTabEffect",@"title",[ExTabEffect new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIPageControl",@"title",[ExUIPageControl new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITableViewDetail",@"title",[ExUITableViewDetail new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITableViewMore",@"title",[ExUITableViewMore new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITabBarController",@"title",[ExUITabBarController new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITabBarControllerCustom",@"title",[ExUITabBarControllerCustom new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExPopupView",@"title",[ExPopupView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIAlertView",@"title",[ExUIAlertView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExRotate",@"title",[ExRotate new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExMapkit",@"title",[ExMapkit new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExMapAddPin",@"title",[ExMapAddPin new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"EXUserDefault",@"title",[EXUserDefault new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"EXUserDefaultOut",@"title",[EXUserDefaultOut new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUserDefaultSwitch",@"title",[ExUserDefaultSwitch new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"EXUIWebView",@"title",[EXUIWebView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIAlertViewAppNCall",@"title",[ExUIAlertViewAppNCall new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITableViewEdit",@"title",[ExUITableViewEdit new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExSlidingMenu",@"title",[ExSlidingMenu new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExTabSlidingMenu",@"title",[ExTabSlidingMenu new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExCamera",@"title",[ExCamera new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExCameraAlbum",@"title",[ExCameraAlbum new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExSendMail",@"title",[ExSendMail new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExSendMailWithImg",@"title",[ExSendMailWithImg new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExTouchView",@"title",[ExTouchView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExTouchMove",@"title",[ExTouchMove new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExMoveViews",@"title",[ExMoveViews new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExURLFileJSON",@"title",[ExURLFileJSON new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExImageLoad",@"title",[ExImageLoad new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExMediaPlay",@"title",[ExMediaPlay new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUILabelFit",@"title",[ExUILabelFit new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExFileWrite",@"title",[ExFileWrite new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExPDFView",@"title",[ExPDFView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExPDFTileView",@"title",[ExPDFTileView new],@"viewcontroller",nil]];
	
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExHTTP",@"title",[ExHTTP new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExXML",@"title",[ExXML new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExFileView",@"title",[ExFileView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExWebSiteView",@"title",[ExWebSiteView new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITextField",@"title",[ExUITextField new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUITextFieldDelegate",@"title",[ExUITextFieldDelegate new],@"viewcontroller",nil]];
	[menuItem addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"ExUIButtonType",@"title",[ExUIButtonType new],@"viewcontroller",nil]];




	
	
	tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 400.0) style:UITableViewStylePlain];
	[tableView setDelegate:self];
	[tableView setRowHeight:45];
	[tableView setDataSource:self];
	[tableView setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [menuItem count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
	
	UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn setFrame:CGRectMake(0.0, 0.0, 320.0, 45.0)];
	[btn setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
	[btn setTag:indexPath.row];
	[btn addTarget:self action:@selector(buttonTouchedUpInside:) forControlEvents:UIControlEventTouchUpInside];
	
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 0.0, 300.0, 45.0)];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setFont:[UIFont systemFontOfSize:16.0f]];
	[label setTextAlignment:UITextAlignmentLeft];
	[label setNumberOfLines:1];
	[label setText:[[menuItem objectAtIndex:indexPath.row] objectForKey:@"title"] ];
	
	[cell.contentView addSubview:btn];
	[cell.contentView addSubview:label];
	
    return cell;
}

- (void)buttonTouchedUpInside:(id)sender {
	
	toPush = [[menuItem objectAtIndex:[sender tag]]objectForKey:@"viewcontroller"];
	if (toPush) {
		[toPush setTitle:[[menuItem objectAtIndex:[sender tag]] objectForKey:@"title"]];
		[nav pushViewController:toPush animated:YES];
	}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[tableView release];
	
}


@end
