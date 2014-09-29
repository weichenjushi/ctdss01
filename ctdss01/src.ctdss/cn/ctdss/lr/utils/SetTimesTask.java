package cn.ctdss.lr.utils;

import java.sql.SQLException;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.ctdss.lr.service.APIService;

public class SetTimesTask extends TimerTask {
	private static Log log = LogFactory.getLog(SetTimesTask.class);
	private static boolean isRunning = false;

	@Override
	public void run() {
		if (!isRunning) {
			isRunning = true;
			log.debug("开始执行任务..."); // 开始任务
			try {
				new APIService().updateallTimes();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			log.debug("执行任务完成..."); // 任务完成
			isRunning = false;
		} else {
			log.debug("上一次任务执行还未结束..."); // 上一次任务执行还未结束
		}
	}

}
