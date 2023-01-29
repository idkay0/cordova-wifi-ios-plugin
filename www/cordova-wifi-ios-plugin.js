var exec = require('cordova/exec');

var WifiPlugin = {
    coolMethod: function (arg0, success, error) {
        cordova.exec(success, error, "WifiPlugin", "coolMethod", [arg0]);
    },
    getWifiInfo: function (arg0, success, error) {
        cordova.exec(success, error, "WifiPlugin", "getWifiInfo", [arg0]);
    }
};

module.exports = WifiPlugin;