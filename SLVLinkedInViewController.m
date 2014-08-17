//
//  SLVLinkedInViewController.m
//  Social Networks
//
//  Created by Ostap R on 15.08.14.
//  Copyright (c) 2014 SoftServe Lv-120. All rights reserved.
//

#import "SLVLinkedInViewController.h"
#import "SLVDBManager.h"
#import "Users.h"

static  NSString * kLinkedInApiKey=@"772ojbop21zpbj";
static  NSString * kLinkedInSecretKey=@"SEFTnXX310DnJtE6";
//static const NSString * kLinkedInOAuthUserToken=@"394c8fdb-d189-4c97-bb33-602dcb83cdcb"; //May be deprecated
//static const NSString * kLinkedInOAuthUserSecret=@"2ee1d5eb-2958-47c4-bcde-f31236974d3a"; //May be deprecated

@interface SLVLinkedInViewController () <UIWebViewDelegate>

@property (nonatomic) UIWebView *webView;

-(void)setupLinkedIn;

@end

@implementation SLVLinkedInViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect web=CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y+150, self.view.bounds.size.width, self.view.bounds.size.height);
    self.webView=[[UIWebView alloc] initWithFrame:web];
    self.webView.delegate=self;
    self.webView.scalesPageToFit=YES;
    
    {
        NSFetchRequest *request=[[NSFetchRequest alloc] initWithEntityName:@"Users"];
        NSPredicate *pred=[NSPredicate predicateWithFormat:@"type==[c]\"LinkedIn\""];
        [request setPredicate:pred];
        NSArray *service=[[[SLVDBManager sharedManager] context] executeFetchRequest:request error:nil];
        //if(!service)
        {
           [self setupLinkedIn];
        }
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    
}


-(void)setupLinkedIn
{
    if(self.webView==nil)
        NSLog(@"NIIIIILLLL");
  [self.view addSubview:self.webView];

    NSMutableString *path=[[NSMutableString alloc] initWithString:@"https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id="];
    [path appendString:kLinkedInApiKey];
    [path appendString:@"&state="];
    
    NSDate *data=[NSDate date];
    NSTimeInterval interval=[data timeIntervalSince1970];
    NSNumber *intervalObj=[NSNumber numberWithDouble:interval];
    [path appendString:[intervalObj stringValue]];
    
    [path appendString:@"&redirect_uri=http://example.com"];

    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [self.webView loadRequest:request];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost"]]];
    
}

#pragma mark - WebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url=request.URL.absoluteString;


    if([url rangeOfString:@"http://example.com"].location!=NSNotFound)
    {
        NSInteger loc=[url rangeOfString:@"code="].location;
        NSInteger loc2=[url rangeOfString:@"&state="].location;
        NSRange range=NSMakeRange(loc, loc2-loc);
        {
        }
        
    }
    
    return YES;
}



@end
