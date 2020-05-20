package com.c.socket;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.io.IOException;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.qq.connect.utils.json.JSONObject;


/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/websocket/{userpath}")
public class WebsocketMyself {
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<WebsocketMyself> webSocketSet = new CopyOnWriteArraySet<WebsocketMyself>();
    private static Map<String,Session> userWsSession = new HashMap<String,Session>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private String userpath;
    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam("userpath") String userpath,Session session){
        this.userpath = userpath;
        userWsSession.put(this.userpath, session);
        webSocketSet.add(this);     //加入set中
    }
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        userWsSession.remove(this.userpath);
    }
    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     * @throws IOException 
     */
    @OnMessage
    public void onMessage(String message,Session session) throws IOException {
        System.out.println(message);
        String[] arymessage = message.split("\\|");
        System.out.println();
        ((Session)userWsSession.get(arymessage[0])).getBasicRemote().sendText(arymessage[0] + ":" + arymessage[1]);
        	
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
    }
}