(function () {
 
     function setupWKWebViewJavascriptBridge(callback) {
        if (window.WKWebViewJavascriptBridge) {
            return callback(WKWebViewJavascriptBridge);
        }
        if (window.WKWVJBCallbacks) {
            return window.WKWVJBCallbacks.push(callback);
        }
        window.WKWVJBCallbacks = [callback];
        window.webkit.messageHandlers.iOS_Native_InjectJavascript.postMessage(null)
     }
 
//    //dome
//    setupWKWebViewJavascriptBridge(function(bridge) {
//                                //注册一个函数给原生调用
//                                bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {
//                                                       responseCallback(responseData)
//                                                       });
//                                //调用原生API
//                                bridge.callHandler('testiOSCallback', {'foo': 'bar'}, function(response) {
//                                                   alert(response["a"]);
//                                                   });
//                                   });

 
 window.gw = {
     ready: function (action,params,responseCallback) {
            setupWKWebViewJavascriptBridge(function(bridge) { bridge.callHandler(action, params, responseCallback)  });
     },
     common:function(action,params,callback){
         if(params==null||params==undefined){
            params={};
         }
         if(callback==null||callback==undefined){
            callback=function(p){}
         }
        gw.ready(action,params,callback);
     }
 }
 
 } ());

