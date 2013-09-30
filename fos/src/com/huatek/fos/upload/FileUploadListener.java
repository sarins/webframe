package com.huatek.fos.upload;

import java.io.Serializable;

import org.apache.commons.fileupload.ProgressListener;

/**
 * * This is a File Upload Listener that is used by Apache * Commons File Upload
 * to monitor the progress of the * uploaded file.
 */
public class FileUploadListener implements ProgressListener, Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 4271663285948517775L;
	/***
	 * Session key of upload info.
	 */
	public static final String SESSION_KEY = "_uploadFile";
	/**
	 * Read byte, File content length, file items.
	 */
	private volatile long bytesRead = 0L, contentLength = 0L, item = 0L;

	/***
	 * Default listener structure function.
	 */
	public FileUploadListener() {
		super();
	}

	/**
	 * Rewrite the super update method.
	 * 
	 * @param aBytesRead
	 *            byte read
	 * @param aContentLength
	 *            content length
	 * @param anItem
	 *            file item.
	 */
	public void update(final long aBytesRead, final long aContentLength,
			final int anItem) {
		bytesRead = aBytesRead;
		contentLength = aContentLength;
		item = anItem;
	}

	/***
	 * Get the read byte.
	 * 
	 * @return read byte.
	 */
	public long getBytesRead() {
		return bytesRead;
	}

	/**
	 * 
	 * @return content length.
	 */
	public long getContentLength() {
		return contentLength;
	}

	/**
	 * 
	 * @return file Item.
	 */
	public long getItem() {
		return item;
	}
}
