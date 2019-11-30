package shopping.database.dto;

public class UserDTO {
	private int userIdx;
	private String userIdenty;
	private String userName;
	private String userPass;
	private String userEmail;
	private String userPhone;
	private String userBirth;
	private String userAddress;
	private int userRank;
	
	public UserDTO(String userIdenty, String userName, String userPass, String userEmail, String userPhone,
			String userBirth, String userAddress, int userRank) {
		super();
		this.userIdenty = userIdenty;
		this.userName = userName;
		this.userPass = userPass;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
		this.userAddress = userAddress;
		this.userRank = userRank;
	}
	
	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public String getUserIdenty() {
		return userIdenty;
	}

	public void setUserIdenty(String userIdenty) {
		this.userIdenty = userIdenty;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getUserRank() {
		return userRank;
	}

	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	
	
}
