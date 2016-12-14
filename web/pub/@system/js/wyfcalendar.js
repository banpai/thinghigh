
var wyfcalendar = {
	css : '<style type="text/css">.wyfcalendar {position:absolute;width: 190px;border: solid 1px #BDBDBD;padding: 3px;top: -1000px;left:-1000px;z-index: 99;background-color: #ffffff;}.wyfcalendar .maindiv{width:188px;height:156px;border: solid 1px #C5D9E8;}.wyfcalendar .maindiv table{display:none;}.wyfcalendar a{color: #666666;cursor: pointer;}.wyfcalendar button{width:43px;text-align: center;background-color:#F0F0F0;color: #666666;cursor: pointer;border: solid 1px #CCCCCC;margin-left: 1px;margin-right: 0px;}.wyfcalendar .rqth{background-color:#BDEBEE;height: 23px;}.wyfcalendar .rqtd{background-color:#FBF9FF;height: 22px;}.wyfcalendar .rqth td{font-size: 12px;text-align: center;}.wyfcalendar .rqtd td{font-size: 12px;text-align: center;cursor: pointer;}.wyfcalendar .yftd,.wyfcalendar .nftd{background-color:#FBF9FF;height: 39px;}.wyfcalendar .yftd td,.wyfcalendar .nftd td{font-size: 13px;text-align: center;cursor: pointer;width: 62px;}</style>',
	html : '<div class="wyfcalendar"><table width="190px;" cellpadding="0" cellspacing="0" background="0"><tr><td width="20px;" align="right"><a id="wyf_clendar_leftprev">☜</a></td><td width="150px;" align="center"><div style="height:23px;"><a id="wyf_clendar_center"></a></div></td><td width="20px;" align="left"><a id="wyf_clendar_rightnext">☞</a></td></tr><tr><td colspan="3"><div class="maindiv"><table id="wyf_clendar_rq" width="100%" cellpadding="0" cellspacing="0" background="0"><tr class="rqth"><td>周</td><td>日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr class="rqtd"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table><table id="wyf_clendar_yf" width="100%" cellpadding="0" cellspacing="0" background="0"><tr class="yftd"><td>一月</td><td>二月</td><td>三月</td></tr><tr class="yftd"><td>四月</td><td>五月</td><td>六月</td></tr><tr class="yftd"><td>七月</td><td>八月</td><td>九月</td></tr><tr class="yftd"><td>十月</td><td>十一月</td><td>十二月</td></tr></table><table id="wyf_clendar_nf" width="100%" cellpadding="0" cellspacing="0" background="0"><tr class="nftd"><td></td><td></td><td></td></tr><tr class="nftd"><td></td><td></td><td></td></tr><tr class="nftd"><td></td><td></td><td></td></tr><tr class="nftd"><td></td><td></td><td></td></tr></table></div></td></tr><tr height="3px;"><td colspan="3"></td></tr><tr height="25px;" id="wt" style="display: none"><td colspan="3" style="font-size:14px;" align="center"><select class="tws"></select>时<select class="twf"></select>分<select class="twm"></select>秒</td></tr><tr><td colspan="3" align="left" nowrap="nowrap"><table cellpadding="0" cellspacing="0"><tr><td><button onclick="wyfcalendar.close()">关闭</button></td><td><button onclick="wyfcalendar.clear()">清除</button></td><td><button onclick="wyfcalendar.setnow()" class="wyfcnow">今天</button></td><td><button style="margin-left: 16px" onclick="wyfcalendar.confirm()">确定</button></td></tr></table></td></tr></table></div>',
	/**
	 * 返回这个日期的详细的参数信息
	 * 年 月 日 时 分 秒 星期
	 * @param date
	 */
	initCalendar : function (o,withTime,oth,isdatestr) {
		$(o).attr('readonly',true);
		$(o).unbind('keydown').keydown(function(e){
			if(e.keyCode==8){
				return false;
			}
		});
		$('.wyfcalendar').remove();
		wyfcalendar.o = o;
		wyfcalendar.isdatestr = isdatestr;
		var val = $.trim($(o).val());
		var date = null;
		if(val==''||val=='0'){
			date = new Date();
		}else{
			date = wyfcalendar.getDateFromStr(val);
		}
		//取得本月的第一天
		wyfcalendar.o.selectdate = new Date(date.getTime());
		$('body').append(wyfcalendar.html);
		$('.wyfcalendar').css('left',$(o).offset().left);
		$('.wyfcalendar').css('top',$(o).offset().top+$(o).outerHeight());
		if(withTime){//如果需要选择时间
			wyfcalendar.wt = true;
			$('.wyfcalendar').find('.wyfcnow').text('现在');
			$('.wyfcalendar').find('#wt').show();
			for(var i=0;i<60;i++){
				var vv = i<10?'0'+i:i;
				var ht = '<option value="'+vv+'">'+vv+'</option>';
				if(i<24){
					$('.wyfcalendar').find('.tws').append(ht);
				}
				$('.wyfcalendar').find('.twf').append(ht);
				$('.wyfcalendar').find('.twm').append(ht);
			}
			$('.wyfcalendar').find('.tws').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getHours()));
			$('.wyfcalendar').find('.twf').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getMinutes()));
			$('.wyfcalendar').find('.twm').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getSeconds()));
		}else{
			wyfcalendar.wt = false;
		}
		if(oth){//如果含有隐藏元素
			wyfcalendar.oth = oth;
		}
		$('.wyfcalendar').find('.maindiv').find('table').find('td').hover(function(){
			$(this).css('backgroundColor','#BDEBEE');
		},function(){
			if($(this).attr('now')!='now'){
				$(this).css('backgroundColor','');
			}
		});
		date.setDate(1);
		wyfcalendar.setrq(date);
		//点及其他地方关闭
		wyfcalendar.isoncal = false;
		$('.wyfcalendar').mousedown(function(){
			wyfcalendar.isoncal = true;
		});
		$('.wyfcalendar').mouseup(function(){
			wyfcalendar.isoncal = false;
		});
	},
	/**
	 * 批量年份框设置
	 */
	setnnf : function(year){
		//找到开始的年
		var ksn = year;
		while((ksn+72)%144!=0){
			ksn--;
		}
		$('#wyf_clendar_center').html(ksn+'-'+(ksn+143)).unbind();
		$('#wyf_clendar_leftprev').unbind().click(function(){
			if(year-144<1800){
				wyfcalendar.setnnf(1800);
			}else{
				wyfcalendar.setnnf(year-144);
			}
		});
		$('#wyf_clendar_rightnext').unbind().click(function(){
			if(year+144>2519){
				wyfcalendar.setnnf(2519);
			}else{
				wyfcalendar.setnnf(year+144);
			}
		});
		$('.wyfcalendar').find('.maindiv').find('table').hide();
		$('#wyf_clendar_nf').fadeIn('slow');
		$('#wyf_clendar_nf').find('td').each(function(i){
			$(this).html(ksn+'-<br/>'+(ksn+11)+'&nbsp;');
			ksn+=12;
			$(this).unbind('click').click(function(){
				wyfcalendar.setnf(parseInt($.trim($(this).text().split('-')[0])));
			});
		});
	},
	/**
	 * 年份框设置
	 */
	setnf : function(year){
		//找到开始的年
		var ksn = year;
		while(ksn%12!=0){
			ksn--;
		}

		$('#wyf_clendar_center').html(ksn+'-'+(ksn+11)).unbind().click(function(){
			wyfcalendar.setnnf(ksn);
		});
		$('#wyf_clendar_leftprev').unbind().click(function(){
			if(year-12<1800){
				wyfcalendar.setnf(1800);
			}else{
				wyfcalendar.setnf(year-12);
			}
		});
		$('#wyf_clendar_rightnext').unbind().click(function(){
			if(year+12>2519){
				wyfcalendar.setnf(2519);
			}else{
				wyfcalendar.setnf(year+12);
			}
		});
		$('.wyfcalendar').find('.maindiv').find('table').hide();
		$('#wyf_clendar_nf').fadeIn('slow');
		$('#wyf_clendar_nf').find('td').each(function(i){
			$(this).html(ksn++);
			$(this).unbind('click').click(function(){
				wyfcalendar.setyf(parseInt($(this).text()));
			});
		});
	},
	/**
	 * 月份框设置
	 */
	setyf : function(year){
		$('#wyf_clendar_center').html(year).unbind().click(function(){
			wyfcalendar.setnf(year);
		});
		$('#wyf_clendar_leftprev').unbind().click(function(){
			if(year==1800){
				wyfcalendar.setyf(1800);
			}else{
				wyfcalendar.setyf(year-1);
			}
		});
		$('#wyf_clendar_rightnext').unbind().click(function(){
			if(year==2519){
				wyfcalendar.setyf(2519);
			}else{
				wyfcalendar.setyf(year+1);
			}
		});
		$('.wyfcalendar').find('.maindiv').find('table').hide();
		$('#wyf_clendar_yf').fadeIn('slow');
		$('#wyf_clendar_yf').find('td').each(function(i){
			var thedate = new Date(year,i,1);
			$(this).unbind('click').click(function(){
				wyfcalendar.setrq(thedate);
			});
		});
	},
	/**
	 * 日期框设置
	 * @param date
	 */
	setrq : function (date) {
		var jt = null;
		var jh = null;
		if(wyfcalendar.isSameMouth(date,new Date())){
			jt = (new Date()).getDate();
		}
		if(wyfcalendar.isSameMouth(date,wyfcalendar.o.selectdate)){
			jh = wyfcalendar.o.selectdate.getDate();
		}
		var rqms = wyfcalendar.getDateArray(date);
		var lastm = wyfcalendar.getPrevMouth(date);
		var nextm = wyfcalendar.getNextMouth(date);

		$('#wyf_clendar_center').html(rqms[0]+'年'+rqms[1]+'月').unbind().click(function(){
			wyfcalendar.setyf(rqms[0]);
		});
		$('#wyf_clendar_leftprev').unbind().click(function(){
			wyfcalendar.setrq(lastm[3]);
		});
		$('#wyf_clendar_rightnext').unbind().click(function(){
			wyfcalendar.setrq(nextm[3]);
		});
		$('.wyfcalendar').find('.maindiv').find('table').hide();
		$('#wyf_clendar_rq').fadeIn('slow');
		//填写日历
		var zs = rqms[7];//周数
		var qxo1 = rqms[6];//1号是星期几
		var byts = rqms[8];//本月天数
		var xrrq = 1;//要写入的日期
		$('#wyf_clendar_rq').find('td').attr('now','').css('border','none').css('backgroundColor','')
		$('#wyf_clendar_rq').find('.rqtd').each(function(i){
			var eq = 0;
			if(xrrq>byts&&nextm[0]>rqms[0]){
				$(this).find('td').eq(eq++).html('<b>1</b>');
			}else{
				$(this).find('td').eq(eq++).html('<b>'+zs+'</b>');
			}
			if(i==0){
				var qmts = qxo1;//1号前面的天数
				for(var j=(lastm[2]-qmts+1);j<=lastm[2];j++){
					$(this).find('td').eq(eq).unbind('click').click(function(){
						wyfcalendar.setrq(lastm[3]);
					});
					$(this).find('td').eq(eq++).html('<font color="gray">'+j+'</font>');
				}
			}
			while(eq<8){
				var color = '';
				if(eq==1||eq==7){
					color = 'color="red"';
				}
				if(xrrq>byts){
					color = 'color="gray"';
					$(this).find('td').eq(eq).unbind('click').click(function(){
						wyfcalendar.setrq(nextm[3]);
					});
					$(this).find('td').eq(eq++).html('<font '+color+'>'+(xrrq-byts)+'</font>');
					xrrq++;
				}else{
					if(jt==xrrq){
						color+=' style="color:red;font-weight: bolder;"';
						$(this).find('td').eq(eq).css('backgroundColor','#BDEBEE').attr('now','now').attr('title','今天');
					}
					if(jh==xrrq){
						$(this).find('td').eq(eq).css('border','solid 1px #BDBDBD');
					}
					$(this).find('td').eq(eq).unbind('click').click(function(){
						$('#wyf_clendar_rq').find('td').css('border','none');
						$(this).css('border','solid 1px #BDBDBD');
						wyfcalendar.o.selectdate = new Date(rqms[0],rqms[1]-1,parseInt($(this).text()));
					});
					$(this).find('td').eq(eq).unbind('dblclick').dblclick(function(){
						wyfcalendar.confirm();
					});
					$(this).find('td').eq(eq++).html('<font '+color+'>'+(xrrq++)+'</font>');
				}

			}
			zs++;
		});
	},
	/**
	 * 返回这个日期的详细的参数信息
	 * 年 月 日 时 分 秒 星期 一年的第几个星期 这个月的天数
	 * @param date
	 */
	getDateArray : function (date) {
		var res = [];
		res[0] = date.getFullYear();
		res[1] = date.getMonth() + 1;
		res[2] = date.getDate();
		res[3] = date.getHours();
		res[4] = date.getMinutes();
		res[5] = date.getSeconds();
		res[6] = date.getDay();
		res[7] = wyfcalendar.getWeekOfYear(date);
		res[8] = wyfcalendar.getMouthDays(res[0],res[1]);
		return res;
	},
	/**
	 * 获得补零形式
	 */
	getbl :function(num){
		return num<10?'0'+num:''+num;
	},
	/**
	 * 获得当前日期所在的周 是一年的第几周
	 * @param date
	 * @returns
	 */
	getWeekOfYear : function(date) {
		var firstWeekend = 7 - (new Date(date.getFullYear(),0,1)).getDay();
		var dayofyear = date.getDate();
		for ( var i = 0; i < date.getMonth(); i++) {
			dayofyear += wyfcalendar.getMouthDays(date.getFullYear(),i+1);
		}
		return parseInt((dayofyear - firstWeekend) / 7) + 1;
	},
	/**
	 * 根据字串取得日期
	 */
	getDateFromStr : function(str){
		if(str.indexOf(' ')!=-1){
			var dtts = str.split(' ');
			var dt = dtts[0];
			var tt = dtts[1];
			dts = dt.split('-');
			tts = tt.split(':');
			return new Date(parseInt(dts[0]),parseInt(dts[1])-1,parseInt(dts[2]),parseInt(tts[0]),parseInt(tts[1]),parseInt(tts[2]));
		}else{
			var dts = str.split('-');
			return new Date(parseInt(dts[0]),parseInt(dts[1])-1,parseInt(dts[2]));
		}
	},
	/**
	 * 获得上个月
	 */
	 getPrevMouth : function(date){
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var res = [];
		if(month==1){
			res[0] = year - 1;
			res[1] = 12;
		}else{
			res[0] = year;
			res[1] = month - 1;
		}
		res[2] = wyfcalendar.getMouthDays(res[0],res[1]);
		var thedate = new Date(date.getTime());
		thedate.setFullYear(res[0]);
		thedate.setMonth(res[1]-1);
		res[3] = thedate;
		return res;
	},
	/**
	 * 获得下个月
	 */
	 getNextMouth : function(date){
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var res = [];
		if(month==12){
			res[0] = year + 1;
			res[1] = 1;
		}else{
			res[0] = year;
			res[1] = month + 1;
		}
		res[2] = wyfcalendar.getMouthDays(res[0],res[1]);
		var thedate = new Date(date.getTime());
		thedate.setFullYear(res[0]);
		thedate.setMonth(res[1]-1);
		res[3] = thedate;
		return res;
	},
	/**
	 * 获得某年某月的天数
	 */
	 getMouthDays : function(year,month){
		month = month - 1;
		switch (month) {
		case 0:
		case 2:
		case 4:
		case 6:
		case 7:
		case 9:
		case 11:
			return 31;
			break;
		case 1:
			return ((year%4==0&&year%100!=0)?29:28);
			break;
		case 3:
		case 5:
		case 8:
		case 10:
			return 30;
			break;
		}
	},
	/**
	 * 是否同一天
	 */
	 isSameDay : function(date1,date2){
		return (date1.getFullYear()==date2.getFullYear()&&date1.getMonth()==date2.getMonth()&&date1.getDate()==date2.getDate());
	},
	/**
	 * 是否同一月
	 */
	 isSameMouth : function(date1,date2){
		return (date1.getFullYear()==date2.getFullYear()&&date1.getMonth()==date2.getMonth());
	},
	/**
	 * 确定回填
	 */
	 confirm : function(){
		var str = wyfcalendar.o.selectdate.getFullYear()+'-'+wyfcalendar.getbl(wyfcalendar.o.selectdate.getMonth() + 1)+'-'+wyfcalendar.getbl(wyfcalendar.o.selectdate.getDate());
		if(wyfcalendar.wt){
			str+=(' '+$('.wyfcalendar').find('.tws').val()+':'+$('.wyfcalendar').find('.twf').val()+':'+$('.wyfcalendar').find('.twm').val());
			wyfcalendar.o.selectdate.setHours(parseInt($('.wyfcalendar').find('.tws').val()),parseInt($('.wyfcalendar').find('.twf').val()),parseInt($('.wyfcalendar').find('.twm').val()));
		}
		$(wyfcalendar.o).val(str);
		if(wyfcalendar.oth && !wyfcalendar.isdatestr){
			$(wyfcalendar.oth).val(wyfcalendar.o.selectdate.getTime()/1000);
		}else if(wyfcalendar.oth){
			$(wyfcalendar.oth).val(str);
		}
		wyfcalendar.close();
	},
	close : function(){
		$('.wyfcalendar').remove();
	},
	setnow : function(){
		wyfcalendar.o.selectdate = new Date();
		if(wyfcalendar.wt){
			$('.wyfcalendar').find('.tws').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getHours()));
			$('.wyfcalendar').find('.twf').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getMinutes()));
			$('.wyfcalendar').find('.twm').val(wyfcalendar.getbl(wyfcalendar.o.selectdate.getSeconds()));
		}
		wyfcalendar.confirm();
	},
	clear : function(){
		$(wyfcalendar.o).val('');
		if(wyfcalendar.oth){
			$(wyfcalendar.oth).val('');
		}
	}
}
$(document).ready(function(){
	$('head').append(wyfcalendar.css);
	$(document).mousedown(function(){
		if($('.wyfcalendar').size()>0 && !wyfcalendar.isoncal){
			wyfcalendar.close();
		}
	});
});