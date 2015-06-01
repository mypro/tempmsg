<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>${title}</title>
</head>
<body>
	<div class="row">
		<div class="col-xs-12">
			<div>
				<div id="dynamic-table_wrapper"
					class="dataTables_wrapper form-inline no-footer">
					<div class="row">
						<div class="col-xs-8">

							<div class="col-xs-12">
								<div class="" id="dynamic-table_length">
									<form id="searchForm" action="censor/all" method="post">
										<label> <input type="search" class="form-control"
											placeholder="用户或内容" id="keyword"
											aria-controls="dynamic-table" name="keyword"
											value="${keyword}"></label> <label
											style="padding-left: 10px;"><button id="searchBtn"
												class="">
												<span><i class="fa fa-search"></i></span>
											</button></label>
									</form>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div id="dynamic-table_filter" class="dataTables_filter">
								<c:if test="${type==0 }">
									<span class="col-sm-4"> <label class="pull-right inline">
											<input id="gritter-light" type="checkbox"
											onclick="changeOpenFlag(this)"
											class="ace ace-switch ace-switch-6" /> <span
											class="lbl middle"></span>
									</label>
									</span>
								</c:if>
								<div class="hidden-sm hidden-xs action-buttons">
											<a class="green" href="javascript:batchOper('100')"
												title="批量通过"> <i class="ace-icon fa glyphicon-plus bigger-230"></i>
											</a>
											<a class="red" href="javascript:batchOper('200')"
												title="批量删除"> <i
												class="ace-icon fa fa-trash-o bigger-200"></i>
											</a>
								</div>
							</div>
						</div>

					</div>

					<%@ include file="msg_table.jsp"%>
					<%@ include file="../msg_pager.jsp"%>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
<div id="botton_javascript">
	<!-- basic scripts -->

	<script src="commons/js/bootstrap-pagination.js"></script>
	<script src="commons/js/censor.js"></script>
	<script src="dist/js/bootbox.min.js"></script>
	<script type="text/javascript" src="commons/js/showButton.js"></script>
	<script src="commons/js/xh_multi_select.js"></script>

	<!-- 富文本相关 -->

	<script src="dist/js/jquery.hotkeys.min.js"></script>
	<script src="dist/js/bootstrap-wysiwyg.min.js"></script>
	<!-- ace scripts -->
	<script src="dist/js/ace-elements.min.js"></script>

	<!-- 操作 -->
    	<script type="text/javascript">

        function batchOper(oper) {
        	var checkboxValue = '';
        	var dataType = null;
        	$("input[type=checkbox][rel=check]:checked").each(function() {
        		checkboxValue += $(this).attr("id") + ',';
        		dataType = $("#tr-" + $(this).attr("id")).attr("data-type");
        	});
        	if (checkboxValue.length > 0) {
        		checkboxValue = checkboxValue.substring(0, checkboxValue.length - 1);
        		ajaxSubmit(checkboxValue);
        	} else {
        		alert("请选择符合条件的数据");
        		return;
        	}
        }

        // id集合，操作类型，富文本标识，原始文本标识，封用户/IP值
        function ajaxSubmit(ids) {
        	var delayFlag = $("#delay").val();
        	var batchBtnFlag = true;// 是否是批量操作


        	var data = '{mongoIds:\"' + ids + '\"}';
        	var url = "msg/removeall";

        	$
        			.ajax({
        				url : url,
        				type : 'POST',
        				data : data,
        				datatype : "json",
        				contentType : "application/json; charset=utf-8",
        				success : function(result) {
        				console.log(result);
    						if(result){
    							var ids = result.mongoIds.split(",");
    							for(var i=0;i<ids.length;i++){
    								hideTr(ids[i])
    							}
    						}


        				},
        				error : function() {
        					overLayer('fail', '请求异常', null, dataType);
        					if (originalContentFlag != null) {
        						resetOriginalInfo(ids, oper, richTextFlag);
        					}
        				}
        			});
        }

        function hideTr(id) {
        		$("#tr-" + id).removeAttr("rel");
        		$("#" + id).removeAttr("rel");
        		$("#tr-" + id).hide();
        }
        </script>
</div>