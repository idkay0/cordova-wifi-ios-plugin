#import <Cordova/CDV.h>
#import <SystemConfiguration/CaptiveNetwork.h>


@interface cordova_wifi_ios_plugin : CDVPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)getWifiInfo:(CDVInvokedUrlCommand*)command;

@end