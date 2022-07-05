package com.study.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
  int create(NoticeDTO dto);
  List<NoticeDTO> list(Map map);
  int total(Map map);
  void upCnt(int noticeno);
  NoticeDTO read(int noticeno);
  int passwd(Map map);
  int update(NoticeDTO dto);
  int delete(int noticeno);
}
