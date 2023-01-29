var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'cordova-wifi-ios-plugin', 'coolMethod', [arg0]);
};
exports.getWifiInfo = function (arg0, success, error) {
    exec(success, error, 'cordova-wifi-ios-plugin', 'getWifiInfo', [arg0]);
};

