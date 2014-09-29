package cn.ctdss.lr.utils;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang.time.DateUtils;

public class TaskManager implements ServletContextListener {

	/**
	 * ÿ��ĺ�����
	 */
	public static final long PERIOD_DAY = DateUtils.MILLIS_IN_DAY;
	/**
	 * һ���ڵĺ�����
	 */
	public static final long PERIOD_WEEK = PERIOD_DAY * 7;
	/**
	 * ���ӳ�
	 */
	public static final long NO_DELAY = 0;
	/**
	 * ��ʱ��
	 */
	private Timer timer;

	/**
	 * ��WebӦ������ʱ��ʼ������
	 */
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// ���嶨ʱ��
		timer = new Timer("���´���", true);
		// ������������,ÿ��ִ��һ��
		timer.schedule(new SetTimesTask(),NO_DELAY, PERIOD_DAY);
		//timer.schedule(new SetTimesTask(), NO_DELAY, 30000);
	}

	/**
	 * ��WebӦ�ý���ʱֹͣ����
	 */
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		timer.cancel(); // ��ʱ������
	}
}
