package user;

public class ManUserDetail {
	 
    private String nickName; // 아이디(이메일) 
    private int preferJob;// 관심직업 
    private int preferContent; // 관심컨텐츠 
    private int age;// 나이 
    private int gender;// 성별 
    private String tel;// 전화번호 
    private String resume;// 자기소개 
    private int ablePjt; // 프로젝트 가능 여부 
	
	public String getNickName() {
		return nickName;
	}
	public int getPreferJob() {
		return preferJob;
	}
	public int getPreferContent() {
		return preferContent;
	}
	public int getAge() {
		return age;
	}
	public int getGender() {
		return gender;
	}
	public String getTel() {
		return tel;
	}
	public String getResume() {
		return resume;
	}
	public int getAblePjt() {
		return ablePjt;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPreferJob(int preferJob) {
		this.preferJob = preferJob;
	}
	public void setPreferContent(int preferContent) {
		this.preferContent = preferContent;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public void setAblePjt(int ablePjt) {
		this.ablePjt = ablePjt;
	}
    
}
