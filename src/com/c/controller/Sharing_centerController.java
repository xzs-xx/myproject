package com.c.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.c.etity.*;
import com.c.service.SharingService;

@Controller
public class Sharing_centerController {
	@Autowired
	private SharingService sharingService;
	@RequestMapping("sharing_center.do")
	public String Sharing_center(HttpServletResponse rep,HttpServletRequest req) {
		return "sharing_center";
	}
	@ResponseBody
	@RequestMapping("adddiary.do")
	public String addDiary(String title,String text,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		Diary diary =new Diary();
		Date date = new Date();
		diary.setId(""+date.getTime());
		diary.setUsername((String) session.getAttribute("username"));
		diary.setTitle(title);;
		diary.setText(text);
		diary.setTime(date);
		diary.setStatu(0);
		return sharingService.adddiary(diary);
	}
	@ResponseBody
	@RequestMapping("composition.do")
	public String addComposition(String title,String text,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		Compositiony composition = new Compositiony();
		Date date = new Date();
		String username = (String) session.getAttribute("username");
		String id = ""+ date.getTime();
		composition.setId(id);
		composition.setUsername(username);
		composition.setTitle(title);
		File filename = new File(req.getServletContext().getRealPath("/") +"src/" + username + id +".txt");
		try {
			if (!filename.exists()) {
				filename.createNewFile();
			}
			PrintStream ps = new PrintStream(new FileOutputStream(filename));
			ps.println(text);
		} catch (IOException e) {
			
		}
//		try {
//			InputStreamReader isr = new InputStreamReader(new FileInputStream(filename), "utf-8");
//			String lineTxt = null;
//			BufferedReader br = new BufferedReader(isr);
//		    while ((lineTxt = br.readLine()) != null) {
//		    	System.out.println(lineTxt);
//		    }
//		}catch (Exception e) {
//		}
		composition.setSrc("src/" + username + id +".txt");
		composition.setDate(date);
		composition.setStatu(0);
		return sharingService.addCompositiony(composition);
	}
	
	@RequestMapping("img.do")
	public String addimg(String imgtitle,MultipartFile file,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String filePath = req.getServletContext().getRealPath("/")+"myimage\\儿童图片";
		String originalFilename = file.getOriginalFilename();
		String username = (String) session.getAttribute("username");
		Date time = new Date();
		String id=""+time.getTime();
		String newFileName = username + id +originalFilename;
		File targetFile = new File(filePath,newFileName); 
		try {
			file.transferTo(targetFile);
			System.out.println(filePath);
		} catch (Exception e) {
			System.out.println("错误");
		}
		ShareImage img = new ShareImage();
		img.setId(id);
		img.setUsername(username);
		img.setTitle(imgtitle);
		img.setTime(time);
		img.setSrc("/myimage/儿童图片"+"/" + newFileName);
		img.setStatu(0);
		return sharingService.addShareImage(img);
	}

	@ResponseBody
	@RequestMapping("sharing_diarysee.do")
	public String[] sharing_diarysee(int sharediary_index,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String[] diaryindexary=new String[5];
		diaryindexary[0] = "存在下一个";
		List<Diary> sharingdiary;
		if(session.getAttribute("sharingdiary")==null) {
			sharingdiary = sharingService.savesharingdiary();
			session.setAttribute("sharingdiary", sharingdiary);
		}else {
			sharingdiary = (List<Diary>) session.getAttribute("sharingdiary");
		}
		if(sharediary_index < sharingdiary.size()&&sharediary_index>-1) {
			diaryindexary[1] = sharingdiary.get(sharediary_index).getTitle();
			diaryindexary[2] = sharingdiary.get(sharediary_index).getText().replace("\n", "<br>");
			diaryindexary[3] = sharingdiary.get(sharediary_index).getUsername();
			diaryindexary[4] = sharingdiary.get(sharediary_index).getId();
		}else diaryindexary[0]="最后一个";
		return diaryindexary;
	}
	
	@ResponseBody
	@RequestMapping("commentdiary.do")
	public String commentdiary(String commentdiary,int sharediary_index,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		List<Diary> sharingdiary;
		sharingdiary = (List<Diary>) session.getAttribute("sharingdiary");
		if(sharingdiary == null || sharediary_index>=sharingdiary.size()||sharediary_index<0) {
			return "评论失败";
		}else {
			Date time = new Date();
			Comment comment= new Comment();
			comment.setCommenttext(commentdiary);
			comment.setCommenttype("diary");
			comment.setCommentuser(sharingdiary.get(sharediary_index).getUsername());
			comment.setId(""+time.getTime());
			comment.setCommentid(sharingdiary.get(sharediary_index).getId());
			comment.setTime(time);
			sharingService.addCommentdiary(comment);
		}
		return "评论成功";
	}

	@ResponseBody
	@RequestMapping("collection.do")
	public String collection(String collectionid, String collectiontype,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String username = (String) session.getAttribute("username");
		if(sharingService.saveCollection(username, collectionid)==1) {
			return "已经收藏过";
		}else {
			Collection collection = new Collection();
			Date time = new Date();
			String id = ""+time.getTime();
			collection.setId(id);
			collection.setCollectionid(collectionid);
			collection.setCollectiontime(time);
			collection.setCollectionuser(username);
			collection.setCollectiontype(collectiontype);
			sharingService.addCollection(collection);
			return "收藏成功";
		}
	}
}
