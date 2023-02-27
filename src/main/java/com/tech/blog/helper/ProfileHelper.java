package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfileHelper {
	public static boolean deleteFile(String path) {
		boolean success = false;

		try {
			File file = new File(path);
			success = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	public static boolean saveFile(InputStream fis, String path) {
		boolean success = false;

		try {
			byte[] pic = new byte[fis.available()];
			fis.read(pic);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(pic);
			fos.flush();
			fos.close();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}
}
