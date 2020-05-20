<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>web测试</title>
    <script type="text/javascript">
    var ws = null;
         function WebSocketTest()
         {
        	 if ('WebSocket' in window) {
        		alert(111);
				ws = new WebSocket("ws://localhost:8080/myssm/websocket/123");
					} 
               // 打开一个 web socket
               ws.onopen = function(){
                  // Web Socket 已连接上，使用 send() 方法发送数据
                  alert("数据发送中...");
               };
                
               ws.onmessage = function (evt) { 
                var received_msg = evt.data;
                alert("数据已接收...");
				alert(received_msg);
               };
                
               ws.onclose = function(){ 
                  // 关闭 websocket
                  alert("连接已关闭..."); 
               };
               ws.onerror = function() {
            	   alert("错误");
            	};  
            }
         function sendonclick(){
        	 ws.send("123|11q11");
         }
      </script>
</head>
<body>
	<div id="sse">
         <a href="javascript:WebSocketTest()">运行 WebSocket</a>
     </div>
     <div onclick="sendonclick()">发送</div>
</body>
</html>
