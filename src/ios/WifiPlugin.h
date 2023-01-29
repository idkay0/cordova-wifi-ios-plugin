#ifndef WifiPlugin_h
#define WifiPlugin_h

#import <Cordova/CDV.h>


@interface WifiPlugin : CDVPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)getWifiInfo:(CDVInvokedUrlCommand*)command;

@end

#endif /* WifiPlugin_h */