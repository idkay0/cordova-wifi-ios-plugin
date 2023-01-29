/********* cordova-wifi-ios-plugin.m Cordova Plugin Implementation *******/

#import "cordova-wifi-ios-plugin.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h> 


@implementation cordovawifi_ios_plugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getWifiInfo:(CDVInvokedUrlCommand*)command {
    NSArray *interfaces = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSMutableArray *wifiList = [NSMutableArray array];
    
    for (NSString *interface in interfaces) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)interface);
        NSString *ssid = [info objectForKey:@"SSID"];
        NSString *bssid = [info objectForKey:@"BSSID"];
        NSDictionary *wifi = [NSDictionary dictionaryWithObjectsAndKeys:ssid, @"SSID", bssid, @"BSSID", nil];
        [wifiList addObject:wifi];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:wifiList];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
