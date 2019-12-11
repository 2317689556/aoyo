package spring.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.pojo.PickingList;
import spring.pojo.utils.Page;
import javax.annotation.Resource;
import spring.service.StockupService;

//厂商
@Controller
@RequestMapping("/Stockup")
public class StockupController {
    @Resource
    StockupService StockupService;



    //代理厂商全查
    @RequestMapping("/findStockup")
    @ResponseBody
    public PageInfo<PickingList> findStockup(Page page) {
        PageInfo<PickingList> list = StockupService.findStockup(page);
        return list;
    }
}
