package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.LecturePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/lecture/")
public class LectureController {
    @Autowired
    private LectureService lectureService;
    @Autowired
    private CurriculumService curriculumService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private UserService userService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private StudyInfoService studyInfoService;

    @GetMapping("list")
    private String lectureList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String subject = request.getParameter("scode");

        LecturePage page = new LecturePage();
        page.setScode(subject);                                  // 과목 데이터 SET
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = lectureService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<LectureVO> lectureList = lectureService.lectureList(page);
        List<Subject> subjects = lectureService.subjects();

        model.addAttribute("lectureList", lectureList);         //강의목록
        model.addAttribute("subjects", subjects);               //과목 목록
        model.addAttribute("curPage", curPage);                 // 현재 페이지
        model.addAttribute("curSubject", subject);              // 현재 과목
        model.addAttribute("page", page);                       // 페이징 데이터

        return "/lecture/lectureList";
    }

    @GetMapping("detail")
    public String lectureDetail(@RequestParam String lcode, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        LectureVO lecture = lectureService.lectureDetail(request.getParameter("lcode"));
        //강의 목록에서 사용자가 사용자가 선택한 게시물이 속해 있는 페이지
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        // 후기 목록의 페이지
        int reviewPage = request.getParameter("reviewPage") != null ? Integer.parseInt(request.getParameter("reviewPage")) : 1;
        // 후기 페이징 처리
        LecturePage page = new LecturePage();
        int total = reviewService.getCount(page);
        page.setLcode(lcode);
        page.makeBlock(reviewPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(reviewPage, total);

        List<Curriculum> curriList = curriculumService.curriculumList(lcode);
        List<Review> reviewList = reviewService.reviewList(page);

        model.addAttribute("detail", lecture);
        model.addAttribute("curriList", curriList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("scode", request.getParameter("scode"));
        model.addAttribute("reviewPage", reviewPage);
        model.addAttribute("curPage", curPage);
        return "/lecture/lectureDetail";
    }

    @RequestMapping(value="reviewInsert", method= RequestMethod.POST)
    public String reviewInsert(Review review, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        review.setId((String) session.getAttribute("sid"));
        reviewService.reviewInsert(review);
        String lcode = request.getParameter("lcode");
        return  "redirect:/lecture/review?lcode="+lcode;

    }

    @GetMapping("register")
    public String register(@RequestParam String lcode, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = userService.getUser((String) session.getAttribute("sid"));
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);
        model.addAttribute("user", user);
        return "/lecture/registerInsert";
    }

    @GetMapping("register2")
    public String register2(@RequestParam String lcode, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = userService.getUser((String) session.getAttribute("sid"));
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);
        model.addAttribute("user", user);
        return "/lecture/registerInsertPage";
    }

    @GetMapping("registered")
    public String registered(@RequestParam String lcode, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        User user = userService.getUser((String) session.getAttribute("sid"));
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);
        model.addAttribute("user", user);
        return "/lecture/registered";
    }

    @GetMapping(value="registerInsert")
    public String registerInsert(@RequestParam String lcode, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        String result = registerService.registerInsert(id, lcode);

        rttr.addFlashAttribute("msg", result);

        return "redirect:/lecture/detail?lcode=" + lcode;
    }

    @GetMapping(value="registerInsert2")
    public String registerInsert2(@RequestParam String lcode, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        String result = registerService.registerInsert(id, lcode);

        rttr.addFlashAttribute("msg", result);

        return "redirect:/lecture/detail?lcode=" + lcode;
    }

    @GetMapping("player")
    public String player(@RequestParam int ccode, HttpServletRequest request, Model model) throws Exception {

        Curriculum curriculum = curriculumService.curriculumDetail(ccode);
        model.addAttribute("curriculum", curriculum);

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");
        StudyInfo studyInfo = studyInfoService.studyInfoDetail(sid, ccode);
        model.addAttribute("studyInfo", studyInfo);

        // 동영상 시청 시작
        userService.updateIsStudy(sid, true);

        return "/lecture/player";
    }

    @PostMapping("closeLecture")
    @Transactional
    public void closeLecture(StudyInfo studyInfo, HttpServletRequest request, Model model) throws Exception {

        // 동영상 시청 종료
        HttpSession session = request.getSession();
        userService.updateIsStudy((String) session.getAttribute("sid"), false);

        // 동영상 시청 위치 저장
        studyInfo.setId((String) session.getAttribute("sid"));
        studyInfoService.studyInfoInsert(studyInfo);
    }
}
