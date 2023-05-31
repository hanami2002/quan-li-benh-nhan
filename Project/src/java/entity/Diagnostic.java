/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import com.google.gson.Gson;
import java.util.Date;

/**
 *
 * @author Hanami
 */
public class Diagnostic {
    private int did;
    private int pid;
    private String symptom;
    private String diagnosis;
    private String medicines;
    private boolean wardRequired;
    private String createBy;
    private Date createAt;
    
    public Diagnostic() {
    }

    public Diagnostic(int did, int pid, String symptom, String diagnosis, String medicines, boolean wardRequired, String createBy, Date createAt) {
        this.did = did;
        this.pid = pid;
        this.symptom = symptom;
        this.diagnosis = diagnosis;
        this.medicines = medicines;
        this.wardRequired = wardRequired;
        this.createBy = createBy;
        this.createAt = createAt;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getSymptom() {
        return symptom;
    }

    public void setSymptom(String symptom) {
        this.symptom = symptom;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getMedicines() {
        return medicines;
    }

    public void setMedicines(String medicines) {
        this.medicines = medicines;
    }

    public boolean isWardRequired() {
        return wardRequired;
    }

    public void setWardRequired(boolean wardRequired) {
        this.wardRequired = wardRequired;
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
    public String toJSON() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }

    @Override
    public String toString() {
        return "Diagnostic{" + "did=" + did + ", pid=" + pid + ", symptom=" + symptom + ", diagnosis=" + diagnosis + ", medicines=" + medicines + ", wardRequired=" + wardRequired + ", createBy=" + createBy + ", createAt=" + createAt + '}';
    }


}
