<%@ page language="java" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.action-buttons-bar button {
	margin: 2px 5px 5px 5px;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #FFEBCD
}

.table-hover>tbody>tr.active:hover>td, .table-hover>tbody>tr.active:hover>th
	{
	background-color: #FFEBCD
}

.table>thead>tr>.active, .table>tbody>tr>.active, .table>tfoot>tr>.active,
	.table>thead>.active>td, .table>tbody>.active>td, .table>tfoot>.active>td,
	.table>thead>.active>th, .table>tbody>.active>th, .table>tfoot>.active>th
	{
	background-color: #F5F5DC
}

.table-striped>tbody>tr:nth-child(odd)>.active>td, .table-striped>tbody>tr:nth-child(odd)>.active>th
	{
	background-color: #F5F5DC
}

.btn-primary a, .btn-primary a:hover {
	color: #fff;
	text-decoration: none;
}

.content_font {
	font-size: 16px;
	padding: 10px;
}

.action-buttons a {
	margin: 0 10px;
	display: inline-block;
	opacity: .85;
	-webkit-transition: all .1s;
	-o-transition: all .1s;
	transition: all .1s;
}

.widget-header {
	min-height: 38px;
	padding-left: 0px;
}

.table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 4px;
	vertical-align: middle;
}

.btn {
	text-shadow: 0 0px 0 rgba(0, 0, 0, .25);
}

input[type=checkbox].ace.ace-switch.ace-switch-6+.lbl::before {
	font-family: FontAwesome;
	content: "全部折叠";
	/*  content: "\f00d"; */
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	box-shadow: none;
	border-width: 0;
	font-weight: normal;
	font-size: 14px;
	border-radius: 12px;
	display: inline-block;
	background-color: #69aa46;
	color: #F2F2F2;
	width: 100px;
	height: 28px;
	line-height: 21px;
	text-indent: 35px;
	-webkit-transition: background .1s ease;
	-o-transition: background .1s ease;
	transition: background .1s ease;
	line-height: 28px;
}

input[type=checkbox].ace.ace-switch.ace-switch-6+.lbl::after {
	content: '';
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	position: absolute;
	top: 2px;
	left: 10px;
	border-radius: 12px;
	box-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	width: 22px;
	height: 22px;
	text-align: center;
	background-color: #F2F2F2;
	border: 4px solid #F2F2F2;
	-webkit-transition: left .2s ease;
	-o-transition: left .2s ease;
	transition: left .2s ease
}

input[type=checkbox].ace.ace-switch.ace-switch-6:checked+.lbl::before {
	content: "全部展开";
	/*  content: "\f00c"; */
	text-indent: 6px;
	color: #FFF;
	border-color: #b7d3e5;
	background-color: #ff893c
}

input[type=checkbox].ace.ace-switch.ace-switch-6:checked+.lbl::after {
	left: 70px;
	background-color: #FFF;
	border: 4px solid #FFF;
	text-shadow: 0 -1px 0 rgba(0, 200, 0, .25)
}
</style>
<input type="hidden" id="msgs" value="${msgs}" />
<table id="st"
	class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
	<thead>
		<th width="100px" class="sorting_disabled center align-middle ">用户</th>
		<th class="sorting_disabled ">消息内容</th>
		<th class="sorting_disabled "></th>
		<th width="10px" class="sorting_disabled center align-middle"><label
			class="pos-rel"> <input type="checkbox" id="checkAllMsg"
				onclick="checkAllMsg(this)" class="ace" /> <span class="lbl"></span>
		</label></th>
	</thead>
	<tbody id="simple-table">
		<c:forEach items="${msgs}" var="row" varStatus="vs">
			<tr id="tr-${row.id}" rel="tr" >
				<td>
					<div class="appid-name center align-middle"></div>
					<div>
						<ul class="nav ace-nav center align-middle">
							<c:out value="${row.name}" />
						</ul>
					</div>
				</td>
				<td  href="#preview-msg" role="button" class="blue" data-toggle="modal" data-target="#preview-msg" onclick="viewContent('${row.id}');">
					<div class="appid-name center align-middle"  ></div>
					<div>
						<ul class="nav ace-nav center align-middle">
							<c:out value="${fn:substring(row.content, 0, 120)}" />
						</ul>
					</div>
				</td>
				<td>
					<div class="appid-name center align-middle"></div>
					<div>
						<c:out value="${row.createTime}" />
					</div>
				</td>

				<td class="center align-middle"><label class="pos-rel">
						<input type="checkbox" id="<c:out value="${row.id }"/>"
						class="ace" rel="check" /> <span class="lbl"></span>
				</label></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 遮罩层start -->
<div id="roleadd-modal" class="modal fade" tabindex="-1">
	<div class="modal-dialog" style="width: 1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="smaller lighter blue no-margin">新增消息</h3>
			</div>
			<form id="addForm" method="post">
				<div class="modal-body">
					<input type="hidden" name="channelId"
						value="<c:out value="${channelId}"/>" />
					<table id="info"
						class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
						<tr>
							<td class="left" style="width: 45px;">发送人:</td>
							<td colspan="3"><input type="text" name="name" id="name_add"
								value="sender" /></td>
						</tr>
						<tr>
							<td class="left">消息内容:</td>
							<td style="width: 430px;"><textarea name="content"
									id="content_add" data-provide="markdown" data-iconlibrary="fa"
									rows="23" cols="130" class="md-input" style="resize: none;">
								</textarea></td>
						</tr>
					</table>
				</div>

				<div class="modal-footer">
					<button class="btn btn-sm pull-right"
						onclick="addConfig('msg/insertMsg');return false;">确定</button>

				</div>
			</form>
		</div>
	</div>
</div>


<div id="roleadd-modal-modify" class="modal fade" tabindex="-1">
	<div class="modal-dialog" style="width: 1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="smaller lighter blue no-margin">编辑频道</h3>
			</div>
			<form id="modForm" method="post">
				<input type="hidden" name="id" id="appEdit_id" value="" /> <input
					type="hidden" name="channelId"
					value="<c:out value="${channelId}"/>" />
				<div class="modal-body">

					<table id="info"
						class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
						<tr>
							<td class="left" style="width: 45px;">key:</td>
							<td colspan="3"><input type="text" name="name"
								id="name_edit" value="" /></td>

						</tr>
						<tr>
							<td class="left">频道描述:</td>
							<td style="width: 430px;"><textarea rows="23" cols="130"
									id="channelName_edit" name="channelName"></textarea></td>
						</tr>

					</table>
				</div>

				<div class="modal-footer">
					<button class="btn btn-sm" onclick="formatMod();return false;">格式化</button>
					&nbsp;
					<button class="btn btn-sm pull-right"
						onclick="modifyConfig('config/appconfigupdate');return false;">
						保存</button>
				</div>
			</form>
		</div>
	</div>
</div>


	<div id="preview-msg" class="modal fade" tabindex="-1">
    		<div class="modal-dialog" style="width: 1200px;">
    			<div class="modal-content">
    				<div class="modal-body">
    					<div id="" class="md-preview" data-provider="markdown-preview"
    						style="width: 865px; height: 615px; resize: true;">
    						<textarea name="contentview" id="contentview" data-provide="markdown" data-iconlibrary="fa"
                            									rows="30" cols="140" class="md-input" style="resize: none;">**Markdown Editor** inside a *widget box*
                            </textarea>
    					</div>

    				</div>
    			</div>

    		</div>
    </div>

<!-- 遮罩层end -->
<!-- basic scripts -->



<div>
	<script type="text/javascript">
		function checkAllMsg(obj) {
			var th_checked = obj.checked;
			var active_class = 'active';
			$('#simple-table input[type=checkbox]').each(
					function() {
						if (th_checked) {
							$(this).parent().parent().parent().addClass(
									active_class);
						} else {
							$(this).parent().parent().parent().removeClass(
									active_class);
						}
						$(this).prop('checked', th_checked);
					});
		}

		function addConfig(goUrl) {

			if ($('#name_add').val() == '') {
				alert("请填发送人名称");
			} else if ($('#content_add').val() == '') {
				alert("请填消息内容");
			} else {
				$('#addForm').attr("action", goUrl);
				$('#addForm').submit();
			}

		}

		function viewContent(id){
		var data ='{mongoId:\"'+id+'\"}';
		var url = "msg/queryMsg";
		$.ajax({
        				url : url,
        				type : 'POST',
        				data : data,
        				datatype : "json",
        				contentType : "application/json; charset=utf-8",
        				success : function(result) {
							$("#contentview").html(result);
        				},
        				error : function() {
        					console.log("查询消息内容异常");
        				}
        			});
		}
	</script>
</div>