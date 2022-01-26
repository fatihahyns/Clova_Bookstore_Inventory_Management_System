package cbims.Model;

public class suppliers {
    private String supplier_ID;
    private String supplier_Name;
    private String supplier_Address;
    private String supplier_Postcode;
    private String supplier_City;
    private String supplier_State;
    private String supplier_PhoneNo;
    private String supplier_Email;

    public suppliers(String supplier_ID, String supplier_Name, String supplier_Address, String supplier_Postcode, String supplier_City, String supplier_State, String supplier_PhoneNo, String supplier_Email) {
        super();
        this.supplier_ID = supplier_ID;
        this.supplier_Name = supplier_Name;
        this.supplier_Address = supplier_Address;
        this.supplier_Postcode = supplier_Postcode;
        this.supplier_City = supplier_City;
        this.supplier_State = supplier_State;
        this.supplier_PhoneNo = supplier_PhoneNo;
        this.supplier_Email = supplier_Email;
    }

    public suppliers() {
        super();
    }

    public String getSupplier_ID() {
        return supplier_ID;
    }

    public void setSupplier_ID(String supplier_ID) {
        this.supplier_ID = supplier_ID;
    }

    public String getSupplier_Name() {
        return supplier_Name;
    }

    public void setSupplier_Name(String supplier_Name) {
        this.supplier_Name = supplier_Name;
    }

    public String getSupplier_Address() {
        return supplier_Address;
    }

    public void setSupplier_Address(String supplier_Address) {
        this.supplier_Address = supplier_Address;
    }

    public String getSupplier_Postcode() {
        return supplier_Postcode;
    }

    public void setSupplier_Postcode(String supplier_Postcode) {
        this.supplier_Postcode = supplier_Postcode;
    }

    public String getSupplier_City() {
        return supplier_City;
    }

    public void setSupplier_City(String supplier_City) {
        this.supplier_City = supplier_City;
    }

    public String getSupplier_State() {
        return supplier_State;
    }

    public void setSupplier_State(String supplier_State) {
        this.supplier_State = supplier_State;
    }

    public String getSupplier_PhoneNo() {
        return supplier_PhoneNo;
    }

    public void setSupplier_PhoneNo(String supplier_PhoneNo) {
        this.supplier_PhoneNo = supplier_PhoneNo;
    }

    public String getSupplier_Email() {
        return supplier_Email;
    }

    public void setSupplier_Email(String supplier_Email) {
        this.supplier_Email = supplier_Email;
    }
}
