package org.wdcode.web.socket.interfaces;

import org.wdcode.common.interfaces.Close;

/**
 * Socket接口
 * @author WD
 * @since JDK7
 * @version 1.0 2013-12-20
 */
public interface Socket extends Close {
	/**
	 * 服务器名
	 */
	String getName();

	/**
	 * 添加要处理的Handler
	 * @param handler
	 */
	void addHandler(Handler<?>... handler);

	/**
	 * 添加心跳包处理器
	 * @param heart
	 */
	void setHeart(Heart heart);

	/**
	 * 获得Manager
	 * @return Manager
	 */
	Manager getManager();
}
