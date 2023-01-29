#import <Cordova/CDV.h>


@interface WifiPlugin : CDVPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)getWifiInfo:(CDVInvokedUrlCommand*)command;

@end