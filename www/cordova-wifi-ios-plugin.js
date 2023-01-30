var exec = require('cordova/exec');

var WifiPlugin = {
    // coolMethod: function (arg0, success, error) {
    //     cordova.exec(success, error, "WIFI", "coolMethod", [arg0]);
    // },
    getWifiInfo: function (arg0, success, error) {
        cordova.exec(success, error, "idea2413.cordova.wifi.plugin", "getWifiInfo", [arg0]);
    }
};

module.exports = WifiPlugin;