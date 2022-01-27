package cbims.Model;

public class register implements java.io.Serializable
{
    private int admin_ID;
    private String admin_Name;
    private String admin_PhoneNo;
    private String admin_Username;
    private String admin_Email;
    private String admin_Password;

    public register()
    {

    }

    public register(int admin_ID, String admin_Name, String admin_PhoneNo, String admin_Username, String admin_Email, String admin_Password)
    {
        this.admin_ID = admin_ID;
        this.admin_Name = admin_Name;
        this.admin_PhoneNo = admin_PhoneNo;
        this.admin_Username = admin_Username;
        this.admin_Email = admin_Email;
        this.admin_Password = admin_Password;
    }

    public int getAdmin_ID()
    {
        return admin_ID;
    }

    public void setAdmin_ID(int admin_ID) {
        this.admin_ID = admin_ID;
    }

    public String getAdmin_Name() {
        return admin_Name;
    }

    public void setAdmin_Name(String admin_Name) {
        this.admin_Name = admin_Name;
    }

    public String getAdmin_PhoneNo() {
        return admin_PhoneNo;
    }

    public void setAdmin_PhoneNo(String admin_PhoneNo) {
        this.admin_PhoneNo = admin_PhoneNo;
    }

    public String getAdmin_Username() {
        return admin_Username;
    }

    public void setAdmin_Username(String admin_Username) {
        this.admin_Username = admin_Username;
    }

    public String getAdmin_Email() {
        return admin_Email;
    }

    public void setAdmin_Email(String admin_Email) {
        this.admin_Email = admin_Email;
    }

    public String getAdmin_Password() {
        return admin_Password;
    }

    public void setAdmin_Password(String admin_Password) {
        this.admin_Password = admin_Password;
    }

}
