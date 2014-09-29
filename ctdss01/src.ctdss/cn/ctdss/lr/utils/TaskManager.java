package cn.ctdss.lr.utils;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang.time.DateUtils;

public class TaskManager implements ServletContextListener {

	/**
	 * 每天的毫秒数
	 */
	public static final long PERIOD_DAY = DateUtils.MILLIS_IN_DAY;
	/**
	 * 一周内的毫秒数
	 */
	public static final long PERIOD_WEEK = PERIOD_DAY * 7;
	/**
	 * 无延迟
	 */
	public static final long NO_DELAY = 0;
	/**
	 * 定时器
	 */
	private Timer timer;

	/**
	 * 在Web应用启动时初始化任务
	 */
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// 定义定时器
		timer = new Timer("更新次数", true);
		// 启动次数更新,每天执行一次
		timer.schedule(new SetTimesTask(),NO_DELAY, PERIOD_DAY);
		//timer.schedule(new SetTimesTask(), NO_DELAY, 30000);
	}

	/**
	 * 在Web应用结束时停止任务
	 */
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		timer.cancel(); // 定时器销毁
	}
}
