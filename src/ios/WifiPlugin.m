
#import "WifiPlugin.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h> 
#import <CoreWLAN/CoreWLAN.h>

@implementation WifiPlugin

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
    NSMutableArray *wifiList = [NSMutableArray array];
    CWInterface *wifiInterface = [CWInterface interface];
    NSSet *wifiNetworks = [wifiInterface scanForNetworksWithName:nil error:nil];

    for (CWNetwork *network in wifiNetworks) {
        NSString *ssid = network.ssid;
        NSString *bssid = network.bssid;
        NSDictionary *wifi = [NSDictionary dictionaryWithObjectsAndKeys:ssid, @"SSID", bssid, @"BSSID", nil];
        [wifiList addObject:wifi];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:wifiList];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
