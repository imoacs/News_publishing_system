package news;

import java.io.*;
import java.util.*;
import org.dom4j.*;
import org.dom4j.io.*;

public class XMLHelper {
	
	private static final Node monthElement = null;
	public static String path="/Users/Jackeriss/Documents/Tomcat/apache-tomcat-8.0.26/webapps/news/public/XML/";
	
	public static void creatXML(String typename){
		Document document=DocumentHelper.createDocument();
		document.addElement("news");
		File file=new File(path+typename+".xml");
		writeXML(document,file);
	}
	
	private static int writeXML(Document document,File file){
		int value=0;
		
		OutputFormat format=OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");  
        format.setNewlines(true);
        XMLWriter writer=null;
		try{
			//格式化输出
	        writer=new  XMLWriter(new FileOutputStream(file),format);
	        writer.write(document);
	        writer.flush();
	        writer.close();
	        value=1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return value;
	}
	
	public static int addNews(String typename,String title,String reporter,
			String editor,String zeditor,String content){
		int value=0;
		File file=new File(path+typename+".xml");
		if(!file.exists()){
			creatXML(typename);
			file=new File(path+typename+".xml");
		}
		Document document=null;
		
		try{
			SAXReader reader=new SAXReader();
			document=reader.read(file);
			Element rootElement=document.getRootElement();
			Element newElement=rootElement.addElement("new");
			
			int newid;
			List news=document.selectNodes("/news/new");
			newid=news.size();
			String Newid=String.valueOf(newid);
			Element newidElement=newElement.addElement("newid");
			newidElement.setText(Newid);
			
			Element titleElement=newElement.addElement("title");
			titleElement.setText(title);
			
			//获取日期，并格式化
			Calendar cal=Calendar.getInstance();
			String year=String.valueOf(cal.get(Calendar.YEAR));
			int mo=cal.get(Calendar.MONTH)+1;
			int da=cal.get(Calendar.DATE);
			int ho=cal.get(Calendar.HOUR);
			int mi=cal.get(Calendar.MINUTE);
			String month=null,data=null,hour=null,minute=null;
			if(mo<=9)
				month="0"+String.valueOf(mo);
			else
				month=String.valueOf(mo);
			if(da<=9)
				data="0"+String.valueOf(da);
			else
				data=String.valueOf(da);
			if(ho<=9)
				hour="0"+String.valueOf(ho);
			else
				hour=String.valueOf(ho);
			if(mi<=9)
				minute="0"+String.valueOf(mi);
			else
				minute=String.valueOf(mi);

			
			Element timeElement=newElement.addElement("time");
			timeElement.setText( year+"年"+month+"月"+data+"日 "+hour+":"+minute);
					
			Element reporterElement=newElement.addElement("reporter");
			reporterElement.setText(reporter);
			
			Element editorElement=newElement.addElement("editor");
			editorElement.setText(editor);
			
			Element zeditorElement=newElement.addElement("zeditor");
			zeditorElement.setText(zeditor);
				
			Element contentElement=newElement.addElement("content");
			contentElement.setText(content);
			
			Element commentsElement=newElement.addElement("comments");
			
			Element newStatus=newElement.addElement("newStatus");
			newStatus.setText("0");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		value=writeXML(document,file);
		
		return value;
		
	}
	
	public static void deleteNews(String typename,String newid){
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
			document=reader.read(file);
			Node node=document.selectSingleNode("/news/new[newid= '"+newid+"']");
			Element newElement=(Element)node;
			newElement.getParent().remove(newElement);
			List list=document.selectNodes("/news/new");
			Iterator iter=list.iterator();
			int i=1;
			while(iter.hasNext()){						
				String Newid=String.valueOf(i);
				newElement=(Element) iter.next();
				newElement.element("newid").setText(Newid);
				i++;
			}
			writeXML(document,file);
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
	}
	

	
	public static int updateNews(String typename,String newid,String title,
			String content){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/news/new[newid='"+newid+"']");
				Element newElement=(Element)node;
				newElement.element("title").setText(title);
				newElement.element("content").setText(content);

				value=writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}
	
	public static int addComment(String typename,String newid,String comment){
		int comid=0;
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){			
				document=reader.read(file);
				Node node=document.selectSingleNode("/news/new[newid='"+newid+"']/comments");
				Element commentsElement=(Element)node;
				
				List cos=document.selectNodes("/news/new[newid='"+newid+"']/comments/comment");
				comid=cos.size();
				comid=comid+1;
				String Comid=String.valueOf(comid);
				
				Element commentElement=commentsElement.addElement("comment");
				commentElement.addElement("status").setText("0");
				commentElement.addElement("comid").setText(Comid);
				commentElement.addElement("content").setText(comment);
				value=writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		
		return value;
	}
	
	public static void deleteComment(String typename,String newid,String comid ){
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				 document=reader.read(file);
				 Node node=document.selectSingleNode("/news/new[newid='"+newid+"']"
				 		+ "/comments/comment[comid='"+comid+"']");
				 Element commentElement=(Element)node;
				 commentElement.getParent().remove(commentElement);
				 List list=document.selectNodes("/news/new[newid='"+newid+"']"
				 		+ "/comments/comment");
					Iterator iter=list.iterator();
					int i=1;
					while(iter.hasNext()){	
						String Comid=String.valueOf(i);
						commentElement=(Element) iter.next();
						commentElement.element("comid").setText(Comid);
						i++;
					}
				 
				 writeXML(document,file);
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
	}
	
	public static int modiCommentStatus(String typename,String newid,
			String comid,String status ){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/news/new[newid='"+newid+"']/comments/comment[comid='"+comid+"']/status");
				Element statusElement=(Element)node;
				statusElement.setText(status);
				writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}
	
	public static int modiNewStatus(String typename,String newid,
			String status ){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/news/new[newid='"+newid+"']/newStatus");
				Element statusElement=(Element)node;
				
				statusElement.setText(status);
				writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}
	
	public static int count(String typename){
		int count=0;
		SAXReader reader=new SAXReader();
		Document document=null;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				List list=document.selectNodes("/news/new");
				Iterator iter=list.iterator();
				
				while(iter.hasNext()){
					iter.next();
					count++;
				}
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		return count;
	}
	
	public static NewsBean getNewsById(String typename,String newid){
		NewsBean news=new NewsBean();
		SAXReader reader=new SAXReader();
		Document document=null;
		String comments[]=null;
		String commentsStatus[] = null;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/news/new[newid='"+newid+"']");
				Element newElement=(Element)node;
				news=new NewsBean();
				news.setType(typename);
				news.setNewid(newElement.elementText("newid"));
				news.setTitle(newElement.elementText("title"));
				news.setReporter(newElement.elementText("reporter"));
				news.setEditor(newElement.elementText("editor"));
				news.setZeditor(newElement.elementText("zeditor"));
				news.setContent(newElement.elementText("content"));
				news.setTime(newElement.elementText("time"));
				news.setNewStatus(newElement.elementText("newStatus"));
				List cos= document.selectNodes("/news/new[newid='"+newid+"']/comments/comment");
				comments=new String[cos.size()];
				commentsStatus = new String[cos.size()];
				for(int i=0;i<cos.size();i++){
					Element commentElement=(Element) cos.get(i);
					comments[i]=commentElement.element("content").getText();
					commentsStatus[i] = commentElement.element("status").getText();
				}
				news.setComments(comments);
				news.setCommentsStatus(commentsStatus);
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		
		return news;
		
	}
	
	
	public static ArrayList<NewsBean> getNewsByProperty(String property
			,String value ,boolean isApproximate){
		ArrayList<NewsBean> arrNews = new ArrayList<NewsBean>();
		SAXReader reader=new SAXReader();
		Document document=null;
		String typeNames[] = {"social","entertainment","technology","military","sport","game"};
		for (int i = 0; i < typeNames.length ;i++){
			String typename = typeNames[i];
			try{
				File file=new File(path+typename+".xml");
				if(file.exists()){
					document=reader.read(file);
					
						List list=document.selectNodes("/news/new");
						Iterator iter=list.iterator();
						while(iter.hasNext()){
							Element newElement=(Element)iter.next();
						if(!isApproximate){
							if(newElement.element(property).getText().equals(value)){
								String newid = newElement.element("newid").getText();
								arrNews.add(getNewsById(typename,newid));
							}
						}else{
							//近似查找
							if(newElement.element(property).getText().indexOf(value) != -1){
								String newid = newElement.element("newid").getText();
								arrNews.add(getNewsById(typename,newid));
							}
						}		
						}
						
				}
			}catch(DocumentException ex){
				ex.printStackTrace();
			}
		}
		
		return arrNews;
	}
	
	public static void main(String[] args){
		addNews("shy","hh","ff","ff","ff","f");
		addNews("shy","hh","ff","ff","ff","f");
		addComment("shy","1","fuck");
		addComment("shy","2","you");
		System.out.print(getNewsById("shy","1").getComments()[0]);
		System.out.print(getNewsById("shy","2").getComments()[0]);
		modiCommentStatus("shy","1","1","1");
		System.out.print(count("SHY"));
	}
}
