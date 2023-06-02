    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
     */
    package utils;

    import dao.PaitnetDAO;

    /**
     *
     * @author Hanami
     */
    public class Paging {

        PaitnetDAO pdao = new PaitnetDAO();
        final int totalPaitnet = pdao.countPaitnet();
        public final int perPage = 10;

        public final int totalPage = (totalPaitnet % perPage == 0 ? totalPaitnet / perPage : totalPaitnet / perPage + 1);

    }
