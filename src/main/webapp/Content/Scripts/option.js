
$(function () {
    var show_count = 20;   //要显示的条数
    var count = 1;    //递增的开始值，这里是你的ID
    $("#btn_addtr").click(function () {

        var length = $("#dynamicTable tbody tr").length;
        //alert(length);
        if (length < show_count)    //点击时候，如果当前的数字小于递增结束的条件
        {
            $("#tab11 tbody tr").clone().appendTo("#dynamicTable tbody");   //在表格后面添加一行
            changeIndex();//更新行号
        }
    });


});
function changeIndex() {
    var i = 1;
    $("#dynamicTable tbody tr").each(function () { //循环tab tbody下的tr
        $(this).find("input[name='NO']").val(i++);//更新行号
    });
}

function deltr(opp) {
    var length = $("#dynamicTable tbody tr").length;
    //alert(length);
    if (length <= 2) {
        swal("至少保留两个选项");
    } else {
        $(opp).parent().parent().remove();//移除当前行
        changeIndex();
    }
}


$(function () {
    var show_count = 20;   //要显示的条数
    var count = 1;    //递增的开始值，这里是你的ID
    $("#btn_addtr1").click(function () {

        var length = $("#dynamicTable1 tbody tr").length;
        //alert(length);
        if (length < show_count)    //点击时候，如果当前的数字小于递增结束的条件
        {
            $("#tab111 tbody tr").clone().appendTo("#dynamicTable1 tbody");   //在表格后面添加一行
            changeIndex1();//更新行号
        }
    });


});
function changeIndex1() {
    var i = 1;
    $("#dynamicTable1 tbody tr").each(function () { //循环tab tbody下的tr
        $(this).find("input[name='NO']").val(i++);//更新行号
    });
}

function deltr1(opp) {
    var length = $("#dynamicTable1 tbody tr").length;
    //alert(length);
    if (length <= 2) {
        swal("至少保留两个选项");
    } else {
        $(opp).parent().parent().remove();//移除当前行
        changeIndex();
    }
}