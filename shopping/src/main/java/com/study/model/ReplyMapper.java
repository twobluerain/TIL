package com.study.model;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {
  
  int create(ReplyDTO ReplyDTO);
  
  List<ReplyDTO> list(Map map);

  ReplyDTO read(int rnum);
 
  int update(ReplyDTO ReplyDTO); 
  
  int delete(int rnum);

  int total(int contentsno);
}
