package com.Entity;

public class RiderDetails {


    private int riderID;
    private String fullName;
    private String DOB;
    private String dateOfJoin;
    private int sex;
    private String Address;
    private String bikeModel;
    private String bikeNumber;
    private int marStatus;
    private String nic;
    private String mobileNo;
    private double kmPerLetr;


    public RiderDetails()
    {}


    public int getRiderID() {
        return riderID;
    }

    public void setRiderID(int riderID) {
        this.riderID = riderID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getDateOfJoin() {
        return dateOfJoin;
    }

    public void setDateOfJoin(String dateOfJoin) {
        this.dateOfJoin = dateOfJoin;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getBikeModel() {
        return bikeModel;
    }

    public void setBikeModel(String bike_model) {
        this.bikeModel = bike_model;
    }

    public String getBikeNumber() {
        return bikeNumber;
    }

    public void setBikeNumber(String bikeNumber) {
        this.bikeNumber = bikeNumber;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getMarStatus() {
        return marStatus;
    }

    public void setMarStatus(int marStatus) {
        this.marStatus = marStatus;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }



    public double getKmPerLetr() {
        return kmPerLetr;
    }

    public void setKmPerLetr(double kmPerLetr) {
        this.kmPerLetr = kmPerLetr;
    }


}
