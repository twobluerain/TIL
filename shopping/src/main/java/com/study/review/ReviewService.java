package com.study.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
  
  int create(ReviewDTO ReviewDTO);
  
  List<ReviewDTO> list(Map map);

  ReviewDTO read(int rnum);
 
  int update(ReviewDTO ReviewDTO); 
  
  int delete(int rnum);

  int total(int contentsno);

  int bdelete(int contentsno);

 int rcount(int contentsno);

}
