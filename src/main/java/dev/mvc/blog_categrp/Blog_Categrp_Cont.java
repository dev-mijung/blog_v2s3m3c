package dev.mvc.blog_categrp;

import java.util.HashMap;
import java.util.List;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Blog_Categrp_Cont {
  @Autowired
  @Qualifier("dev.mvc.blog_categrp.Blog_Categrp_Proc")
  
  private Blog_Categrp_ProcInter blog_Categrp_Proc;
  
  public Blog_Categrp_Cont() {
    System.out.println("--> Blog_Categrp_Cont created.");
  }
  
  // http://localhost:9090/myhome/blog_categrp/create.do
  /**
   * ī�װ� �׷� ��� ��
   * @return
   */
  @RequestMapping(value="/blog_categrp/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_categrp/create");
    return mav;
  }
  
  /**
   * ī�װ� �׷� ��� ó��
   * @param blog_Categrp_VO
   * @return
   */
  @RequestMapping(value="/blog_categrp/create.do", method=RequestMethod.POST)
      public ModelAndView categrp_create(Blog_Categrp_VO blog_Categrp_VO) {
      
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.blog_Categrp_Proc.categrp_create(blog_Categrp_VO);
      
      mav.addObject("cnt", cnt);
      mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
      
      mav.setViewName("/blog_categrp/create_msg");
      
      return mav;
  }
  
////http://localhost:9090/myhome/blog_categrp/list.do
//  /**
//   * ��ü���(�˻�����)
//   * @return
//   */
//  @RequestMapping(value="/blog_categrp/list.do", method=RequestMethod.GET)
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    List<Blog_Categrp_VO> list = this.blog_Categrp_Proc.list_blog_seqno_asc();
//    
//    mav.addObject("list", list);
//    mav.setViewName("/blog_categrp/list");
//    
//    return mav;
//  }
 
//http://localhost:9090/myhome/blog_categrp/read_update.do?blog_categrpno=1
  /**
   * ��� + ����  ��
   * @param blog_categrpno
   * @return
   */
  @RequestMapping(value="/blog_categrp/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(@RequestParam(value="blog_categrpno", defaultValue="1") int blog_categrpno,
                                                   @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("blog_categrpno", blog_categrpno); // #{blog_categrpno}
    map.put("nowPage",nowPage); // �������� ��� �� ���ڵ带 �����ϱ� ���� ���
    
    // �˻� ���
    List<Blog_Categrp_VO> list = this.blog_Categrp_Proc.list_paging(map);
    mav.addObject("list",list);
    
    // �˻� �� ���ڵ� ����
    int search_count = this.blog_Categrp_Proc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_categrpno);
    mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
    
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param blog_categrpno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = this.blog_Categrp_Proc.pagingBox("read_update.do", blog_categrpno, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    Blog_Categrp_VO blog_Categrp_VO_2 = this.blog_Categrp_Proc.read(blog_categrpno);
    List<Blog_Categrp_VO> list_2 = this.blog_Categrp_Proc.list_blog_seqno_asc();
    
    mav.addObject("blog_Categrp_VO_2",blog_Categrp_VO_2);
    mav.addObject("list_2", list_2);
    
    mav.setViewName("/blog_categrp/read_update");
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param blog_Categrp_VO
   * @return
   */
  @RequestMapping(value="/blog_categrp/read_update.do", method=RequestMethod.POST)
    public ModelAndView read_update(Blog_Categrp_VO blog_Categrp_VO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Categrp_Proc.update(blog_Categrp_VO);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_categrp/list.do");
    } else {
      mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
      mav.setViewName("/blog_categrp/read_update_msg");
    }
    return mav;
  }
  
//http://localhost:9090/myhome/blog_categrp/read_delete.do?blog_categrpno=1
  /** 
   * ��� + ���� ��
   * @param blog_categrpno
   * @return
   */
  @RequestMapping(value="/blog_categrp/read_delete.do", method=RequestMethod.GET)
    public ModelAndView read_delete(@RequestParam(value="blog_categrpno", defaultValue="1") int blog_categrpno,
                                                    @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("blog_categrpno", blog_categrpno); // #{blog_categrpno}
    map.put("nowPage",nowPage); // �������� ��� �� ���ڵ带 �����ϱ� ���� ���
    
    // �˻� ���
    List<Blog_Categrp_VO> list = this.blog_Categrp_Proc.list_paging(map);
    mav.addObject("list",list);
    
    // �˻� �� ���ڵ� ����
    int search_count = this.blog_Categrp_Proc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_categrpno);
    mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
    
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param blog_categrpno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = this.blog_Categrp_Proc.pagingBox("read_delete.do", blog_categrpno, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/blog_categrp/read_delete");
    
    return mav;
  }
  
  /** 
   * ���� ó��
   * @param blog_categrpno
   * @return
   */
  @RequestMapping(value="/blog_categrp/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int blog_categrpno) {
    ModelAndView mav = new ModelAndView();
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_categrpno);
    
    int cnt = this.blog_Categrp_Proc.delete(blog_categrpno);
    
    if(cnt==1) {
      mav.setViewName("redirect:/blog_categrp/list.do");
    } else {
      mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
      mav.setViewName("/blog_categrp/read_delete_msg");
    }
    return mav;
  }
  
  /**
   * �켱���� ���� up 10 �� 1 
   * @param blog_categrp_no
   * @return
   */
  @RequestMapping(value="/blog_categrp/update_seqno_up", method=RequestMethod.GET)
    public ModelAndView update_seqno_up(int blog_categrpno) {
    ModelAndView mav = new ModelAndView();
    
    
    int cnt = this.blog_Categrp_Proc.update_seqno_up(blog_categrpno);
    
    if(cnt==1) {
      mav.setViewName("redirect:/blog_categrp/list.do");
    } 
    
    return mav;
  }
  
  /**
   * �켱���� ���� up 10 �� 1
   * @param blog_categrpno
   * @return
   */
  @RequestMapping(value="/blog_categrp/update_seqno_down", method=RequestMethod.GET)
    public ModelAndView update_seqno_down(int blog_categrpno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Categrp_Proc.update_seqno_down(blog_categrpno);
    
    if(cnt==1) {
      mav.setViewName("redirect:/blog_categrp/list.do");
    }
    return mav;
  }
  
  /**
   * ��� ����� ����
   * @param blog_Categrp_VO
   * @return
   */
  @RequestMapping(value="/blog_categrp/update_visible.do", method=RequestMethod.GET)
    public ModelAndView update_visible(Blog_Categrp_VO blog_Categrp_VO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Categrp_Proc.update_visible(blog_Categrp_VO);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_categrp/list.do");
    }
    return mav;
  }
  
  /**
   * ����¡ ���
   * @param blog_categrpno
   * @param nowPage
   * @return
   */
  @RequestMapping(value="/blog_categrp/list.do", method=RequestMethod.GET)
    public ModelAndView list_paging(@RequestParam(value="blog_categrpno", defaultValue="1") int blog_categrpno,
                                                   @RequestParam(value="nowPage", defaultValue="1") int nowPage
                                                  ) {
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("blog_categrpno", blog_categrpno); // #{blog_categrpno}
    map.put("nowPage",nowPage); // �������� ��� �� ���ڵ带 �����ϱ� ���� ���
    
    // �˻� ���
    List<Blog_Categrp_VO> list = this.blog_Categrp_Proc.list_paging(map);
    mav.addObject("list",list);
    
    // �˻� �� ���ڵ� ����
    int search_count = this.blog_Categrp_Proc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_categrpno);
    mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
    
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param blog_categrpno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = this.blog_Categrp_Proc.pagingBox("list.do", blog_categrpno, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/blog_categrp/list_paging");   
    
    return mav;
  }
}
