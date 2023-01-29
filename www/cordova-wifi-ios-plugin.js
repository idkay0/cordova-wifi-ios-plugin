var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'cordova_wifi_ios_plugin', 'coolMethod', [arg0]);
};
exports.getWifiInfo = function (arg0, success, error) {
    exec(success, error, 'cordova_wifi_ios_plugin', 'getWifiInfo', [arg0]);
};

