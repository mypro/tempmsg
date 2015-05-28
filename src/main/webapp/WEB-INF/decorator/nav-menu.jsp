<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav nav-list">

	<li class="" id="menu-dashboard"><a href=""> <i
			class="menu-icon fa fa-tachometer"></i> <span class="menu-text">首页</span>
	</a> <b class="arrow"></b></li>

		<li class="" id="menu-mycensor"><a href="#"
			class="dropdown-toggle"> <i class="menu-icon fa fa-lock"></i> <span
				class="menu-text">所有消息</span><b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class="" id="menu-mycensor-short"><a
					href="message/queryAll?channelID=1000"> <i
						class="menu-icon fa fa-file-text"></i> 频道1
				</a> <b class="arrow"></b></li>
				<li class="" id="menu-mycensor-long"><a
					href="message/queryAll?channelID=1001"> <i
						class="menu-icon fa fa-book"></i> 频道2
				</a> <b class="arrow"></b></li>
			</ul></li>




		<li class="" id="menu-app"><a href="channel/queryAll"> <i
				class="menu-icon fa fa-gratipay"></i> <span class="menu-text">
					频道管理 </span>
		</a> <b class="arrow"></b></li>

		<li class="" id="menu-statistic"><a href="#"
			class="dropdown-toggle"> <i class="menu-icon fa fa-filter"></i> <span
				class="menu-text"> 统计查询 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
					<li class="" id="statistic-classify"><a
						href="statistic/classify"> <i
							class="menu-icon fa fa-file-text"></i> 绩效统计
					</a> <b class="arrow"></b></li>
					<li class="" id="statistic-app"><a href="statistic/app"> <i
							class="menu-icon fa fa-file-text"></i> 应用统计
					</a> <b class="arrow"></b></li>
			</ul></li>

		<li class="" id="menu-sys"><a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-wrench"></i> <span class="menu-text">
					系统管理 </span> <b class="arrow fa fa-angle-down"></b>

		</a> <b class="arrow"></b>
			<ul class="submenu">
					<li class="" id="menu-sys"><a href="config/sys"> <i
							class="menu-icon fa fa-gear"></i> 参数配置
					</a> <b class="arrow"></b></li>

					<li class="" id="menu-typeconfig"><a href="config/typeconfig">
							<i class="menu-icon fa fa-gear"></i> 待审分类配置
					</a> <b class="arrow"></b></li>

					<li class="" id="menu-sys_acc"><a href="#"
						class="dropdown-toggle"> <i class="menu-icon fa fa-users"></i>
							<span class="menu-text"> 账户及权限管理 </span> <b
							class="arrow fa fa-angle-down"></b>
					</a> <b class="arrow"></b>
						<ul class="submenu">
								<li class="" id="menu-sysman-account"><a
									href="account/listAccount"> <i class="menu-icon fa fa-user"></i>
										账户管理
								</a> <b class="arrow"></b></li>
								<li class="" id="menu-sysman-role"><a href="role/all">
										<i class="menu-icon fa fa-users"></i> 角色管理
								</a> <b class="arrow"></b></li>
								<li class="" id="menu-sysman-permission"><a
									href="permission/all"> <i class="menu-icon fa fa-key"></i>
										权限管理
								</a> <b class="arrow"></b></li>
						</ul></li>
			</ul></li>


</ul>
