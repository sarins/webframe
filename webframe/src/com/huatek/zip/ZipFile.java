package com.huatek.zip;

import java.io.*;

public class ZipFile {

	/**
	 * ��ѹ,�������ص�zip���߰��ļ�
	 *
	 * @param directory
	 *            Ҫ��ѹ����Ŀ¼
	 * @param zip
	 *            ���߰��ļ�
	 *
	 * @throws Exception
	 *             ����ʧ��ʱ�׳��쳣
	 */
	public static void unzipFile(String directory, File zip) throws Exception {
		try {
			ZipInputStream zis = new ZipInputStream(new FileInputStream(zip));
			ZipEntry ze = zis.getNextEntry();
			File parent = new File(directory);
			if (!parent.exists() && !parent.mkdirs()) {
				throw new Exception("������ѹĿ¼ \"" + parent.getAbsolutePath() + "\" ʧ��");
			}
			while (ze != null) {
				String name = ze.getName();
				File child = new File(parent, name);
				FileOutputStream output = new FileOutputStream(child);
				byte[] buffer = new byte[10240];
				int bytesRead = 0;
				while ((bytesRead = zis.read(buffer)) > 0) {
					output.write(buffer, 0, bytesRead);
				}
				output.flush();
				output.close();
				ze = zis.getNextEntry();
			}
			zis.close();
		} catch (IOException e) {
		}
	}

	/*public static void main(String[] args) throws Exception {
		ZipFile zf = new ZipFile();
		File file = new File("D:/java/prop.zip");
		zf.unzipFile("D:/java/song", file);
	}*/
}
