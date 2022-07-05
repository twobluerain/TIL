package com.study.orders;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.orders.OrderServiceImpl")
public class OrderServiceImpl implements OrderService {
  
  @Autowired
  private OrderMapper mapper;

  @Override
  public void create(OrdersDTO dto) throws Exception {

    mapper.createOrder(dto); //dto에 orderno가 들어온다.
    int orderno = dto.getOrderno();
    System.out.println(orderno);
    
    List<OrderdetailDTO> list = dto.getList();
    
    for(int i=0; i<list.size(); i++) {
      OrderdetailDTO odto = list.get(i);
      odto.setOrderno(orderno);
      System.out.println(odto);
      mapper.createDetail(odto);
      
    }
    
  }

  @Override
  public List<OrdersDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public int updateState(Map map) {
    // TODO Auto-generated method stub
    return mapper.updateState(map);
  }
  

}
