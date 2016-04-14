package com.Data;

import com.Controller.ExceptionInvalidPassword;
import com.Controller.Hasher;
import com.Entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Chathumini.
 */
public class AdminLoginDAO {

    /**
     * Authenticates the system user.
     * @param user Object of User class
     * @return
     */
    public int authLogin(User user){
        int status = 0;

        String salt="";
        String password="";
        String permission="";

        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        try {
            con= DatabaseManager.con();
            stmt=con.createStatement();
            String query="SELECT password,salt,permission FROM q_user u,q_user_group ug WHERE u.username='"+user.getUsername()+"' AND u.user_group_id=ug.user_group_id AND u.status='1' ";
            rs=stmt.executeQuery(query);
            if (rs.next()){
                password=rs.getString("password");
                salt=rs.getString("salt");
                permission=rs.getString("permission");
               // System.out.print(new Hasher().hashIt(user.getPassword()+salt));

                if(password.equals(new Hasher().hashIt(user.getPassword() + salt))){
                    status=Integer.parseInt(permission);

                }else{
                    status=0;
                    throw new ExceptionInvalidPassword("invalid password");
                }

            }else{
                status=0;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            if (rs!=null){
                DatabaseManager.rs_close(rs);
            }if (stmt!=null){
                DatabaseManager.stmt_close(stmt);
            }if (con!=null){
                DatabaseManager.con_close(con);
            }
        }

        return status;
    }

}


