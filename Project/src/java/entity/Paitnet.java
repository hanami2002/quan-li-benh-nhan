/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Calendar;
import java.util.Date;
import com.google.gson.Gson;

/**
 *
 * @author Hanami
 */
public class Paitnet {

    private int id;
    private String name;
    private String address;
    private Date dob;
    private String contact;
    private String createBy;
    private Date createAt;

    public Paitnet() {
    }

    public Paitnet(int id, String name, String address, Date dob, String contact, String createBy, Date createAt) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.dob = dob;
        this.contact = contact;
        this.createBy = createBy;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

//    public int getAge() {
//        long millis = System.currentTimeMillis();
//        Date date = new Date(millis);
//        Calendar birthCalendar = Calendar.getInstance();
//        birthCalendar.setTime(date);
//
//        Calendar currentCalendar = Calendar.getInstance();
//        currentCalendar.setTime(getDob());
//         // Trừ năm sinh từ năm hiện tại
//        int age = currentCalendar.get(Calendar.YEAR) - birthCalendar.get(Calendar.YEAR);
//
//        // Kiểm tra nếu ngày hiện tại trước ngày sinh trong cùng một năm
//        // hoặc cùng ngày sinh nhưng sau giờ hiện tại, giảm tuổi đi 1
//        if (currentCalendar.get(Calendar.MONTH) < birthCalendar.get(Calendar.MONTH)
//                || (currentCalendar.get(Calendar.MONTH) == birthCalendar.get(Calendar.MONTH)
//                && currentCalendar.get(Calendar.DAY_OF_MONTH) < birthCalendar.get(Calendar.DAY_OF_MONTH))) {
//            age--;
//        }
//        return age;
//    }

    @Override
    public String toString() {
        return "{" + "id: " + id + ",name:" + name + ",address:" + address + ",dob:" + dob + ",contact:" + contact + ",createBy:" + createBy + ",createAt:" + createAt + '}';
    }
    public String toJSON() {
        Gson gson = new Gson();
        return gson.toJson(this);   
    } 
}

       



