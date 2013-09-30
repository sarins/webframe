package com.huatek.framework.tag;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

public final class PageConfig {
	private static final Logger LOGGER = Logger.getLogger(PageConfig.class);
	private static final PageConfig INSTANCE = new PageConfig();
	public static PageConfig getInstance() {
		return INSTANCE;
	}
	int pageSize = 10;
	public int getPageSize() {
		return pageSize;
	}
	private PageConfig() {
		Properties prop = new Properties();
		try {
			if (LOGGER.isInfoEnabled()) {
				LOGGER.info("PageConfig init");
			}
			prop.load(this.getClass().getResourceAsStream("page_config.properties"));
			pageSize = Integer.parseInt(prop.getProperty("page.default.rowSize","10"));
		} catch (IOException e) {
			LOGGER.error(e.getMessage());
			e.printStackTrace();
		}
	}
}
