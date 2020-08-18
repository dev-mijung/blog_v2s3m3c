package dev.mvc.blog_attachfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Blog_Attachfile_Cont {
@Autowired
@Qualifier("dev.mvc.blog_attachfile.Blog_Attachfile_Proc")
  private Blog_Attachfile_ProcInter blog_Attachfile_Proc;

  public Blog_Attachfile_Cont() {
    System.out.println("--> Blog_Attachfile_Cont created.");
  }
  
  /**
   * Ã·ºÎÆÄÀÏ µî·Ï Æû
   * @return
   */
  @RequestMapping(value="/blog_attachfile/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/blog_attachfile/create");
    return mav;
  }
}
