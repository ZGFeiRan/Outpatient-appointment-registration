<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看公告</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/navbar-fixed-top.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function queryInfo(basicId){
		$.ajax({
			url:"${pageContext.request.contextPath }/findByInfoId",
			type:"post",
			dataType:"json",
			data:{"basicId":basicId},
			success:function(data){
				$("#p1").text(data.basicTitle);
				$("#p2").append(data.info);
			},
			error:function(){}
		});
		$('#Info').modal('show');
		$('#Info').on('hidden.bs.modal', function (e) {
			$("#p2").empty();
			})
	}
</script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><strong>预约挂号系统</strong></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath }/showGuahao">挂号操作</a></li>
                <li><a href="${pageContext.request.contextPath }/showDealWithOrder">待处理预约</a></li>
                <li><a href="${pageContext.request.contextPath }/showCancelGuahao">退号</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">公告 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="active"><a href="${pageContext.request.contextPath }/findAllInfo">查看公告</a></li>
                        <li><a href="${pageContext.request.contextPath }/showPublishInfo">发布公告</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath }/logout">登出</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">

    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <form name="infoForm" method="post" action="">
            <div class="form-group">
                <label  class="col-sm-2 control-label"><font size="5">公告信息</font></label>
            </div>
            <br>
            <div class="panel panel-default">
            </div>
            <div>
            	<c:forEach var="el" items="${InfoList}">
            		<a onclick="queryInfo('${el.basicId}')">${el.basicTitle}</a><br>
            	</c:forEach>
            </div>
            <div class="col-sm-10"></div>
            <div class="col-sm-2">
            </div>
        </form>
        <div id="middle"></div>                            <!--稳定大屏幕界面高度适中容器-->
    </div>
</div> <!-- /container -->
<div class="modal fade" id="Info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">公告</h4>
            </div>
            <div class="modal-body">
            	<h3 id="p1"></h3><br>
            	<div id="p2"></div><br>
           </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>