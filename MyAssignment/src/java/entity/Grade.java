/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Grade extends BaseEntity {

    private int gid;
    private int eid;
    private double PT1;
    private double PT2;
    private double assignment;
    private double lab1;
    private double lab2;
    private double lab3;
    private double lab4;
    private double lab5;
    private double PE;
    private double FE;

    public Grade() {
    }

    public Grade(int gid, int eid, double PT1, double PT2, double assignment, double lab1, double lab2, double lab3, double lab4, double lab5, double PE, double FE) {
        this.gid = gid;
        this.eid = eid;
        this.PT1 = PT1;
        this.PT2 = PT2;
        this.assignment = assignment;
        this.lab1 = lab1;
        this.lab2 = lab2;
        this.lab3 = lab3;
        this.lab4 = lab4;
        this.lab5 = lab5;
        this.PE = PE;
        this.FE = FE;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public double getPT1() {
        return PT1;
    }

    public void setPT1(double PT1) {
        this.PT1 = PT1;
    }

    public double getPT2() {
        return PT2;
    }

    public void setPT2(double PT2) {
        this.PT2 = PT2;
    }

    public double getAssignment() {
        return assignment;
    }

    public void setAssignment(double assignment) {
        this.assignment = assignment;
    }

    public double getLab1() {
        return lab1;
    }

    public void setLab1(double lab1) {
        this.lab1 = lab1;
    }

    public double getLab2() {
        return lab2;
    }

    public void setLab2(double lab2) {
        this.lab2 = lab2;
    }

    public double getLab3() {
        return lab3;
    }

    public void setLab3(double lab3) {
        this.lab3 = lab3;
    }

    public double getLab4() {
        return lab4;
    }

    public void setLab4(double lab4) {
        this.lab4 = lab4;
    }

    public double getLab5() {
        return lab5;
    }

    public void setLab5(double lab5) {
        this.lab5 = lab5;
    }

    public double getPE() {
        return PE;
    }

    public void setPE(double PE) {
        this.PE = PE;
    }

    public double getFE() {
        return FE;
    }

    public void setFE(double FE) {
        this.FE = FE;
    }
    
    public double getTotalGrade(Grade grade){
        return (grade.getPT1()+grade.getPT2())*1/10+grade.getAssignment()*2/10
                +(grade.getLab1()+grade.getLab2()+grade.getLab3()+grade.getLab4()+grade.getLab5())*1.5/10
                +grade.getPE()*2.5/10+grade.getFE()*3/10;
    }
}
