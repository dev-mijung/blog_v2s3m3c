package dev.mvc.blog_contents;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Blog_Contents_Cont {
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
}
