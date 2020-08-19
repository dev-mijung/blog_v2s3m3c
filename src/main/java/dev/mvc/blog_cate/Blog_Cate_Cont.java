package dev.mvc.blog_cate;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.blog_categrp.Blog_Categrp_ProcInter;
import dev.mvc.blog_categrp.Blog_Categrp_VO;

@Controller
public class Blog_Cate_Cont {
  @Autowired
  @Qualifier("dev.mvc.blog_categrp.Blog_Categrp_Proc")
  private Blog_Categrp_ProcInter blog_Categrp_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.blog_cate.Blog_Cate_Proc")
  private Blog_Cate_ProcInter blog_Cate_Proc;
  
  public Blog_Cate_Cont() {
    System.out.println("--> Blog_Cate_Cont created.");
  }
  
  
  /**
   * 카테고리 등록 폼
   * @return
   */
  @RequestMapping(value="/blog_cate/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_cate/create");
    return mav;
  }
  
  /**
   * 카테고리 등록 처리
   * @param blog_Cate_VO
   * @return
   */
  @RequestMapping(value="/blog_cate/create.do", method=RequestMethod.POST)
    public ModelAndView create(Blog_Cate_VO blog_Cate_VO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.create(blog_Cate_VO);
    
    if(cnt == 1) {
     mav.setViewName("redirect:/blog_cate/list.do");
    } else {
     mav.setViewName("/blog_cate/create_msg");
    }
    return mav;
  }
  
  /**
   * 카테고리 목록
   * @return
   */
  @RequestMapping(value="/blog_cate/list.do", method=RequestMethod.GET)
    public ModelAndView list_seqno_asc() {
    ModelAndView mav = new ModelAndView();
    
    List<Blog_Cate_VO> list = this.blog_Cate_Proc.list_seqno_asc();
    mav.addObject("list", list);
    mav.setViewName("/blog_cate/list");
    
    return mav;
  }
  
  /**
   * 카테고리 수정 + 목록 폼
   * @param cate_no
   * @return
   */
  @RequestMapping(value="/blog_cate/read_update.do", method=RequestMethod.GET)
    public ModelAndView read(int cate_no) {
    
    ModelAndView mav = new ModelAndView();
    
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(cate_no);
    mav.addObject("blog_Cate_VO",blog_Cate_VO);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_Cate_VO.getBlog_categrpno());
    mav.addObject("blog_name", blog_Categrp_VO.getBlog_name());
    
    List<Blog_Cate_VO> list = this.blog_Cate_Proc.list_seqno_asc();
    mav.addObject("list",list);
    
    mav.setViewName("/blog_cate/read_update");
    
    return mav;
  }
  
  /**
   * blog_categrp + blog_cate join 전체 목록
   * @return
   */
  @RequestMapping(value="/blog_cate/list_join.do", method=RequestMethod.GET)
    public ModelAndView list_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Blog_Categrp_Cate_VO> list_join = this.blog_Cate_Proc.list_join();
    mav.addObject("list_join", list_join);
    
    mav.setViewName("/blog_cate/list_join");
    
    return mav;
  }
  
  // http://localhost:9090/myhome/blog_cate/list_join_by_blog_categrpno.do?blog_categrpno=1
  /**
   * 통합 VO 기반 join : blog_categrpno별 blog_cate 목록
   * @param blog_categrpno
   * @return
   */
  @RequestMapping(value="/blog_cate/list_join_by_blog_categrpno.do", method=RequestMethod.GET)
    public ModelAndView list_join_by_blog_categrpno(int blog_categrpno) {
    ModelAndView mav = new ModelAndView();
    
    List<Blog_Categrp_Cate_VO> list = this.blog_Cate_Proc.list_join_by_blog_categrpno(blog_categrpno);
    mav.addObject("list", list);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_categrpno);
    mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
    
    mav.setViewName("/blog_cate/list_join_by_blog_categrpno");
    return mav;
  }
  
  /**
   * 카테고리 수정 처리
   * @param blog_Cate_VO
   * @return
   */
  @RequestMapping(value="/blog_cate/read_update.do", method=RequestMethod.POST)
    public ModelAndView read(Blog_Cate_VO blog_Cate_VO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.update(blog_Cate_VO);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_cate/list.do");
    } else {
      mav.setViewName("/blog_cate/update_msg");
    }
    return mav;
  }
  
  /**
   * 카테고리 삭제 + 목록 폼
   * @param cate_no
   * @return
   */
  @RequestMapping(value="/blog_cate/read_delete.do", method=RequestMethod.GET)
      public ModelAndView read_delete(int cate_no) {
      ModelAndView mav = new ModelAndView();
      
      Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(cate_no);
      mav.addObject("blog_Cate_VO",blog_Cate_VO);
      
      Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_Cate_VO.getBlog_categrpno());
      mav.addObject("blog_name", blog_Categrp_VO.getBlog_name());
      
      List<Blog_Cate_VO> list = this.blog_Cate_Proc.list_seqno_asc();
      mav.addObject("list",list);
      
      mav.setViewName("/blog_cate/read_delete");
      
      return mav;
  }
  
  /**
   * 카테고리 삭제 처리
   * @param cate_no
   * @return
   */
  @RequestMapping(value="/blog_cate/read_delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int cate_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.delete(cate_no);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_cate/list.do");
    } else {
      mav.setViewName("/blog_cate/read_delete_msg");
    }
    return mav;
  }
  
  
  /**
   * 출력순서 상향, 10 ▷ 1
   * @param cate_no
   * @return
   */
  @RequestMapping(value="/blog_cate/update_seqno_up.do", method=RequestMethod.GET)
    public ModelAndView update_seqno_up(int cate_no) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.update_seqno_up(cate_no);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_cate/list.do");
    }
    return mav;
  }
  
  /**
   * 출력순서 하향, 1 ▷ 10
   * @param cate_no
   * @return
   */
  @RequestMapping(value="/blog_cate/update_seqno_down.do", method=RequestMethod.GET)
    public ModelAndView update_seqno_down(int cate_no) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.update_seqno_down(cate_no);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_cate/list.do");
    }
    return mav;
  }
  
  /**
   * 출력모드 변경
   * @param blog_Cate_VO
   * @return
   */
  @RequestMapping(value="/blog_cate/update_visible.do", method=RequestMethod.GET)
    public ModelAndView update_visible(Blog_Cate_VO blog_Cate_VO) {
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.blog_Cate_Proc.update_visible(blog_Cate_VO);
    
    if(cnt == 1) {
      mav.setViewName("redirect:/blog_cate/list.do");
    }
    
    return mav;
  }
}
