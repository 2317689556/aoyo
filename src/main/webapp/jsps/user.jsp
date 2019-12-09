<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>千佛山医院管理系统 用户管理</title>
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap/table/bootstrap-table.js"></script>
    <script src="/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-tab.css">
</head>

<body>
<c:import url="utlis/background.jsp"/>
<c:import url="utlis/broadside.jsp"/>
<div style="width: 1300px; height: 800px; border: 1px solid black; float: left; margin: 50px 0px 0px 60px;">
    <h3>用户管理</h3>
    <div class="page-content clearfix" id="advertising">
        <div class="sort_style">
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="ads_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加用户</a>
       </span>
            </div>
            <div class="sort_list">

                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="80">ID</th>
                        <th width="100">用户名</th>
                        <th width="180px">用户身份</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${user2}" var="user2">
                        <tr>
                            <td>${user2.id}</td>
                            <td>${user2.username}</td>
                            <td>
                                <c:if test="${user2.gradeId==1}">管理员</c:if>
                                <c:if test="${user2.gradeId==2}">库管</c:if>
                                <c:if test="${user2.gradeId==3}">路人</c:if>
                            </td>
                            <td><a>删除</a>&nbsp;&nbsp;<a>修改</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<!-- 添加的模态框（Modal） -->
<%--<div class="modal fade" id="myModalAdd2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="##" id="adduser2">
                    <div class="form-group">
                        <div class="col-sm-7" id="div01">
                            <input type="hidden" id="addareaId" name='userId'/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addusername" name="username"/>
                        </div>
                        <div class="col-sm-2">
                            <span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户身份</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="form-field-select-1" name="userRole">
                                <option>请选择</option>
                                <option value="1">管理员</option>
                                <option value="2">库管</option>
                                <option value="3">路人</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-10">
                            <button id="sendMail" onclick="addUser2()" type="button" class="btn btn-primary">提交</button>
                            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                            <button type="reset" class="btn btn-primary">重置</button>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>--%>

</html>
<%--
<script>
    /*******添加用户*********/
    $('#ads_add').on('click', function () {
        $("#myModalAdd2").modal("show");
    });
    function addUser2(){

        var form = new FormData($("#adduser2")[0]);
        $.ajax({
            //几个参数需要注意一下
            type: "post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/user/addOceanUser",//url
            data:form,
            processData:false,
            contentType:false,
            success: function (data) {

                $("#myModalAdd2").modal("hide");
                alert("添加成功");
                window.location.reload();


            },
            error : function() {
                alert("请求失败！！！！");

            }

        })



    }



</script>--%>
