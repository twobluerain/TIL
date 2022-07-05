package com.study.orders;

import java.util.List;

import lombok.Data;

@Data
public class OrdersDTO {
  private int orderno;
  private String id;
  private String mname;
  private String odate;
  private String ostate;
  private int total;
  private String payment;
  private String reqtext;

  private List<OrderdetailDTO> list;
}