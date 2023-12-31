package kr.ed.haebeop.controller;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.service.NoticeService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
@Controller
@RequestMapping("/notice/*")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @GetMapping("list")
    private String NoticeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET
        // 페이징에 필요한 데이터 저장
        int total = noticeService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);          // 공지사항 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("page", page);                   // 페이징 데이터
        return "/notice/noticeList";
    }
    @GetMapping("detail")	//notice/detail.do?seq=1
    public String getNoticeDetail(@RequestParam int seq, HttpServletRequest request, Model model) throws Exception {
        Notice detail = noticeService.noticeDetail(seq);
        model.addAttribute("detail", detail);
        return "/notice/noticeDetail";
    }

    @GetMapping("insert")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/notice/noticeInsert";
    }
    @PostMapping("insert")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception {
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeInsert(notice);
        return "redirect:list";
    }
    @GetMapping("delete")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        noticeService.noticeDelete(seq);
        return "redirect:list";
    }
    @GetMapping("edit")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Notice detail = noticeService.noticeDetail(seq);
        model.addAttribute("detail", detail);
        return "/notice/noticeEdit";
    }
    @PostMapping("edit")
    public String noticeEdit(Notice notice, HttpServletRequest request, Model model) throws Exception {
        noticeService.noticeEdit(notice);
        return "redirect:list";
    }
}