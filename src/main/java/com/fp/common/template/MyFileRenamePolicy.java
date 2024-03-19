package com.fp.common.template;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		// 원본파일명
		String originName = originFile.getName();
		
		// 수정파일명("20211215110327_51215.jpeg")
		//		파일업로드시간(년월일시분초)_랜덤숫자5자리.확장자
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + "_" + ranNum + ext;

		return new File(originFile.getParent(), changeName); // 파일명 수정작업 후 수정된 파일 객체
	}
			
}
