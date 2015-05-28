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
										<input type="hidden" name="type" value="${type }"></input> <input
											type="hidden" name="mid" value="${mid }"></input><input
											type="hidden" id="delay" name="delay" value="${delay }"></input> <select
											class="chosen-select form-control" name="companyId"
											id="form-field-select-2" data-placeholder="Choose a State...">
											<option value="100">新华网</option>
										</select> <select name="appId" class="chosen-select form-control"
											data-levelNum="1" id="firLevel"><option value="-1">全部应用</option>
										</select><select name="column" class="chosen-select form-control"
											data-levelNum="2" id="secLevel"><option value="">全部栏目</option>
										</select> <select name="extendedColumn1"
											class="chosen-select form-control" data-levelNum="3"
											id="thiLevelId"><option value="">全部子栏目1</option>
										</select><select name="extendedColumn2"
											class="chosen-select form-control" data-levelNum="4"
											id="fouLevelId"><option value="">全部子栏目2</option>
										</select><label> <input type="search" class="form-control"
											placeholder="标题或内容" id="keyword"
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
									<c:choose>

										<c:when test="${delay ==0}">
											<a class="green" href="javascript:batchOper('100')"
												title="批量通过"> <i class="ace-icon fa fa-check bigger-230"></i>
											</a>
											<a class="red" href="javascript:batchOper('200')"
												title="批量删除"> <i
												class="ace-icon fa fa-trash-o bigger-200"></i>
											</a>
									<a class="blue" href="javascript:batchOper('900')"
										title="批量添加舆情"> <i class="ace-icon fa fa-star bigger-230"></i>
									</a>
										</c:when>
										<c:otherwise>
											<a class="green" href="javascript:batchOper('101')"
												title="批量通过"> <i class="ace-icon fa fa-check bigger-230"></i>
											</a>
											<a class="red" href="javascript:batchOper('201')"
												title="批量删除"> <i
												class="ace-icon fa fa-trash-o bigger-200"></i>
											</a>
											<a class="blue" href="javascript:batchOper('901')"
												title="批量添加舆情"> <i
												class="ace-icon fa fa-star bigger-230"></i>
											</a>
										</c:otherwise>
									</c:choose>
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

	<!-- 富文本相关 -->
	<script type="text/javascript">
	var actionUrl = "censor/all";
	jQuery(function($) {
		$("#searchForm").attr("action",actionUrl);
		$("#gritter-light").click();
		//实例化multiSelect类
        var xhSelect = new multiSelect({
            firLevelId : "firLevel",
            secLevelId : "secLevel",
            thiLevelId : "thiLevelId",
            fouLevelId : "fouLevelId",
        });
        xhSelect.init("${appId}", "${column}", "${extendedColumn1}", "${extendedColumn2}");

        var active_class = 'active';

        $('#simple-table').on('click', 'td input[type=checkbox]',
                function() {
                    var $row = $(this).closest('tr');
                    if (this.checked)
                        $row.addClass(active_class);
                    else
                        $row.removeClass(active_class);
                });
        $("#searchBtn").on(ace.click_event, function() {
        	$("#searchForm").submit();
            //window.location.href = "censor/all?pageSize=${pager.pageSize}&pageNumber=1&keyword="+$("#keyword").val();
        });
        $('#page-size').val(${pager.pageSize});
     $('[data-rel="tooltip"]').tooltip({
                     placement : tooltip_placement
                 });
     $("span[name='dateForm']").each(function() {
         var date = $(this);
         var time = date.attr('data-date');
         if (time != null && time != "") {
             var dateForm = moment(new Date(time)).locale('zh-cn');
             $(this).html(dateForm.format('LLL'));
         }
     });

     $("i[name='dateForm']").each(function() {
         var date = $(this);
         var time = date.attr('data-date');
         if (time != null && time != "") {
             var dateForm = moment(new Date(time)).locale('zh-cn');
             $(this).attr("title",$(this).attr("title")+'于'+dateForm.format('LLL')+'锁定');
         }
     });
     $('#pagination').pagination({
         link: actionUrl +'?pageSize=${pager.pageSize}&pageNumber={p}&keyword=${keyword}&companyId=${companyId}&appId=${appId}&column=${column}&extendedColumn1=${extendedColumn1}&extendedColumn2=${extendedColumn2}&type=${type}&delay=${delay}&mid=${mid}',
         count:${pager.pageCount},
         current:${pager.pageNumber}
       });
     $('#page-size').on('change', 
             function() {
                console.info($('#page-size').val());
                window.location.href = actionUrl+"?pageSize="+$('#page-size').val()+"&pageNumber=1&keyword=${keyword}&companyId=${companyId}&appId=${appId}&column=${column}&extendedColumn1=${extendedColumn1}&extendedColumn2=${extendedColumn2}&type=${type}&delay=${delay}&mid=${mid}";
             });
    });
	
	function refreshWindow(oper,dataType,batchType){
		if(dataType!=null && dataType==1 && !batchType){
			window.location.href = "../"+actionUrl+"?pageSize="+$('#page-size').val()+"&pageNumber=${pager.pageNumber}&keyword=${keyword}&companyId=${companyId}&appId=${appId}&column=${column}&extendedColumn1=${extendedColumn1}&extendedColumn2=${extendedColumn2}&type=${type}&delay=${delay}&mid=${mid}";
			
		}else{
			window.location.href = actionUrl+"?pageSize="+$('#page-size').val()+"&pageNumber=${pager.pageNumber}&keyword=${keyword}&companyId=${companyId}&appId=${appId}&column=${column}&extendedColumn1=${extendedColumn1}&extendedColumn2=${extendedColumn2}&type=${type}&delay=${delay}&mid=${mid}";
		}
	}
	function tooltip_placement(context, source) {
	    var $source = $(source);
	    var $parent = $source.closest('table')
	    var off1 = $parent.offset();
	    var w1 = $parent.width();

	    var off2 = $source.offset();
	    // var w2 = $source.width();

	    if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
	        return 'right';
	    return 'left';
	}
	</script>
</div>