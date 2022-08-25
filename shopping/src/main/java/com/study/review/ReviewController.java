package com.study.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.study.utility.Utility;

@RestController
public class ReviewController {
  private static final Logger log = LoggerFactory.getLogger(ReviewController.class);

  @Autowired
  @Qualifier("com.study.review.ReviewServiceImpl")
  private ReviewService service;

  @GetMapping("/review/list/{contentsno}/{sno}/{eno}")
  public ResponseEntity<List<ReviewDTO>> getList(
      @PathVariable("contentsno") int contentsno, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("contentsno", contentsno);

    return new ResponseEntity<List<ReviewDTO>>(service.list(map), HttpStatus.OK);
  }

  @GetMapping("/review/page")
  public ResponseEntity<String> getPage(
     int nPage, int contentsno) {

    int total = service.total(contentsno);
    String url = "read";

    int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

    String paging = Utility.rpaging(total, recordPerPage, url, nPage);

    return new ResponseEntity<>(paging, HttpStatus.OK);

  }
  
  @PostMapping("/review/create")
  public ResponseEntity<String> create(@RequestBody ReviewDTO vo) {
 
    log.info("ReviewDTO:contents " + vo.getContent());
    log.info("ReviewDTO:id " + vo.getId());
    log.info("ReviewDTO1:contentsno " + vo.getContentsno());
 
    vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
 
    int flag = service.create(vo);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/review/{rnum}")
  public ResponseEntity<ReviewDTO> get(@PathVariable("rnum") int rnum) {
 
    log.info("get: " + rnum);
 
    return new ResponseEntity<>(service.read(rnum), HttpStatus.OK);
  }
  
  @PutMapping("/review/")
  public ResponseEntity<String> modify(@RequestBody ReviewDTO vo) {

    log.info("modify: " + vo);
 
    return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @DeleteMapping("/review/{rnum}")
  public ResponseEntity<String> remove(@PathVariable("rnum") int rnum) {
 
    log.info("remove: " + rnum);
 
    return service.delete(rnum) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
}
