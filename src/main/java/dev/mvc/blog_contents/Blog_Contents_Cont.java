package dev.mvc.blog_contents;

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
}
