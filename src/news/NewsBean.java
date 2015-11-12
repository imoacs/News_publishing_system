package news;

public class NewsBean {
	private String type;
	private String newStatus;
	private String newid;
	private String title;
	private String time;
	private String reporter;
	private String editor;
	private String zeditor;
	private String content;
	private String[] comments;
	private String[] commentsStatus;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String[] getCommentsStatus() {
		return commentsStatus;
	}
	public void setCommentsStatus(String[] commentsStatus) {
		this.commentsStatus = commentsStatus;
	}
	public String getNewStatus() {
		return newStatus;
	}
	public void setNewStatus(String newStatus) {
		this.newStatus = newStatus;
	}
	public String getNewid() {
		return newid;
	}
	public void setNewid(String newid) {
		this.newid = newid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getZeditor() {
		return zeditor;
	}
	public void setZeditor(String zeditor) {
		this.zeditor = zeditor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getComments() {
		return comments;
	}
	public void setComments(String[] comments) {
		this.comments = comments;
	}
}
