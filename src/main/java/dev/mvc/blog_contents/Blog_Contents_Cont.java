package dev.mvc.blog_contents;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
}
