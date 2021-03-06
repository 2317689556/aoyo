package spring.dao;

import org.apache.ibatis.annotations.Param;
import spring.pojo.AoyoCommodityImg;
import spring.pojo.User;
import spring.pojo.AoyoCommoditySuit;
import spring.pojo.AoyoPlatformImage;
import spring.pojo.*;

import java.util.List;


public interface UserMapper {
    /*登录*/
    User login(User user);

    /*查询所有的省*/
    List<AoyoProvince> setlectedProv();

    List<AoyoCity> selectCity(@Param("asd") Integer asd);

    List<AoyoArea> selectAreas(@Param("asd")String asd);

    List<AoyoAddressLabel> selectAddLabelAll();

    int addressInsert(AoyoAddress aoyoAddress);
    /*轮播图查询*/
    List<AoyoCommodityImg> lunbo();

    /*活动图片查询*/
    List<AoyoPlatformImage> huodong();

    /*保养套餐查询*/
    List<AoyoCommoditySuit> taocan();

    /*优惠券查询*/
    List<AoyoCoupon> youhuiquan();

    /*首页分类查询*/
    List<AoyoPanel> fenlei();

    /*购物车列表查询*/
    List<Goshopping> goshopping();

    /*关注商品查询*/
    List<GuanZhuShop> guanzhushop();

    /*个人中心优惠券查询*/
    List<AoyoCoupon> myyouhuiquan();


    AoyoCustom moblieLogin(@Param("mobile") String mobile);

    AoyoCustom selectByCustom(String customId);

    int successCustomUp(AoyoCustom aoyoCustom);

    List<MyAddressList> selectShowOder(@Param("customID")String customID);

    List<MyAddressList> queryCustomAddress(@Param("customId")String customId);

    /*购物车列表查询升级版*/
    List<Goshopping> goshoppings();
    int upDefaultAddress(long customId);

    int deleAddress(String addressId);

}
