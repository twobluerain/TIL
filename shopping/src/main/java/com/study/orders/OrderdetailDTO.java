package com.study.orders;

import lombok.Data;

@Data
public class OrderdetailDTO {

  private int odno;
  private int orderno;
  private int contentsno;
  private int quantity;
  private String pname;
  private String size;
}