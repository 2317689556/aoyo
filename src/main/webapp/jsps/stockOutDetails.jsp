<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>千佛山医院管理系统 出库单__详情</title>
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap/table/bootstrap-table.js"></script>
    <script src="/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/cxCalendar/js/jquery.cxcalendar.js"></script>
    <script src="/cxCalendar/js/jquery.cxcalendar.languages.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-tab.css">
    <link rel="stylesheet" href="/cxCalendar/css/jquery.cxcalendar.css">


    <script>

        /*签批*/
        function pizhu(id) {
            var msg = "您真的确定要签批吗？\n\n请确认！";
            if (confirm(msg)==true){
                return updatepQP(id);
            }else{
                return false;
            }
        }
        function updatepQP(id) {

            $.ajax({
                url:"/Stockup/updateQianpi?id="+id,
                type:"json",
                success:function () {
                    
                }
            })

            window.location="/jsps/stockOut.jsp";
        }

        /*驳回*/
        function bohui(id) {
            var msg = "您真的确定要驳回吗？\n\n请确认！";
            if (confirm(msg)==true){
                return updateBh(id);
            }else{
                return false;
            }
        }

        function updateBh(id) {
            $.ajax({
                url:"/Stockup/updateBohui?id="+id,
                type:"json",
                success:function () {

                }
            })
            window.location="/jsps/stockOut.jsp";
        }


    </script>




</head>

<body>
<c:import url="utlis/background.jsp"/>
<c:import url="utlis/broadside.jsp"/>
<div style="width: 1300px; height: 800px; border:1px solid rgba(0,0,0,0.6); float: left; margin: 50px 0px 0px 60px; box-shadow: 0 0 8px black;">
    <h3 style="margin-bottom: 40px">采购申请</h3>

    <div style="margin: 40px; margin-top: 20px; box-shadow: 0 0 4px black; height: 620px; padding: 10px">
        <table class="table table-striped table-bordered table-hover" id="sample-table">

            <tr>
                <div style="margin: 20px">
                    <div style="text-align: left;float: left">
                        <span>厂家：${list1.manufacturer}</span>
                    </div>

                    <div style="clear: both"></div>

                    <div style="clear: both ; margin-top: 10px">
                        <div style="text-align: left;float: left">
                            <span>申请人：${list1.proposer}</span>
                        </div>
                        <div style="margin-left: 790px">
                            <span >申请日期：${list1.signDate}</span>
                        </div>
                    </div>

                </div>
            </tr>
            <thead>
            <tr>
                <th width="80">序号</th>
                <th width="200px">品名</th>
                <th width="220px">型号</th>
                <th width="150px">规格</th>
                <th width="250px">单位</th>
                <th width="160px">数量</th>
                <th width="180px">单价</th>
                <th width="180px">金额</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.model}</td>

                    <td>${p.specification}</td>
                    <td>${p.unit}</td>
                    <td>${p.count}</td>
                    <td>${p.unitPrice}</td>
                    <td>${p.money}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5">合计：${list1.moneys}</td>
                <td colspan="4">大写：${list1.name}</td>
            </tr>
            <tr>
                <td colspan="5">制单：${list1.number}</td>
                <td colspan="4">审核：${list1.salesman}</td>
            </tr>
            <c:if test="${list1.signState==3}">
            <tr>
                <td colspan="9">驳回原因：${list1.rejected}</td>
            </tr>
            </c:if>
            </tbody>
        </table>
        <c:if test="${list1.signState==1}">
        <%--未签批--%>
        <div style="margin-left:1077px;margin-top: 50px;">
            <input type="button"class="btn btn-success" onclick="pizhu(${list1.id})" value="签批">&nbsp;&nbsp;&nbsp;<input type="button"onclick="bohui(${list1.id})" class="btn btn-danger" value="驳回">
        </div>
        </c:if>
        <%--已签批--%>
        <c:if test="${list1.signState==2}">
        <div  style="margin-left:1030px;margin-top: 50px;">
            <input type="button"class="btn btn-success" value="生成入库单">&nbsp;&nbsp;&nbsp;<a href="/jsps/stockOut.jsp"><input type="button"class="btn btn-info" value="返回"></a>
        </div>
        </c:if>
        <%--已驳回--%>
        <c:if test="${list1.signState==3}">
            <div  style="margin-left:1137px;margin-top: 50px;">
                <a href="/jsps/stockOut.jsp"><input type="button"class="btn btn-info" value="返回"></a>
            </div>
        </c:if>
        <%--未入库--%>
        <c:if test="${list1.signState==4}">
            <div  style="margin-left:1043px;margin-top: 50px;">
                <input type="button"class="btn btn-primary" value="入库扫码">&nbsp;&nbsp;&nbsp;<a href="/jsps/stockOut.jsp"><input type="button"class="btn btn-info" value="返回"></a>
            </div>
        </c:if>
        <%--已入库--%>
        <c:if test="${list1.signState==5}">
            <div  style="margin-left:1077px;margin-top: 50px;">
                <input type="button" class="btn btn-success" value="打印">&nbsp;&nbsp;&nbsp;<a href="/jsps/stockOut.jsp"><input type="button"class="btn btn-info" value="返回"></a>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>