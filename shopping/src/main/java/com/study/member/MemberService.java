package com.study.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
  
  MemberDTO mypage(String id);
  
  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int create(MemberDTO dto);

  int loginCheck(Map<String, String> map);

  Map getGrade(String id);

  MemberDTO read(String id);

  int update(MemberDTO dto);

  int total(Map map);

  List<MemberDTO> list(Map map);

  int updateFile(Map map);

  String idFind(Map<String, String> map);

  String pwFind(Map<String, String> map);

}