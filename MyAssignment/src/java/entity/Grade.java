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
    private Double PT1;
    private Double PT2;
    private Double assignment;
    private Double lab1;
    private Double lab2;
    private Double lab3;
    private Double lab4;
    private Double lab5;
    private Double PE;
    private Double FE;

    public Grade() {
    }

    public Grade(int gid, int eid, Double PT1, Double PT2, Double assignment, Double lab1, Double lab2, Double lab3, Double lab4, Double lab5, Double PE, Double FE) {
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

    public Double getPT1() {
        return PT1;
    }

    public void setPT1(Double PT1) {
        this.PT1 = PT1;
    }

    public Double getPT2() {
        return PT2;
    }

    public void setPT2(Double PT2) {
        this.PT2 = PT2;
    }

    public Double getAssignment() {
        return assignment;
    }

    public void setAssignment(Double assignment) {
        this.assignment = assignment;
    }

    public Double getLab1() {
        return lab1;
    }

    public void setLab1(Double lab1) {
        this.lab1 = lab1;
    }

    public Double getLab2() {
        return lab2;
    }

    public void setLab2(Double lab2) {
        this.lab2 = lab2;
    }

    public Double getLab3() {
        return lab3;
    }

    public void setLab3(Double lab3) {
        this.lab3 = lab3;
    }

    public Double getLab4() {
        return lab4;
    }

    public void setLab4(Double lab4) {
        this.lab4 = lab4;
    }

    public Double getLab5() {
        return lab5;
    }

    public void setLab5(Double lab5) {
        this.lab5 = lab5;
    }

    public Double getPE() {
        return PE;
    }

    public void setPE(Double PE) {
        this.PE = PE;
    }

    public Double getFE() {
        return FE;
    }

    public void setFE(Double FE) {
        this.FE = FE;
    }

    public double getTotalGrade(Grade grade) {
        return (grade.getPT1() + grade.getPT2()) * 1 / 10 + grade.getAssignment() * 2 / 10
                + (grade.getLab1() + grade.getLab2() + grade.getLab3() + grade.getLab4() + grade.getLab5()) * 1.5 / 10
                + grade.getPE() * 2.5 / 10 + grade.getFE() * 3 / 10;
    }

    public String checkStatusGrade(Grade g) {
        if (g.getPT1() == null || g.getPT2() == null || g.getAssignment() == null
                || g.getLab1() == null || g.getLab2() == null || g.getLab3() == null
                || g.getLab4() == null || g.getLab5() == null || g.getPE() == null || g.getFE() == null) {
            return "studying";
        } else if ((g.getPT1() + g.getPT2()) == 0
                || g.getAssignment() == 0
                || g.getLab1() + g.getLab2() + g.getLab3() + g.getLab4() + g.getLab5() == 0
                || g.getPE() == 0 
                || g.getFE() == 0
                || getTotalGrade(g) < 5) {
            return "not passed";
        } else {
            return "passed";
        }
    }

}
