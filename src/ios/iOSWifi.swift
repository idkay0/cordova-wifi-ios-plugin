#if !arch(i386) && !arch(x86_64)
import NetworkExtension
#endif

import Foundation
import SystemConfiguration.CaptiveNetwork

@objc(iOSWifi) class iOSWifi : CDVPlugin {
    var wifiList: [(ssid: String, mac: String)] = []

    func getWifiInfo(_ command: CDVInvokedUrlCommand)  {

        let hotspotHelper = NEHotspotHelper.init()
        let hotspotNetworks = hotspotHelper.supportedNetworkInterfaces
        
        var wifiList =  [(ssid: String, mac: String)] = []
        for network in hotspotNetworks {
            if network.ssid != nil {
                wifiList.append( ( network.ssid, network.bssid)  )
            }
        }
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: wifiList)
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }

}