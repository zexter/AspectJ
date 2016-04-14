package com.Data;

import com.Entity.RiderDetails;

import java.sql.*;
import java.util.ArrayList;

/*
created by : Chathumini


 */
public class RiderDetailsDAO {

    /**
     * Inserts rider by agent
     * @param riderDetails object of rider class which includes attributes of a rider.
     * @return if rider is inserted successfully returns true. Otherwise returns false.
     */
    public boolean addRider(RiderDetails riderDetails) {
        boolean result = false;
        Connection con = null;
        Statement stmt = null;



        try {


            con = DatabaseManager.con();
            stmt = con.createStatement();
            String query = "insert into q_rider(Rider_Name,Date_Of_birth,Date_Of_Join,gender,marital," +
                    "nic,Address,TP_Number,Bike_Number,kmperleter,Bike_Modle)" +
                    " values('" + riderDetails.getFullName()
                    + "','" + riderDetails.getDOB() + "','" + riderDetails.getDateOfJoin()+ "','" + riderDetails.getSex() + "','" + riderDetails.getMarStatus() + "','"
                    + riderDetails.getNic() + "','" + riderDetails.getAddress() + "','" + riderDetails.getMobileNo() + "','"
                    +riderDetails.getBikeNumber()+"',"+riderDetails.getKmPerLetr()+",'"+riderDetails.getBikeModel()+"')";

            System.out.println(query);
            int value = stmt.executeUpdate(query);


            if (value > 0) {

                result = true;

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            result = false;
        } finally {
            if (con != null) {
                DatabaseManager.con_close(con);
            }
            if (stmt != null) {
                DatabaseManager.stmt_close(stmt);
            }
        }
        return result;

    }

    /**
     *retuns an arraylist which includes all riders in the database.
     * @return an arraylist of objects of type Rider.
     */
    public ArrayList<RiderDetails> getListOfRiders(){
        ArrayList<RiderDetails> riders = new ArrayList<RiderDetails>();
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        String query="SELECT Rider_ID,Rider_Name,Date_Of_birth,Date_Of_Join,gender," +
                "marital,nic,Address,TP_Number,Bike_Number,kmperleter," +
                "Bike_Modle FROM quickee.q_rider WHERE status=1;";
        try {
            con= DatabaseManager.con();
            stmt=con.createStatement();

            rs=stmt.executeQuery(query);
            while(rs.next()){
                RiderDetails riderDetails= new RiderDetails();
                riderDetails.setRiderID(rs.getInt("Rider_ID"));
                riderDetails.setFullName(rs.getString("Rider_Name"));
                riderDetails.setDOB(rs.getString("Date_Of_birth"));
                riderDetails.setDateOfJoin(rs.getString("Date_Of_Join"));
                riderDetails.setSex(rs.getInt("gender"));
                riderDetails.setMarStatus(rs.getInt("marital"));
                riderDetails.setNic(rs.getString("nic"));
                riderDetails.setAddress(rs.getString("Address"));
                riderDetails.setMobileNo(rs.getString("TP_Number"));
                riderDetails.setBikeModel(rs.getString("Bike_Modle"));
                riderDetails.setBikeNumber(rs.getString("Bike_Number"));
                riderDetails.setKmPerLetr(rs.getDouble("kmperleter"));


                riders.add(riderDetails);
            }

        }
        catch (Exception e){

            System.out.println("big exs");
        }
        finally{
            if (rs!=null){
                DatabaseManager.rs_close(rs);
            }if (stmt!=null){
                DatabaseManager.stmt_close(stmt);
            }if (con!=null){
                DatabaseManager.con_close(con);
            }
        }

        return  riders;
    }

    /**
     * Returns a Rider object when rider id is passed.
     * @param id Rider id
     * @return
     */
    public RiderDetails getRiderDetails(String id){
        RiderDetails riderDetails = new RiderDetails();
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        String query="SELECT Rider_Name,Date_Of_birth,Date_Of_Join,gender," +
                "marital,nic,Address,TP_Number,Bike_Number,kmperleter," +
                "Bike_Modle FROM quickee.q_rider WHERE Rider_ID="+id;

        System.out.println(query);
        try {
            con= DatabaseManager.con();
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);
            while(rs.next()){
                riderDetails.setFullName(rs.getString("Rider_Name"));
                riderDetails.setSex(rs.getInt("gender"));
                riderDetails.setDOB(rs.getString("Date_Of_birth"));
                riderDetails.setDateOfJoin(rs.getString("Date_Of_Join"));
                riderDetails.setSex(rs.getInt("gender"));
                riderDetails.setMarStatus(rs.getInt("marital"));
                riderDetails.setNic(rs.getString("nic"));
                riderDetails.setAddress(rs.getString("Address"));
                riderDetails.setMobileNo(rs.getString("TP_Number"));
                riderDetails.setBikeModel(rs.getString("Bike_Modle"));
                riderDetails.setBikeNumber(rs.getString("Bike_Number"));
                riderDetails.setKmPerLetr(rs.getDouble("kmperleter"));


            }

        }catch (Exception e){

        }finally{
            if (rs!=null){
                DatabaseManager.rs_close(rs);
            }if (stmt!=null){
                DatabaseManager.stmt_close(stmt);
            }if (con!=null){
                DatabaseManager.con_close(con);
            }
        }

        return  riderDetails;
    }

    /**
     * Updates rider by agent
     * @param riderDetails object of rider class which includes attributes of a rider.
     * @return if rider is updated successfully returns true. Otherwise returns false.
     */
    public boolean UpdateRiderDetails(RiderDetails riderDetails) {
        boolean result = false;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DatabaseManager.con();
            stmt = con.createStatement();
            String query = "UPDATE quickee.q_rider SET Rider_Name='"+riderDetails.getFullName()+
                    "',Date_Of_birth='"+riderDetails.getDOB()+"',Date_Of_Join='"+riderDetails.getDateOfJoin()+"',gender='"+riderDetails.getSex()+"',marital='"+riderDetails.getMarStatus()+
                    "',nic='"+riderDetails.getNic()+"',Address='"+riderDetails.getAddress()+"',TP_Number='"+riderDetails.getMobileNo()+
                    "',Bike_Modle='"+riderDetails.getBikeModel()+"',Bike_Number='"+riderDetails.getBikeNumber()+"',kmperleter="+riderDetails.getKmPerLetr()+
                    " where Rider_ID='"+riderDetails.getRiderID()+"'";

            System.out.println(query);
            int value = stmt.executeUpdate(query);

            if (value > 0) {

                result = true;

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            result = false;
        } finally {
            if (con != null) {
                DatabaseManager.con_close(con);
            }
            if (stmt != null) {
                DatabaseManager.stmt_close(stmt);
            }
        }
        return result;
    }



}

