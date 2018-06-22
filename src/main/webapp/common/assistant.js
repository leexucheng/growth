$.extend($.fn.form.methods,{
	getData:function(jq){
		var json = {};
		var arr = $(jq[0]).serializeArray();
		for(var i=0;i<arr.length;i++){
			json[arr[i].name]=arr[i].value;
		}
		return json;
	},
	getSerialize:function(jq){
		return $(jq[0]).serialize();
	}
});

function currentDate(){
	var date = new Date();
	return date.getFullYear() + "-" + add0((date.getMonth() + 1)) + "-" + add0(date.getDate());
	
}

function add0(v){
	if(v < 10){
		return '0' + v;
	}
	return v;
}
