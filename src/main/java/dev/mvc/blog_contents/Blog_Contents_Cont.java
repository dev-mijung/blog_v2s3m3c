package dev.mvc.blog_contents;

import java.util.HashMap;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.blog_cate.Blog_Cate_ProcInter;
import dev.mvc.blog_cate.Blog_Cate_VO;
import dev.mvc.blog_categrp.Blog_Categrp_ProcInter;
import dev.mvc.blog_categrp.Blog_Categrp_VO;

@Controller
public class Blog_Contents_Cont {
  @Autowired
  @Qualifier("dev.mvc.blog_categrp.Blog_Categrp_Proc")
   private Blog_Categrp_ProcInter blog_Categrp_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.blog_cate.Blog_Cate_Proc")
   private Blog_Cate_ProcInter blog_Cate_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.blog_contents.Blog_Contents_Proc")
   private Blog_Contents_ProcInter Blog_Contents_Proc;
  
  public Blog_Contents_Cont() {
    System.out.println("--> Blog_Contents_Cont created.");
  }
  
  
  /**
   * ÄÁÅÙÃ÷ µî·Ï Æû
   * @return
   */
  @RequestMapping(value="/blog_contents/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_contents/create");
    
    return mav;
  }
  
  /**
   * ÄÁÅÙÃ÷ µî·Ï Ã³¸®
   * @param blog_Contents_VO
   * @return
   */
  @RequestMapping(value="/blog_contents/create.do", method=RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, Blog_Contents_VO blog_Contents_VO) {
    ModelAndView mav = new ModelAndView();
    
    blog_Contents_VO.setIp(request.getRemoteAddr()); // Á¢¼ÓÀÚ IP ÀÚµ¿»êÃâ
    
    int cnt = this.Blog_Contents_Proc.create(blog_Contents_VO);
    mav.addObject("cnt",cnt);
    mav.setViewName("/blog_contents/create_msg");
    
    return mav;
  }
  
  /**
   * ÄÁÅÙÃ÷ ÀüÃ¼¸ñ·Ï
   * @return
   */
  @RequestMapping(value="/blog_contents/list_all.do", method=RequestMethod.GET)
    public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    List<Blog_Contents_VO> list_all = this.Blog_Contents_Proc.list_all();
    mav.addObject("list_all", list_all);
    mav.setViewName("/blog_contents/list_all");
    
    return mav;
  }
  
  // http://localhost:9090/myhome/blog_contents/read.do?contents_no=2
  /**
   * ÄÁÅÙÃ÷ 1°Ç Á¶È¸
   * @param contents_no
   * @return
   */
  @RequestMapping(value="/blog_contents/read.do", method=RequestMethod.GET)
    public ModelAndView read(int contents_no) {
    ModelAndView mav = new ModelAndView();
    
    Blog_Contents_VO blog_Contents_VO = this.Blog_Contents_Proc.read(contents_no);
    mav.addObject("blog_Contents_VO", blog_Contents_VO);
    
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(blog_Contents_VO.getCate_no());
    mav.addObject("blog_Cate_VO", blog_Cate_VO);
    
    Blog_Categrp_VO blog_Categrp_VO = this.blog_Categrp_Proc.read(blog_Cate_VO.getBlog_categrpno());
    mav.addObject("blog_Categrp_VO", blog_Categrp_VO);
    
    mav.setViewName("/blog_contents/read");
    return mav;
  }
  
  /**
   * ºí·Î±× ÄÁÅÙÃ÷ ¼öÁ¤ Æû
   * @return
   */
  @RequestMapping(value="/blog_contents/update.do", method=RequestMethod.GET)
    public ModelAndView update(int contents_no) {
    
    ModelAndView mav = new ModelAndView();
    
    Blog_Contents_VO blog_Contents_VO = this.Blog_Contents_Proc.read(contents_no);
    mav.addObject("blog_Contents_VO", blog_Contents_VO);
    
    mav.setViewName("/blog_contents/update");
    
    return mav;
  }
  
  /**
   * ºí·Î±× ÄÁÅÙÃ÷ ¼öÁ¤ Ã³¸®
   * @param blog_Contents_VO
   * @return
   */
  @RequestMapping(value="/blog_contents/update.do", method=RequestMethod.POST)
    public ModelAndView update(Blog_Contents_VO blog_Contents_VO) {
    
    ModelAndView mav = new ModelAndView();
    
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(blog_Contents_VO.getCate_no());
    mav.addObject("cate_no",blog_Cate_VO.getCate_no());
    mav.addObject("contents_no",blog_Contents_VO.getContents_no());
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("contents_no", blog_Contents_VO.getContents_no());
    map.put("contents_passwd", blog_Contents_VO.getContents_passwd());
    
    int passwd_cnt =0; // ÆÐ½º¿öµå ÀÏÄ¡ ·¹ÄÚµå °¹¼ö
    int cnt = 0; // ¼öÁ¤ µÈ ·¹ÄÚµå °¹¼ö
    
    passwd_cnt = this.Blog_Contents_Proc.passwd_check(map);
    
    if(passwd_cnt == 1) { // ÆÐ½º¿öµå ÀÏÄ¡
      cnt = this.Blog_Contents_Proc.update(blog_Contents_VO);
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("passwd_cnt", passwd_cnt);
    
    if(cnt == 1 && passwd_cnt == 1) {
      mav.setViewName("/blog_contents/update_msg");
    } else {
      mav.setViewName("/blog_contents/update_msg");
    }
    return mav;
  }
  
  /**
   * ºí·Î±× ÄÁÅÙÃ÷ »èÁ¦ Æû
   * @param cate_no
   * @param contents_no
   * @return
   */
  @RequestMapping(value="/blog_contents/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(int cate_no, int contents_no) {
    ModelAndView mav = new ModelAndView();
    
    Blog_Contents_VO blog_Contents_VO = this.Blog_Contents_Proc.read(contents_no);
    mav.addObject("blog_Contents_VO", blog_Contents_VO);
    
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(blog_Contents_VO.getCate_no());
    mav.addObject("blog_Cate_VO", blog_Cate_VO);
    mav.addObject("cate_no", blog_Cate_VO.getCate_no());
    
    mav.setViewName("/blog_contents/delete");
    return mav;
  }
  /**
   * ºí·Î±× ÄÁÅÙÃ÷ »èÁ¦ Ã³¸®
   * @param contents_no
   * @return
   */
  @RequestMapping(value="/blog_contents/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int contents_no, String contents_passwd) {
    ModelAndView mav = new ModelAndView();
    
    Blog_Contents_VO blog_Contents_VO = this.Blog_Contents_Proc.read(contents_no);
    mav.addObject("blog_Contents_VO", blog_Contents_VO);
    
    Blog_Cate_VO blog_Cate_VO = this.blog_Cate_Proc.read(blog_Contents_VO.getCate_no());
    mav.addObject("blog_Cate_VO", blog_Cate_VO);
    mav.addObject("cate_no", blog_Cate_VO.getCate_no());
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("contents_no", contents_no);
    map.put("contents_passwd", contents_passwd);
    
    int cnt = 0;
    int passwd_cnt = 0;
    
    passwd_cnt = this.Blog_Contents_Proc.passwd_check(map);
    
    if(passwd_cnt==1) {
    cnt = this.Blog_Contents_Proc.delete(contents_no);
    }
    
    mav.addObject("cnt",cnt);
    mav.addObject("passwd_cnt", passwd_cnt);
    
    if(cnt == 1 && passwd_cnt == 1) {
      mav.setViewName("/blog_contents/delete_msg");
    } else {
      mav.setViewName("/blog_contents/delete_msg");
    }
    return mav;
  }
}
