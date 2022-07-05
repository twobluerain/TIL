package com.study.review;
 
import java.util.List;
import java.util.Map;
 
public interface ReviewMapper {
 
   int create(ReviewDTO ReviewDTO);
 
   List<ReviewDTO> list(Map map);
 
   ReviewDTO read(int rnum);
  
   int update(ReviewDTO ReviewDTO); 
   
   int delete(int rnum);
 
   int total(int bbsno);

   int bdelete(int bbsno);

  int rcount(int bbsno);

}