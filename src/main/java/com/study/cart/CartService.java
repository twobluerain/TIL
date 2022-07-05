package com.study.cart;

import java.util.List;

public interface CartService {

  int create(CartDTO dto);

  List<CartDTO> list(String id);

  void delete(int cartno);

  void deleteAll(String id);

}
