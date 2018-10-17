<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<script src="./proper/xlsx.full.js"></script>
<script src="./proper/FileSaver.js"></script>
<script src="./source/jquery-3.3.1.js"></script>
<script src="./source/popper.min.js"></script>
<script src="./source/bootstrap.js"></script>
<script src="./source/jquery.autocomplete.js?a=2"></script>
<script src="./source/moment.js"></script>
<script src="./source/jquery.cookie.js"></script>
<script src="./source/project.excel.js?a=3"></script>
<script src="https://unpkg.com/ionicons@4.4.4/dist/ionicons.js"></script>
<link rel="stylesheet" href="./source/bootstrap.css">

<body>
<header class="card" style="margin: 10px 40px 10px 40px;padding: 15px;background-color: #f6f3f6;box-shadow: 5px 5px 2px #eaeaea">
    <div style="margin-top: 10px;">
        <div class="input-group mb-3" style="width: 40%;float: left">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">客户名</span>
            </div>
            <input id="user-name-input" type="text" class="form-control" placeholder="输入 客户名" aria-label="Username" aria-describedby="basic-addon1">

            <!--<button type="button" class="btn btn-primary" style="margin-left: 20px;width: 100px;">添加</button>-->
        </div>

        <!-- 上传文件 -->
        <div style="float: left;display: none">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" onchange="upload(this)">
                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                </div>
            </div>
        </div>

        <div id="brand-select" class="btn-group " style="float: left;margin-left: 30px;">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                选择客户
            </button>
            <div class="dropdown-menu " >
                <a class="dropdown-item" href="#" onclick="javascript:$('.dropdown-toggle').html('Action')">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
                <a class="dropdown-item" href="#">Separated link</a>
            </div>
        </div>

    </div>

    <!--<div style="margin-top: 10px;">-->
    <!--<div class="input-group mb-3" style="width: 50%;">-->
    <!--<div class="input-group-prepend">-->
    <!--<span class="input-group-text" id="basic-addon2">免税店</span>-->
    <!--</div>-->
    <!--<input type="text" class="form-control" placeholder="输入 免税店" aria-label="Storename" aria-describedby="basic-addon2">-->

    <!--<button type="button" class="btn btn-primary" style="margin-left: 20px;width: 100px;">添加</button>-->
    <!--</div>-->
    <!--</div>-->

    <div class="container" style="padding: 0px;margin: 0px;">
        <div class="row">
            <!--<div class="col-3">-->
            <!--<div class="input-group mb-3">-->
            <!--<select class="custom-select" id="StoreGroupSelect">-->
            <!--<option selected>选择免税店</option>-->
            <!--</select>-->
            <!--</div>-->
            <!--</div>-->
            <div class="col-2">
                <input id="jine-input" type="text" class="form-control" placeholder="金额" aria-label="" aria-describedby="basic-addon2" >
            </div>
            <div class="col-2">
                <input id="dianshu-input" type="text" class="form-control" placeholder="点数(%)" aria-label="" aria-describedby="basic-addon2" >
            </div>
            <div class="col-2 pinpa-input-div" style="display: none">
                <input id="pinpai-input" type="text" class="form-control" placeholder="品牌" aria-label="" aria-describedby="basic-addon2">
            </div>

            <div class="col-2 zhuijiafandian-input-div" style="display: none">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">追加点数</span>
                    </div>
                    <input id="zhuijiafandian-input" type="text" class="form-control" placeholder="输入点数" aria-label="输入点数" aria-describedby="basic-addon2" value="0">
                </div>
            </div>

            <div class="col-2">
                <button type="button" class="btn btn-primary  btn-block" onclick="addItem()">添加一条商品</button>
            </div>

            <div class="col-2">
                <button data-target="#fandianDialog" data-whatever="@mdo" data-toggle="modal" type="button" class="btn btn-info  btn-block" onclick="initFandinDialog()" >设置点数</button>
            </div>
        </div>

        <div class="row" style="margin-top: 10px;">
            <div class="col-2">
                <input id="excel-date-input" type="text" class="form-control" placeholder="日期" aria-label="" aria-describedby="basic-addon2">
            </div>
            <div class="col-2" style="display: none;">
                <input id="excel-rate-dk" type="text" class="form-control" placeholder="汇率(美金兑韩元)" aria-label="" aria-describedby="basic-addon2" onkeyup="value=value.replace(/[^\d]/g,'')" value="0">
            </div>
            <div class="col-2" style="display: none;">
                <input id="excel-rate-kz" type="text" class="form-control" placeholder="汇率(韩元兑人民币)" aria-label="" aria-describedby="basic-addon2" onkeyup="value=value.replace(/[^\d]/g,'')" value="0">
            </div>
            <div class="col-6">
                <button type="button" class="btn btn-success btn-lg btn-block" onclick="downExcel($('#user-name-input').val(),$('#excel-date-input').val())">生成Excel</button>
            </div>
            <div class="col-2" >
                <button type="button" class="btn btn-info btn-lg btn-block" onclick="downLogText()">下载Log</button>
            </div>
        </div>
    </div>
</header>

<!-- 添加免税店的方法
    nav-link的id
    href的值
    name的值

    特殊返点属性值 teshu="true"
 -->
<main style="overflow: auto;margin: 10px 40px 10px 40px;padding: 15px;">
    <div>
        <button data-target="#brandModalUpdate" data-whatever="@mdo" data-toggle="modal" type="button" class="btn btn-warning" style="position: absolute;right: 133px;" onclick="openBrandUpdateModal()">修改当前免税店</button>
        <button data-target="#brandModal" data-whatever="@mdo" data-toggle="modal" type="button" class="btn btn-info" style="position: absolute;right: 30px;width: 100px">添加免税店</button>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist" style="overflow: auto">
        <li class="nav-item nave-li-1" >
            <a class="nav-link active" id="nave-tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-selected="true" style="float: left">1</a>
        </li>
        <li class="nav-item nave-li-2" >
            <a class="nav-link " id="nave-tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="profile" aria-selected="false">2</a>
        </li>
        <li class="nav-item nave-li-3">
            <a class="nav-link " id="nave-tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="profile" aria-selected="false">3</a>
        </li>
        <li class="nav-item nave-li-4">
            <a class="nav-link " id="nave-tab-4" data-toggle="tab" href="#tab4" role="tab" aria-controls="profile" aria-selected="false">4</a>
        </li>
        <li class="nav-item nave-li-6">
            <a class="nav-link " id="nave-tab-6" data-toggle="tab" href="#tab6" role="tab" aria-controls="profile" aria-selected="false">5</a>
        </li>
        <li class="nav-item nave-li-7">
            <a class="nav-link " id="nave-tab-7" data-toggle="tab" href="#tab7" role="tab" aria-controls="profile" aria-selected="false">6</a>
        </li>
        <li class="nav-item nave-li-8">
            <a class="nav-link " id="nave-tab-8" data-toggle="tab" href="#tab8" role="tab" aria-controls="profile" aria-selected="false">7</a>
        </li>
        <li class="nav-item nave-li-5" teshu="true">
            <a class="nav-link " id="nave-tab-5" data-toggle="tab" href="#tab5" role="tab" aria-controls="profile" aria-selected="false">特殊返点</a>
        </li>
    </ul>
    <div class="tab-content " id="myTabContent" style="padding: 10px 30px 10px 30px;">
        <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="nave-tab-1" style="padding-top: 10px;" name="1">

            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab2" role="tabpanel" aria-labelledby="nave-tab-2" name="2">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab3" role="tabpanel" aria-labelledby="nave-tab-3" name="3">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab4" role="tabpanel" aria-labelledby="nave-tab-4" name="4">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab6" role="tabpanel" aria-labelledby="nave-tab-4" name="5">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab7" role="tabpanel" aria-labelledby="nave-tab-4" name="6">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab8" role="tabpanel" aria-labelledby="nave-tab-4" name="7">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-3" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-3" style="border: 1px solid lightgray;">点数</div>
                <div class="col-3" style="border: 1px solid lightgray;">返点(美金)</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade "  id="tab5" role="tabpanel" aria-labelledby="nave-tab-5" name="特殊返点">
            <div class="row" style="text-align: center;">
                <div class="col-1" style="border: 1px solid lightgray;">序</div>
                <div class="col-2" style="border: 1px solid lightgray;">品牌</div>
                <div class="col-2" style="border: 1px solid lightgray;">购买金额(美金)</div>
                <div class="col-2" style="border: 1px solid lightgray;">点数</div>
                <div class="col-2" style="border: 1px solid lightgray;">返点(美金)</div>
                <div class="col-2" style="border: 1px solid lightgray;">追加点数</div>
            </div>
            <div class="list-data" style="margin-bottom: 30px;min-height: 150px;" >

            </div>

            <div class="total-data" style="">
                <div class="row" style="text-align: center">
                    <div class="col-1" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;">合计</div>
                    <div class="col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="jine-total col-3" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="col-2" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                    <div class="fandian-total col-2" style="background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;"></div>
                </div>
            </div>
        </div>
    </div>

</main>

<!-- 添加免税店 -->
<div class="modal fade" id="brandModal" tabindex="-1" role="dialog" aria-labelledby="brandModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="brandModalLabel">添加免税店</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="brand-name" class="col-form-label">免税店名:</label>
                        <input id="brand-name" type="text" class="form-control"  placeholder="请输入免税店名" >
                    </div>

                    <div class="form-group">
                        <label for="brand-name" class="col-form-label">免税店名:</label>
                        <input id="brand-name-add-dianshu" type="text" class="form-control"  placeholder="请输入免税店名" >
                    </div>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <label id="brand-name-check" class="custom-control-label" for="customCheck1">特殊返点类型的免税店</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createBrand($('#brand-name').val(),$('#customCheck1').val())">添加</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改免税店 -->
<div class="modal fade" id="brandModalUpdate" tabindex="-1" role="dialog" aria-labelledby="brandModalUpdateLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="brandModalUpdateLabel">修改免税店</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="brand-name" class="col-form-label">免税店名:</label>
                    <input id="brand-name-update" type="text" class="form-control"  placeholder="修改免税店名" >
                </div>
                <div class="form-group">
                    <label for="brand-name" class="col-form-label">点数:</label>
                    <input id="brand-name-update-dianshu" type="text" class="form-control"  placeholder="修改免税店名" >
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="" style="display: none">删除免税店</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="brandUpdate()">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 设置点数 -->
<div class="modal fade" id="fandianDialog" tabindex="-1" role="dialog" aria-labelledby="fandianDialogLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fandianDialogLabel">设置点数</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id="dianshu-input-body-dialog" class="modal-body ">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroup-sizing-default">Default</span>
                    </div>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateFandian()">修改</button>
            </div>
        </div>
    </div>
</div>

<table id="table-excel" style="display: none"></table>

<style>
    .table-border-cu-line{
        border: 2px solid;
    }
</style>
</body>

<script>

    var cookieSaveData=new Array();//쿠키 저장 데이터

    var totalData=new Array();

    var menu_tab_index=8;
    var navi_li_classname='nave-li-1';//免税店选择tab的Class命
    var fandianDatas;//反点数据

    function createBrand(brandName,isZhuiija) {

        var menuLiHtml="";//免税店Menu名Html
        var contentHtml="";
        menu_tab_index+=1;
        if (isZhuiija){

        }else{
        }
        menuLiHtml+="<li class='nav-item nave-li-"+menu_tab_index+"' >";

        menuLiHtml+="<a class=\"nav-link\" id=\"nave-tab-"+menu_tab_index+"\" data-toggle=\"tab\" href=\"#tab"+menu_tab_index+"\" role=\"tab\" aria-controls=\"profile\" aria-selected=\"false\">"+brandName+"</a>";
        menuLiHtml+="</li>";

        contentHtml="<div class=\"tab-pane fade \" id=\"tab"+menu_tab_index+"\" role=\"tabpanel\" aria-labelledby=\"nave-tab-"+menu_tab_index+"\" style=\"padding-top: 10px;\" name=\""+brandName+"\">\n" +
            "\n" +
            "                <div class=\"row\" style=\"text-align: center;\">\n" +
            "                    <div class=\"col-1\" style=\"border: 1px solid lightgray;\">序</div>\n" +
            "                    <div class=\"col-3\" style=\"border: 1px solid lightgray;\">购买金额(美金)</div>\n" +
            "                    <div class=\"col-3\" style=\"border: 1px solid lightgray;\">点数</div>\n" +
            "                    <div class=\"col-3\" style=\"border: 1px solid lightgray;\">返点(美金)</div>\n" +
            "                </div>\n" +
            "                <div class=\"list-data\" style=\"margin-bottom: 30px;min-height: 150px;\" >\n" +
            "\n" +
            "                </div>\n" +
            "\n" +
            "                <div class=\"total-data\" style=\"\">\n" +
            "                    <div class=\"row\" style=\"text-align: center\">\n" +
            "                        <div class=\"col-1\" style=\"background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;\">合计</div>\n" +
            "                        <div class=\"jine-total col-3\" style=\"background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;\"></div>\n" +
            "                        <div class=\"col-3\" style=\"background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;\"></div>\n" +
            "                        <div class=\"fandian-total col-3\" style=\"background-color: #55b15b;height: 30px;line-height: 30px;border: 1px solid #4c4c4c;\"></div>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "            </div>";

        $('.nave-li-5').before(menuLiHtml);

//        $("#myTab").append(menuLiHtml);
        $("#myTabContent").append(contentHtml);

        if (fandianDatas!=null && $("#brand-name-add-dianshu").val().length>0){
            var _fandianItem={
                brandName:$("#brand-name").val(),
                fandian:$("#brand-name-add-dianshu").val()
            }
            fandianDatas.push(_fandianItem);
            $.ajax({
                url:"updateFandian",
                type:"post",
                data:JSON.stringify(fandianDatas),
                contentType:"application/json",
                dataType:"json",
                success:function(result){
                    getFandian();
                }
            });
        }

        initMytabClick();
    };

    //初始化的值
    function initParam() {
        navi_li_classname='nave-li-1';

    }

    function initMytabClick() {
        $('#myTab li').click(function () {
            for (var i=0;i<$(this).attr('class').split(" ").length;i++){

                if ($(this).attr('class').split(" ")[i].indexOf('nave-li')>=0){
                    navi_li_classname=$(this).attr('class').split(" ")[i];
                }
            }

            setBrandFandian();

            if ($(this).attr('teshu')){
                $('.pinpa-input-div').css('display','inline');
                $('.zhuijiafandian-input-div').css('display','inline');
            }else{
                $('.pinpa-input-div').css('display','none');
                $('.zhuijiafandian-input-div').css('display','none');
            }
        });
    }

    $(function () {
        initParam();

        document.onkeydown=function (event) {

            var e = event || window.event;
            if (e && e.keyCode==13){//Enter키
                addItem();
                $("#jine-input").focus();
            }
        }

        initMytabClick();

        for (var i = 0; i < 20; i++) {

            for (var j = 0; j < enlishCode.length; j++) {
                excelCellEnglish.push((excelCellEnglish[i]+enlishCode[j]))
            }

        }

        getFandian();
    });

    function addItem() {

        var brandName=$('#myTab li.nav-item a.active').html();
        var tableHtml= $('div[name="'+brandName+'"] .list-data');
        var jineTotalHtml= $('div[name="'+brandName+'"] .total-data .jine-total');
        var fandianTotalHtml=$('div[name="'+brandName+'"] .total-data .fandian-total');

        if ($("#user-name-input").val().length<1){
            $("#user-name-input").focus();
            alert('请输入客户名');
            return
        }
        else if ($('#jine-input').val().length<=0 && !$($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')){
            $('#jine-input').focus();
            alert('输入金额');
            return
        }
        else if ($('#dianshu-input').val().length<=0){
            alert('输入点数');
            return
        }

        //特殊返点
        if ($($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')){
            if ($('#pinpai-input').val().length<=0){
                alert('特殊返点需要输入品牌');
                return
            }
        }


        // getTotalData($("#user-name-input").val());

        var itemData={
            jine:$('#jine-input').val(),
            dianshu:$('#dianshu-input').val(),
            fandian:Math.round(($('#jine-input').val() * ($('#dianshu-input').val()/100))*100)/100,
            pinpai:$('#pinpai-input').val(),//品牌名,特殊返点类型的时候需要添加
            zhuijiadianshu:$('#zhuijiafandian-input').val()//特殊反点中的追加返点中的追加点数值
        };

        //特殊反点,并且金额没写或者0的时候那么点数就不需要加 '%'了
        if ($($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')
            &&($('#jine-input').val().length<0 || $('#jine-input').val()==0)){

            itemData.jine=0;

        }

        var isnew=true;
        var tabIndex=-1;

        for (var i=0;i<totalData.length;i++){
            var item=totalData[i];
            if (item.brandName==$('#myTab li.nav-item a.active').html()){
                item.items.push(itemData);
                isnew=false;
                tabIndex=i;

                break;
            }
        }

        if (isnew){
            var itemObj={
                brandName:String,
                teshu:Boolean,
                items:new Array(),
            };
            itemObj.brandName=$('#myTab li.nav-item a.active').html();
            itemObj.teshu=$($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')?true:false
            itemObj.items.push(itemData);

            var _b=true;
            var _i=-1;
            if (totalData.length>0){
                if (totalData[totalData.length-1].teshu){
                    // _i=totalData.length-2>=0?totalData.length-2:0;
                    _i=totalData.length-1;
                    totalData.insert(_i,itemObj);
                    _b=false;
                    tabIndex=_i
                }
            }

            if (_b){
                totalData.push(itemObj);
                tabIndex=totalData.length-1;
            }

        }
        $("#jine-input").val('');
        if ($($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')){
            $("#pinpai-input").val('');
        }

        reDrawItemHtml(tabIndex);

    }

    function openBrandUpdateModal() {
        $('#brand-name-update').val($('.'+navi_li_classname).children('a').html());

        $('#brand-name-update-dianshu').val('');
        //设置点数
        if (fandianDatas!=null){

            for (var i=0;i<fandianDatas.length;i++){

                if (fandianDatas[i].brandName==$('.'+navi_li_classname).children('a').html()){
                    $('#brand-name-update-dianshu').val(fandianDatas[i].fandian);
                    break;
                }

            }

        }
    }

    // 修改免税店
    function brandUpdate() {

        for (var i=0;i<totalData.length;i++){
            if (totalData[i].brandName==$('.'+navi_li_classname).children('a').html()){
                totalData[i].brandName=$('#brand-name-update').val();
                break;
            }
        }

        $('.'+navi_li_classname).children('a').html($('#brand-name-update').val());
        var tabId=$('.'+navi_li_classname).children('a').attr('href').replace('#','');
        $('#'+tabId).attr('name',$('#brand-name-update').val());

        //设置点数
        if (fandianDatas!=null && $('#brand-name-update-dianshu').val().length>0){
            var isNew=true;

            for (var i=0;i<fandianDatas.length;i++){
                if (fandianDatas[i].brandName==$('.'+navi_li_classname).children('a').html()){
                    fandianDatas[i].fandian=$('#brand-name-update-dianshu').val();
                    isNew=false;
                    break;
                }
            }

            if (isNew){
                var _item={
                    brandName:$('.'+navi_li_classname).children('a').html(),
                    fandian:$('#brand-name-update-dianshu').val()
                }
                fandianDatas.push(_item);
            }

            $.ajax({
                url:"updateFandian",
                type:"post",
                data:JSON.stringify(fandianDatas),
                contentType:"application/json",
                dataType:"json",
                success:function(result){
                    getFandian();
                }
            });
        }

    }

    //删除免税店
    function brandDelete() {
        $('.'+navi_li_classname).remove();
//        $("#myTab").children();
    }

    //重拍数据,要根据tab的顺序
    function reSortData(data) {

        var naviNames=new Array();

        for(var i=0;i<$("#myTab").children().length;i++){
            var el=$("#myTab").children()[i];
            naviNames.push($(el).children('a').html());
        }

        var resultData=new Array();


        for(var i=0;i<naviNames.length;i++){

            for (var j=0;j<data.length;j++){

                if (naviNames[i]==data[j].brandName){
                    resultData.push(data[j]);
                    break;
                }
            }
        }
        return resultData;

    }

    //获取反点数据
    function getFandian() {

        $.ajax({
            url:"getFandian",
            dataType:"json",
            success:function (result) {
                fandianDatas=eval("("+result+")");

                setBrandFandian();

            }
        });
    }

    //设置当前免税店的点数
    function setBrandFandian() {

        $("#dianshu-input").val('');

        for (var i=0;i<fandianDatas.length;i++){
            if (fandianDatas[i].brandName==$('.'+navi_li_classname).children('a').html()){
                $("#dianshu-input").val(fandianDatas[i].fandian);
                break;
            }
        }
    }

    //更新免税店点数
    function updateFandian() {

        var fandianArray=new Array();

        for (var i=0;i<$("#dianshu-input-body-dialog").children().length;i++){
            var el=$("#dianshu-input-body-dialog").children()[i];
            if ($(el).find('input').val().length>0){
                var item={
                    "brandName":$(el).find('span').html(),
                    "fandian":$(el).find('input').val()
                }
                fandianArray.push(item);
            }
        }

        $.ajax({
            url:"updateFandian",
            type:"post",
            data:JSON.stringify(fandianArray),
            contentType:"application/json",
            dataType:"json",
            success:function(result){
                getFandian();
            }
        });

    }
    
    function initFandinDialog() {

        $("#dianshu-input-body-dialog").empty();

        for (var i=0;i<$("#myTab").children().length;i++){
            var el=$("#myTab").children()[i];

            var fandian='';
            var inputSpanId="fandian-group-input-"+i;

            try{
                if (fandianDatas!=null){
                    for (var j=0;j<fandianDatas.length;j++){
                        if ($(el).children('a').html()==fandianDatas[j].brandName){
                            fandian=fandianDatas[j].fandian;
                            break;
                        }
                    }
                }
            }catch (e){}

            var elHtml="<div class=\"input-group mb-3\">\n" +
                "                    <div class=\"input-group-prepend\">\n" +
                "                        <span class=\"input-group-text\" id=\""+inputSpanId+"\">"+$(el).children('a').html()+"</span>\n" +
                "                    </div>\n" +
                "                    <input type=\"text\" class=\"form-control\" aria-label=\"Sizing example input\" aria-describedby=\""+inputSpanId+"\" value='"+fandian+"'>\n" +
                "                </div>";
            $("#dianshu-input-body-dialog").append(elHtml);
        }

    }

    //列坐标字母
    var excelCellEnglish=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    var enlishCode=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    /**
     *
     * @param userName
     * @param datetxt
     */
    function downExcel(userName,datetxt) {

        if ($("#user-name-input").val().length<1){
            $("#user-name-input").focus();
            alert('请输入客户名');
            return
        }else if ($("#excel-date-input").val().length<1){
            $("#excel-date-input").focus();
            alert('请输入日期');
            return
        }
        else if ($("#excel-rate-dk").val().length<1){
            $("#excel-rate-dk").focus();
            alert('请输入汇率(美元兑韩币)');
            return
        }
        else if ($("#excel-rate-kz").val().length<1){
            $("#excel-rate-kz").focus();
            alert('请输入汇率(韩币兑人民币)');
            return
        }

        totalData=reSortData(totalData);
        console.log(JSON.stringify(totalData));

        //============= excel 工作中 ====================
        var sheetName=userName+"_"+moment().format('YYYY-MM-DD');
        var rowsHeight=[10,27,20];//设置高度.
        var merges=[//合并
        ];
        var rowMergesLineNumber=3;//上面3行是 固定高度.
        var itemSumline=0;//数据中,获取最长数据数目的数字.(获取的实际数据中再+backItemSum,以备份用)
        var backItemSum=3;//比实际数据中多加行

        var zongjieMeijinFormula='';//购买总金额-美金的公式
        var zongjieFandianFormula='';//返点总金额-美金的公式
        var zongjieFandianTotalKoFormula='';//返点总金额(韩元)-的公式
        var zongjieFandianTotalZhFormula='';//返点总金额(人民币)-的公式

        //汇率
        //美金->韩币
        var drRateKo=$("#excel-rate-dk").val();
        //韩币->人民币
        var koRateZh=$("#excel-rate-kz").val();

        //如果有追加,那么就把追加放到最后一位
        for (var i=0;i<totalData.length;i++){
            if (totalData[i].teshu){
                totalData.push(totalData[i]);
                totalData.splice(i,1);
            }
        }

        //得去最长数据数字
        for (var i=0;i<totalData.length;i++){
            if (totalData[i].items.length>itemSumline){
                itemSumline=totalData[i].items.length;
            }
        };
        itemSumline=itemSumline+rowMergesLineNumber+backItemSum;

        //合并部分
        merges=[//合并
            {//'序'字 合并
                s: {c: 1, r: 1},//开始坐标
                e: {c: 1, r: 2}//结束坐标
            },
            //客户名合并(合计下面)
            {
                s:{c:1,r:itemSumline+1},
                e:{c:2,r:itemSumline+1},
            },
            //日期合并(合计下面)
            {
                s:{c:3,r:itemSumline+1},
                e:{c:4,r:itemSumline+1}
            },

            //总结--开始
            {
                s:{c:2,r:itemSumline+1+2},
                e:{c:3,r:itemSumline+1+2}
            },
            {
                s:{c:4,r:itemSumline+1+2},
                e:{c:5,r:itemSumline+1+2}
            },
            {
                s:{c:2,r:itemSumline+1+3},
                e:{c:3,r:itemSumline+1+3}
            },
            {
                s:{c:4,r:itemSumline+1+3},
                e:{c:5,r:itemSumline+1+3}
            },
            {
                s:{c:2,r:itemSumline+1+4},
                e:{c:3,r:itemSumline+1+4}
            },
            {
                s:{c:4,r:itemSumline+1+4},
                e:{c:5,r:itemSumline+1+4}
            },
            {
                s:{c:2,r:itemSumline+1+5},
                e:{c:3,r:itemSumline+1+5}
            },
            {
                s:{c:4,r:itemSumline+1+5},
                e:{c:5,r:itemSumline+1+5}
            },
            {
                s:{c:2,r:itemSumline+1+6},
                e:{c:3,r:itemSumline+1+6}
            },
            {
                s:{c:4,r:itemSumline+1+6},
                e:{c:5,r:itemSumline+1+6}
            },
            {
                s:{c:2,r:itemSumline+1+7},
                e:{c:3,r:itemSumline+1+7}
            },
            {
                s:{c:4,r:itemSumline+1+7},
                e:{c:5,r:itemSumline+1+7}
            },
            {
                s:{c:2,r:itemSumline+1+8},
                e:{c:3,r:itemSumline+1+8}
            },
            {
                s:{c:4,r:itemSumline+1+8},
                e:{c:5,r:itemSumline+1+8}
            },
            {
                s:{c:2,r:itemSumline+1+9},
                e:{c:3,r:itemSumline+1+9}
            },
            {
                s:{c:4,r:itemSumline+1+9},
                e:{c:5,r:itemSumline+1+9}
            },
            {
                s:{c:2,r:itemSumline+1+10},
                e:{c:3,r:itemSumline+1+10}
            },
            {
                s:{c:4,r:itemSumline+1+10},
                e:{c:5,r:itemSumline+1+10}
            },
            //总结---结束

            //追加总结开始
            {
                s:{c:2,r:itemSumline+13},
                e:{c:5,r:itemSumline+13}
            },
        ];

        //免税店名合并
        var _c=0;
        for (var i=0;i<totalData.length;i++){

            var item
            _c+=2;

            if (totalData[i].teshu){
                item={
                    s:{c:_c,r:1},
                    e:{c:_c+3,r:1}
                }
                _c+=1;
            }else {
                item={
                    s:{c:_c,r:1},
                    e:{c:_c+2,r:1}
                }
            }

            _c+=1;
            merges.push(item);
        }


        var workbook={
            SheetNames:[sheetName],
            Sheets:{
                Sheet1: {
                    '!ref': 'A1:ZZ100',
                    '!cols':[{wpx:20},{wpx:40},
                        {wpx:100},{wpx:100},{wpx:100},//标题标签长度
                        {wpx:100},{wpx:70},{wpx:70}, {wpx:100},{wpx:70},{wpx:70},
                        {wpx:100},{wpx:100},{wpx:70}, {wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},{wpx:100},{wpx:70},{wpx:70},
                    ],
                    '!rows':rowsHeight,
                    '!merges':merges,

                    //'序'字---开始
                    B2:{
                        v:'序',//内容
                        t:'s',//应该是变量类型, s为String
                        s:{//Style
                            alignment:cellContentPosition.textCenter,
                            border:borderStyle.boldLine,//边线
                            fill:{
                                fgColor:{rgb : "86e38d"}
                            }
                        }
                    },
                    B3:{
                        s:{
                            border:borderStyle.shopLine,//边线
                        }
                    },
                    //'序'字结束
                }
            }

        };

        //免税店名cell
        var data_col_index=2;//列开始坐标
        var data_row_index=2;//行开始坐标
        for (var i=0;i<totalData.length;i++){
            var _brandBgColor=colors.yellow;

            if (i%2==1){
                _brandBgColor=colors.blueGray;
            }

            var itemData={
                v:totalData[i].brandName,
                s:{
                    alignment:cellContentPosition.textCenter,
                    font:{
                        bold:true//加粗
                    },
                    border:borderStyle.shopLine,
                    fill:{
                        fgColor:{rgb:_brandBgColor}
                    }
                }
            };
            var line={s:{border:borderStyle.shopLine}};

            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index]+data_row_index]=itemData;
            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index+1]+data_row_index]=line;
            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index+2]+data_row_index]=line;

            if (totalData[i].teshu) {
                itemData.s.fill={
                    fgColor:{rgb:colors.otherGreen}
                }
                workbook.Sheets.Sheet1[excelCellEnglish[data_col_index + 3] + data_row_index] = line;
            }

            data_row_index+=1;
            var _pPosition;//品牌坐标
            var _gPosition;//购买金额坐标
            var _dPosition;//点数坐标
            var _fPosition;//返点坐标
            //特殊返点
            if (totalData[i].teshu){

                _pPosition=excelCellEnglish[data_col_index]+data_row_index;
                _gPosition=excelCellEnglish[data_col_index+1]+data_row_index;
                _dPosition=excelCellEnglish[data_col_index+2]+data_row_index;
                _fPosition=excelCellEnglish[data_col_index+3]+data_row_index;

                workbook.Sheets.Sheet1[_pPosition]={
                    v:'品牌',
                    t:'s',
                    s:excelStyle.titleLabelCell
                };

                data_col_index+=4;
            }else{
                _gPosition=excelCellEnglish[data_col_index]+data_row_index;
                _dPosition=excelCellEnglish[data_col_index+1]+data_row_index;
                _fPosition=excelCellEnglish[data_col_index+2]+data_row_index;

                data_col_index+=3;
            }
//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index]+data_row_index]=itemData;
//            data_col_index+=1;
//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index]+data_row_index]=line;
//            data_col_index+=1;
//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index]+data_row_index]=line;
//            data_row_index+=1;

//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index-2]+data_row_index]={
//                v:'购买金额(美金)',
//                t:'s',
//                s:excelStyle.titleLabelCell
//            };
//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index-1]+data_row_index]={
//                v:'点数',
//                t:'s',
//                s:excelStyle.titleLabelCell
//            };
//            workbook.Sheets.Sheet1[excelCellEnglish[data_col_index]+data_row_index]={
//                v:'返点(美金)',
//                t:'s',
//                s:excelStyle.titleRightLabelCell
//            };
            workbook.Sheets.Sheet1[_gPosition]={
                v:'购买金额(美金)',
                t:'s',
                s:excelStyle.titleLabelCell
            };
            workbook.Sheets.Sheet1[_dPosition]={
                v:'点数',
                t:'s',
                s:excelStyle.titleLabelCell
            };
            workbook.Sheets.Sheet1[_fPosition]={
                v:'返点(美金)',
                t:'s',
                s:excelStyle.titleRightLabelCell
            };

            data_row_index=2;
//            data_col_index+=1;
        }

        //填写数据
        var zhuijiaDianshu=new Array();//追加反点的追加点数的数组.
        data_col_index=2,data_row_index=4;
        var itemShijiLine=itemSumline-rowMergesLineNumber;//实际ITEM数量+保留行
        for(var i=0;i<totalData.length;i++){

            var item=totalData[i];
            var isTeshu=item.teshu;//是否特殊追加行

            var redItemArray=new Array();//红色标记数组

            //红色标记
            for(var k=0;k<totalData[i].items.length;k++){

                var itm=totalData[i].items[k];

                for(var j=k+1;j<totalData[i].items.length;j++) {

                    if (JSON.stringify(itm) == JSON.stringify(totalData[i].items[j])){
                        redItemArray.push(itm);
                        break;
                    }
                }
            }

            for(var j=0;j<itemShijiLine;j++){
                var _cellName=excelCellEnglish[data_col_index]+data_row_index;//坐标地址

                var _col_index_1,_col_index_2,_col_index_3,_col_index_4;

                if (item.items.length>j){
                    if (isTeshu){//如果有追加行
                        _col_index_1=data_col_index;
                        _col_index_2=data_col_index+1;
                        _col_index_3=data_col_index+2;
                        _col_index_4=data_col_index+3;

                        _cellName=excelCellEnglish[_col_index_1]+data_row_index;

                        //追加返点中有追加点数时保存
                        if (item.items[j].zhuijiadianshu>0){
                            zhuijiaDianshu.push(item.items[j]);
                        }

                        //品牌
                        workbook.Sheets.Sheet1[_cellName]={
                            v:totalData[i].items[j].pinpai,
                            t:'s',
                            s:excelStyle.dataItemCell
                        };
                    }else{
                        _col_index_2=data_col_index;
                        _col_index_3=data_col_index+1;
                        _col_index_4=data_col_index+2;
                    }

                    _cellName=excelCellEnglish[_col_index_2]+data_row_index;

                    var _jineStyle=excelStyle.dataItemCell;
                    for (var k=0;k<redItemArray.length;k++){
                        if (JSON.stringify(redItemArray[k])==JSON.stringify(item.items[j])){
                            _jineStyle=excelStyle.dataIItemRedcell;
                            break;
                        }
                    }

                    //金额数据
                    workbook.Sheets.Sheet1[_cellName]={
                        v:totalData[i].items[j].jine,
                        t:'n',
                        s:_jineStyle
                    };

                    var dianshuPa=totalData[i].items[j].dianshu+"%";
                    //特殊反点,并且金额没写或者0的时候那么点数就不需要加 '%'了
                    if (isTeshu){
                        if (totalData[i].items[j].jine==0){
                            dianshuPa=totalData[i].items[j].dianshu;
                        }
                    }

                    //点数数据
                    _cellName=excelCellEnglish[_col_index_3]+data_row_index;
                    workbook.Sheets.Sheet1[_cellName]={
                        v:dianshuPa,
                        t:'s',
                        s:excelStyle.dataItemCell
                    };
                    //返点
                    _cellName=excelCellEnglish[_col_index_4]+data_row_index;
                    workbook.Sheets.Sheet1[_cellName]={
                        v:0,
                        t:'n',
                        f: excelCellEnglish[_col_index_2]+data_row_index+'*'+excelCellEnglish[_col_index_3]+data_row_index,
                        s:excelStyle.dataRightItemCell
                    };
                } else{
                    if (isTeshu){//如果有追加行
                        _col_index_1=data_col_index;
                        _col_index_2=data_col_index+1;
                        _col_index_3=data_col_index+2;
                        _col_index_4=data_col_index+3;

                        _cellName=excelCellEnglish[_col_index_1]+data_row_index;

                        //品牌
                        workbook.Sheets.Sheet1[_cellName]={
                            v:' ',
                            t:'s',
                            s:excelStyle.dataItemCell
                        };
                    }else{
                        _col_index_2=data_col_index;
                        _col_index_3=data_col_index+1;
                        _col_index_4=data_col_index+2;
                    }

                    _cellName=excelCellEnglish[_col_index_2]+data_row_index;
                    //金额数据
                    workbook.Sheets.Sheet1[_cellName]={
                        v:' ',
                        t:'s',
                        s:excelStyle.dataItemCell
                    };
                    //点数数据
                    _cellName=excelCellEnglish[_col_index_3]+data_row_index;
                    workbook.Sheets.Sheet1[_cellName]={
                        v:' ',
                        t:'s',
                        s:excelStyle.dataItemCell
                    };
                    //返点
                    _cellName=excelCellEnglish[_col_index_4]+data_row_index;
                    workbook.Sheets.Sheet1[_cellName]={
                        v:' ',
                        t:'s',
                        s:excelStyle.dataRightItemCell
                    };
                }

                data_row_index+=1;
            }

            //合计-金额公式的String
            var hejiJineFormula='SUM('+excelCellEnglish[data_col_index]+'4'+':'+excelCellEnglish[data_col_index]+itemSumline+ ')';
            //合计-返点公式的String
            var hejiFandianFormula='SUM('+excelCellEnglish[data_col_index+2]+'4'+':'+excelCellEnglish[data_col_index+2]+itemSumline+ ')';


            var _col_index_1,_col_index_2,_col_index_3,_col_index_4;
            if (isTeshu){
                _col_index_1=data_col_index;
                _col_index_2=data_col_index+1;
                _col_index_3=data_col_index+2;
                _col_index_4=data_col_index+3;

                //品牌
                workbook.Sheets.Sheet1[excelCellEnglish[_col_index_1]+(itemSumline+1)]={
                    v:' ',
                    t:'s',
                    s:excelStyle.totalItemCell
                };
            }else{

                _col_index_2=data_col_index;
                _col_index_3=data_col_index+1;
                _col_index_4=data_col_index+2;
            }

            hejiJineFormula='SUM('+excelCellEnglish[_col_index_2]+'4'+':'+excelCellEnglish[_col_index_2]+itemSumline+ ')';
            hejiFandianFormula='SUM('+excelCellEnglish[_col_index_4]+'4'+':'+excelCellEnglish[_col_index_4]+itemSumline+ ')';

            //合计数据
            //金额
            workbook.Sheets.Sheet1[excelCellEnglish[_col_index_2]+(itemSumline+1)]={
                v:0,
                t:'n',
                f:hejiJineFormula,
                s:excelStyle.totalItemCell
            };
            //点数
            workbook.Sheets.Sheet1[excelCellEnglish[_col_index_3]+(itemSumline+1)]={
                v:' ',
                t:'s',
                s:excelStyle.totalItemCell
            };
            //返点
            workbook.Sheets.Sheet1[excelCellEnglish[_col_index_4]+(itemSumline+1)]={
                v:0,
                t:'n',
                f:hejiFandianFormula,
                s:excelStyle.totalRightItemCell
            };

            //总结公式
            zongjieMeijinFormula+=excelCellEnglish[_col_index_2]+(itemSumline+1)+'+';
            zongjieFandianFormula+=excelCellEnglish[_col_index_4]+(itemSumline+1)+'+';

            //一个免税店完成,下一个免税店的坐标值
            if (isTeshu){
                data_col_index+=4;
            }else{
                data_col_index+=3;
            }

            data_row_index=4;
        }

        //编号
        for (var i=0;i<itemShijiLine;i++){
            workbook.Sheets.Sheet1['B'+(i+4)]={
                v:(i+1),
                t:'n',
                s:excelStyle.dataIndexCell
            }

            rowsHeight.push(20);//设置高度
        }

        //合计
        workbook.Sheets.Sheet1['B'+(itemSumline+1)]={
            v:'合计',
            t:'s',
            s:excelStyle.totalLabelCell
        };
        rowsHeight.push(25);//合计高度

        //姓名
        workbook.Sheets.Sheet1['B'+(itemSumline+2)]={
            v:userName,
            t:'s',
            s:{
                border:borderStyle.topBottomLeftBold,
                alignment:cellContentPosition.textCenter,
            }
        };
        workbook.Sheets.Sheet1['C'+(itemSumline+2)]={//线
            s:{
                border:borderStyle.topBottomLeftBold,
            }
        };
        //日期
        workbook.Sheets.Sheet1['D'+(itemSumline+2)]={
            v:datetxt,
            t:'s',
            s:{
                border:borderStyle.topBottomRightBold,
                alignment:cellContentPosition.textCenter,
            }
        };
        workbook.Sheets.Sheet1['E'+(itemSumline+2)]={//线
            s:{
                border:borderStyle.topBottomRightBold
            }
        };

        //总结内容
        //姓名
        workbook.Sheets.Sheet1['C'+(itemSumline+4)]={
            v:'姓名',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.topLeftBold,
                fill:{
                    fgColor:{rgb:colors.yellow}
                }
            }
        };
        workbook.Sheets.Sheet1['D'+(itemSumline+4)]={
            s:{border:borderStyle.topLeftBold}
        };
        //姓名数据
        workbook.Sheets.Sheet1['E'+(itemSumline+4)]={
            v:userName,
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.topRightBold,
            }
        };
        workbook.Sheets.Sheet1['F'+(itemSumline+4)]={
            s:{border:borderStyle.topRightBold}
        };

        //日期
        workbook.Sheets.Sheet1['C'+(itemSumline+4+1)]={
            v:'日期',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
                fill:{
                    fgColor:{rgb:colors.otherGreen}
                }
            }
        };
        workbook.Sheets.Sheet1['D'+(itemSumline+4+1)]={s:{border:borderStyle.leftBold}};
        //日期数据
        workbook.Sheets.Sheet1['E'+(itemSumline+4+1)]={
            v:datetxt,
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
            }
        };
        workbook.Sheets.Sheet1['F'+(itemSumline+4+1)]={s:{border:borderStyle.rightBold}};

        //购买总金额(美金)
        workbook.Sheets.Sheet1['C'+(itemSumline+4+2)]={
            v:'购买总金额(美金)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        };
        workbook.Sheets.Sheet1['D'+(itemSumline+4+2)]={s:{border:borderStyle.leftBold}};

        //数据
        zongjieMeijinFormula=zongjieMeijinFormula.substr(0,zongjieMeijinFormula.length-1);
        workbook.Sheets.Sheet1['E'+(itemSumline+4+2)]={
            v:'0',
            t:'n',
            f:zongjieMeijinFormula,
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        },
            workbook.Sheets.Sheet1['F'+(itemSumline+4+2)]={s:{border:borderStyle.rightBold}},

            //返点总金额(美金)
            workbook.Sheets.Sheet1['C'+(itemSumline+4+3)]={
                v:'返点总金额(美金)',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.leftBold,
                }
            };
        workbook.Sheets.Sheet1['D'+(itemSumline+4+3)]={s:{border:borderStyle.leftBold}};

        //数据
        zongjieFandianFormula=zongjieFandianFormula.substr(0,zongjieFandianFormula.length-1);
        workbook.Sheets.Sheet1['E'+(itemSumline+4+3)]={
            v:'0',
            t:'n',
            f:zongjieFandianFormula,
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
            }
        },
            workbook.Sheets.Sheet1['F'+(itemSumline+4+3)]={s:{border:borderStyle.rightBold}},

            //0返点金额(美金)
            workbook.Sheets.Sheet1['C'+(itemSumline+4+4)]={
                v:'0返点金额(美金)',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.leftBold,
                }
            };
        workbook.Sheets.Sheet1['D'+(itemSumline+4+4)]={s:{border:borderStyle.leftBold}};
        //数据
        workbook.Sheets.Sheet1['E'+(itemSumline+4+4)]={
            v:0,
            t:'n',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
            }
        };
        workbook.Sheets.Sheet1['F'+(itemSumline+4+4)]={s:{border:borderStyle.rightBold}};

        //汇率(美金兑韩元)
        workbook.Sheets.Sheet1['C'+(itemSumline+4+5)]={
            v:'汇率(美金兑韩元)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
            }
        },
            workbook.Sheets.Sheet1['D'+(itemSumline+4+5)]={s:{border:borderStyle.leftBold}},
            //数据
            workbook.Sheets.Sheet1['E'+(itemSumline+4+5)]={
                v:drRateKo,
                t:'n',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.rightBold,
                }
            },
            workbook.Sheets.Sheet1['F'+(itemSumline+4+5)]={s:{border:borderStyle.rightBold}};

        //返点总金额(韩元)
        workbook.Sheets.Sheet1['C'+(itemSumline+4+6)]={
            v:'返点总金额(韩元)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        },
            workbook.Sheets.Sheet1['D'+(itemSumline+4+6)]={s:{border:borderStyle.leftBold}},
            //  数据
            zongjieFandianTotalKoFormula='TEXT('+('E'+(itemSumline+4+3))+'*'+('E'+(itemSumline+4+5))+',"₩  #,###")';
        workbook.Sheets.Sheet1['E'+(itemSumline+4+6)]={
            v:'0',
            t:'n',
            f:zongjieFandianTotalKoFormula,
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        },
            workbook.Sheets.Sheet1['F'+(itemSumline+4+6)]={s:{border:borderStyle.rightBold}},

            //汇率(韩元兑人民币)
            workbook.Sheets.Sheet1['C'+(itemSumline+4+7)]={
                v:'汇率(韩元兑人民币)',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.leftBold,
                }
            },
            workbook.Sheets.Sheet1['D'+(itemSumline+4+7)]={s:{border:borderStyle.leftBold}},
            //  数据
            workbook.Sheets.Sheet1['E'+(itemSumline+4+7)]={
                v:koRateZh,
                t:'n',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.rightBold,
                }
            },
            workbook.Sheets.Sheet1['F'+(itemSumline+4+7)]={s:{border:borderStyle.rightBold}},

            //返点总金额(人民币)
            workbook.Sheets.Sheet1['C'+(itemSumline+4+8)]={
                v:'返点总金额（人民币）',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.leftBottomBold,
                    font:{
                        color:{rgb:colors.red}
                    }
                }
            },
            workbook.Sheets.Sheet1['D'+(itemSumline+4+8)]={s:{border:borderStyle.leftBottomBold}};
        //  数据
        zongjieFandianTotalZhFormula='TEXT('+('E'+(itemSumline+4+6))+'/'+('E'+(itemSumline+4+7))+',"¥  #,###")'
        workbook.Sheets.Sheet1['E'+(itemSumline+4+8)]={
            v:'0',
            t:'n',
            f:zongjieFandianTotalZhFormula,
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBottomBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        };

        //追加返点总结
        workbook.Sheets.Sheet1['C'+(itemSumline+14)]={
            v:'追加返点(下次行程对金额一起结算)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.topLeftRightBold,
                font:{
                    bold:true,
                    sz:12
                },
                fill:{
                    fgColor:{rgb:colors.otherGreen}
                }
            }
        };
        workbook.Sheets.Sheet1['D'+(itemSumline+14)]={s:{border:borderStyle.topLeftRightBold}};
        workbook.Sheets.Sheet1['E'+(itemSumline+14)]={s:{border:borderStyle.topLeftRightBold}};
        workbook.Sheets.Sheet1['F'+(itemSumline+14)]={s:{border:borderStyle.topLeftRightBold}};
        //数据标题标签
        workbook.Sheets.Sheet1['C'+(itemSumline+15)]={
            v:'品牌',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBottomBold,
                font:{
                    sz:9
                },
            }
        };
        workbook.Sheets.Sheet1['D'+(itemSumline+15)]={
            v:'购买金额(美金)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.bottomBold,
                font:{
                    sz:9
                },
            }
        };
        workbook.Sheets.Sheet1['E'+(itemSumline+15)]={
            v:'追加点数',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.bottomBold,
                font:{
                    sz:9
                },
            }
        };
        workbook.Sheets.Sheet1['F'+(itemSumline+15)]={
            v:'追加返点(美金)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBottomBold,
                font:{
                    sz:9
                },
            }
        };
        //数据
        var _zLength=zhuijiaDianshu.length+4;
        var _zHejiFormula='';//追加返点合计公式
        // TODO
        for (var i=1;i<=_zLength;i++){
            var _row=itemSumline+15+i;

            var name='',goumai=0,zhuijia=0;

            if (zhuijiaDianshu.length>(i-1)){
                var _zItem=zhuijiaDianshu[i-1];
                name=_zItem.pinpai;
                //金额0时候点数成为购买金额
                if (_zItem.jine==0){
                    goumai=_zItem.dianshu;
                }else{
                    goumai=_zItem.jine
                }
                zhuijia=_zItem.zhuijiadianshu+"%";
            }

            workbook.Sheets.Sheet1['C'+_row]={
                v:name,
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.leftBold,
                }
            };
            workbook.Sheets.Sheet1['D'+_row]={
                v:goumai,
                t:'n',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.nomalLine,
                }
            };
            workbook.Sheets.Sheet1['E'+_row]={
                v:zhuijia,
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.nomalLine,
                }
            };
            workbook.Sheets.Sheet1['F'+_row]={
                v:'0',
                t:'n',
                f:('D'+_row)+'*'+('E'+_row),
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.rightBold,
                }
            };

            _zHejiFormula+='F'+_row+'+';
        }
        //合计(美金)
        workbook.Sheets.Sheet1['C'+(itemSumline+15+_zLength+1)]={
            v:'合计(美金)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
            }
        },
            workbook.Sheets.Sheet1['D'+(itemSumline+15+_zLength+1)]={
                v:'',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.nomalLine,
                }
            };
        workbook.Sheets.Sheet1['E'+(itemSumline+15+_zLength+1)]={
            v:'',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.nomalLine,
            }
        };

        _zHejiFormula=_zHejiFormula.substr(0,_zHejiFormula.length-1);
        workbook.Sheets.Sheet1['F'+(itemSumline+15+_zLength+1)]={
            v:'0',
            t:'n',
            f:_zHejiFormula,
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
            }
        };
        //韩币汇率
        workbook.Sheets.Sheet1['C'+(itemSumline+15+_zLength+1+1)]={
            v:'韩币汇率',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        },
            workbook.Sheets.Sheet1['D'+(itemSumline+15+_zLength+1+1)]={
                v:'',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.nomalLine,
                    font:{
                        color:{rgb:colors.red}
                    }
                }
            };
        workbook.Sheets.Sheet1['E'+(itemSumline+15+_zLength+1+1)]={
            v:'',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.nomalLine,
                font:{
                    color:{rgb:colors.red}
                }
            }
        };
        workbook.Sheets.Sheet1['F'+(itemSumline+15+_zLength+1+1)]={
            v:0,
            t:'n',
            f:('E'+(itemSumline+4+5)),
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBold,
                font:{
                    color:{rgb:colors.red}
                }
            }
        };

        //合计(韩币)
        workbook.Sheets.Sheet1['C'+(itemSumline+15+_zLength+1+1+1)]={
            v:'合计(韩币)',
            t:'s',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.leftBottomBold,
            }
        },
            workbook.Sheets.Sheet1['D'+(itemSumline+15+_zLength+1+1+1)]={
                v:'',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.bottomBold,
                }
            },
            workbook.Sheets.Sheet1['E'+(itemSumline+15+_zLength+1+1+1)]={
                v:'',
                t:'s',
                s:{
                    alignment:cellContentPosition.textCenter,
                    border:borderStyle.bottomBold,
                }
            };

//        var _totalKo='SUM('+(excelCellEnglish[14]+itemSumline+5+1)+':'+(excelCellEnglish[14]+itemSumline+5+_zLength)+')';
        workbook.Sheets.Sheet1['F'+(itemSumline+15+_zLength+1+1+1)]={
            v:0,
            t:'n',
            f:'TEXT('+'F'+(itemSumline+15+_zLength+1)+"*"+'F'+(itemSumline+15+_zLength+1+1)+',"#,###")',
            s:{
                alignment:cellContentPosition.textCenter,
                border:borderStyle.rightBottomBold,
            }
        },

            rowsHeight.push(18);
        //总结高度
        for(var i=0;i<23;i++){
            rowsHeight.push(25);
        }

        workbook.Sheets.Sheet1['F'+(itemSumline+4+8)]={s:{border:borderStyle.rightBottomBold}},

            console.log(JSON.stringify(workbook));

        var workData=JSON.parse(JSON.stringify(workbook).replace(/Sheet1/g,sheetName));
        var wopts = { bookType:'xlsx', bookSST:false, type:'binary' };
        var wbout = XLSX.write(workData,wopts);

        /* the saveAs call downloads a file on the local machine */
        saveAs(new Blob([s2ab(wbout)],{type:""}), moment().format("MM-DD")+""+userName+ ".xlsx");

        //
        // =================================
    }

    function downLogText() {
        saveAs(new Blob([s2ab(JSON.stringify(totalData))],{type:"utf-8"}), moment().format("MM-DD")+""+userName+ ".txt");
    }

    function s2ab(s) {
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }

    function removeItem(el,itemData,totalIndex) {
        el.remove();

        // var cao=new Array();
        // cao.push(itemData);
        // console.log(cao.length);
        // cao.remove(itemData);
        // console.log(cao.length);
        totalData[totalIndex].items.remove(itemData);
    }

    function removeItem2(itemIndex,totalIndex){

        totalData[totalIndex].items.splice(itemIndex,1);

        reDrawItemHtml(totalIndex);
    }

    //重新绘制
    function reDrawItemHtml(totalIndex){

        var brandName=$('#myTab li.nav-item a.active').html();
        var tableHtml= $('div[name="'+brandName+'"] .list-data');
        var jineTotalHtml= $('div[name="'+brandName+'"] .total-data .jine-total');
        var fandianTotalHtml=$('div[name="'+brandName+'"] .total-data .fandian-total');

        tableHtml.empty();

        var redItemArray=new Array();//红色标记数组

        //红色标记
        for(var i=0;i<totalData[totalIndex].items.length;i++){

            var itm=totalData[totalIndex].items[i];

            for(var j=i+1;j<totalData[totalIndex].items.length;j++) {

                if (JSON.stringify(itm) == JSON.stringify(totalData[totalIndex].items[j])){
                    redItemArray.push(itm);
                    break;
                }
            }
        }

        for(var i=0;i<totalData[totalIndex].items.length;i++){

            var itemData=totalData[totalIndex].items[i];

            var bgColor=i%2==0?'#ffffff':'lightgray';
            var textColor='#000000';
            for (var j=0;j<redItemArray.length;j++){
                if (JSON.stringify(redItemArray[j])==JSON.stringify(itemData)){
                    textColor='#ff0000';
                    break;
                }
            }

            var itemHtml

            if ($($('#myTab li.nav-item a.active').parents()[0]).attr('teshu')){
                var dianshuEl='';
                if (itemData.jine==0){
                    dianshuEl=itemData.dianshu;
                }else{
                    dianshuEl=itemData.dianshu+'%';
                }

                itemHtml="<div class=\"row\" style=\"text-align: center\">\n" +
                    "                        <div class=\"col-1\" style=\"border: 1px solid #4c4c4c;color:"+textColor+"background-color:"+bgColor+"\">"+(tableHtml.children().length+1)+"</div>\n" +
                    "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.pinpai+"</div>\n" +
                    "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.jine+"</div>\n" +
                    "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+dianshuEl+"</div>\n" +
                    "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.fandian+"</div>\n" +
                    "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.zhuijiadianshu+"%</div>\n" +
                    "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"removeItem2("+i+","+totalIndex+")\">删除</button>"+
                    "                    </div>";
            }else{
                itemHtml="<div class=\"row\" style=\"text-align: center\">\n" +
                    "                        <div class=\"col-1\" style=\"border: 1px solid #4c4c4c;color: "+textColor+"; background-color:"+bgColor+"\">"+(tableHtml.children().length+1)+"</div>\n" +
                    "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.jine+"</div>\n" +
                    "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;width: 30%;color:"+textColor+";background-color:"+bgColor+"\">"+itemData.dianshu+"%</div>\n" +
                    "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;width: 30%;color:"+textColor+";background-color:"+bgColor+"\">"+itemData.fandian+"</div>\n" +
                    "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"removeItem2("+i+","+totalIndex+")\">删除</button>"+
                    "                    </div>";
            }


            tableHtml.append(itemHtml);

        }

        var jineTotal=0,fandianTotal=0;

        for (var i=0;i<totalData.length;i++) {
            var item = totalData[i];
            if (item.brandName == $('#myTab li.nav-item a.active').html()) {
                for (var j=0;j<item.items.length;j++){
                    jineTotal=Number(jineTotal)+Number(item.items[j].jine);
                    fandianTotal=Number(fandianTotal)+Number(item.items[j].fandian);
                }
                break;
            }
        }

        jineTotalHtml.html(jineTotal);
        fandianTotalHtml.html(Math.floor(fandianTotal*100)/100);

//        var _isNew=true;
//        if (cookieSaveData!=null){
//
//            for (var i = 0; i < cookieSaveData.length; i++) {
//
//                if (cookieSaveData[i].userName==$("#user-name-input").val()){
//                    cookieSaveData[i].totalData=totalData;
//                    _isNew=false;
//                    break;
//                }
//            }
//        }
//
//        if (_isNew){
//
//            var codata={
//                userName:$("#user-name-input").val(),
//                totalData:totalData
//            }
//            cookieSaveData.push(codata);
//        }
//        $.cookie(
//            moment().format('YYYY-MM-DD'),
//            JSON.stringify(cookieSaveData),
//            {exprise:7});

    }

    Array.prototype.indexOf = function (val) {
        for (var i = 0; i < this.length; i++) {
            if (JSON.stringify(this[i]) == JSON.stringify(val)) return i;
        }
        return -1;
    };

    Array.prototype.remove = function (val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    Array.prototype.insert = function (index, item) {
        this.splice(index, 0, item);
    };

    //당일 고객 데이터 가져오기
    function getTotalData(userName) {

        for (var i = 0; i < cookieSaveData.length; i++) {

            if (userName==cookieSaveData[i].userName){
                totalData=cookieSaveData[i].totalData;
                break
            }
        }
    }

    function initUsrSelect() {
        $('.dropdown-menu').empty();
        if (cookieSaveData.length>0){
            for (var i = 0; i < cookieSaveData.length; i++) {
                var _html="<a class=\"dropdown-item\" href=\"#\" onclick='choiseUser(\""+cookieSaveData[i].userName+"\")'>"+cookieSaveData[i].userName+"</a>"
                $('.dropdown-menu').append(_html);
            }
        }
    }

    function choiseUser(username) {
        $('.dropdown-toggle').html(username);
        $('#user-name-input').val(username);

        for (var i = 0; i < cookieSaveData.length; i++) {
            if (cookieSaveData[i].userName=username){
                totalData=cookieSaveData[i].totalData;
                initContent();

                break;
            }
        }

    }

    function initContent() {

        $('#myTab').empty();
        var naviLi="<li class=\"nav-item nave-li-1\" >\n" +
            "                <a class=\"nav-link active\" id=\"nave-tab-1\" data-toggle=\"tab\" href=\"#tab1\" role=\"tab\" aria-controls=\"home\" aria-selected=\"true\">乐天进口</a>\n" +
            "            </li>\n" +
            "            <li class=\"nav-item nave-li-2\" >\n" +
            "                <a class=\"nav-link \" id=\"nave-tab-2\" data-toggle=\"tab\" href=\"#tab2\" role=\"tab\" aria-controls=\"profile\" aria-selected=\"false\">乐天正常</a>\n" +
            "            </li>\n" +
            "            <li class=\"nav-item nave-li-3\">\n" +
            "                <a class=\"nav-link \" id=\"nave-tab-3\" data-toggle=\"tab\" href=\"#tab3\" role=\"tab\" aria-controls=\"profile\" aria-selected=\"false\">新世界</a>\n" +
            "            </li>\n" +
            "            <li class=\"nav-item nave-li-4\">\n" +
            "                <a class=\"nav-link \" id=\"nave-tab-4\" data-toggle=\"tab\" href=\"#tab4\" role=\"tab\" aria-controls=\"profile\" aria-selected=\"false\">DOOTA</a>\n" +
            "            </li>\n" +
            "            <li class=\"nav-item nave-li-5\" teshu=\"true\">\n" +
            "                <a class=\"nav-link \" id=\"nave-tab-5\" data-toggle=\"tab\" href=\"#tab5\" role=\"tab\" aria-controls=\"profile\" aria-selected=\"false\">特殊返点</a>\n" +
            "            </li>";
        $('#myTab').append(naviLi);
        $('#tab1').addClass('active');
        $('#tab1').addClass('show');

        $('#myTab li').click(function () {
            if ($(this).attr('teshu')){
                $('.pinpa-input-div').css('display','inline');
                $('.zhuijiafandian-input-div').css('display','inline');
            }else{
                $('.pinpa-input-div').css('display','none');
                $('.zhuijiafandian-input-div').css('display','none');
            }
        }) ;

        for (var i = 1; i <= 5; i++) {
            $('#tab'+i+' .list-data').empty();
            $('#tab'+i+' .jine-total').html('');
            $('#tab'+i+' .fandian-total').html('');
        }

        for (var j = 0; j < totalData.length; j++) {

            var item=totalData[j];

            var naveli;
            var tableHtml;
            var totalIndex=-1;
            var jineTotalHtml;
            var fandianTotalHtml

            if (item.brandName=='乐天进口'){
                tableHtml=$('#tab1 .list-data');
                naveli=$('.nave-li-1');
                jineTotalHtml=$('#tab1 .jine-total');
                fandianTotalHtml=$('#tab1 .fandian-total');
                totalIndex=0;
            }else if (item.brandName=='乐天正常'){
                tableHtml=$('#tab2 .list-data');
                naveli=$('.nave-li-2');
                jineTotalHtml=$('#tab2 .jine-total');
                fandianTotalHtml=$('#tab2 .fandian-total');
                totalIndex=0;
            }else if (item.brandName=='新世界'){
                tableHtml=$('#tab3 .list-data');
                naveli=$('.nave-li-3');
                jineTotalHtml=$('#tab3 .jine-total');
                fandianTotalHtml=$('#tab3 .fandian-total');
                totalIndex=0;
            }else if (item.brandName=='DOOTA'){
                tableHtml=$('#tab4 .list-data');
                naveli=$('.nave-li-4');
                jineTotalHtml=$('#tab4 .jine-total');
                fandianTotalHtml=$('#tab4 .fandian-total');
                totalIndex=0;
            }else if (item.brandName=='特殊返点'){
                tableHtml=$('#tab5 .list-data');
                naveli=$('.nave-li-5');
                jineTotalHtml=$('#tab5 .jine-total');
                fandianTotalHtml=$('#tab5 .fandian-total');
                totalIndex=0;
            }

            var redItemArray=new Array();//红色标记数组
            for (var k = 0; k < item.items.length; k++) {
                var itm=item.items[k];

                for(var m=k+1;m<item.items.length;m++) {

                    if (JSON.stringify(itm) == JSON.stringify(item.items[m])){
                        redItemArray.push(itm);
                        break;
                    }
                }
            }

            //数据绘制
            for (var k = 0; k < item.items.length; k++) {
                var itemData=item.items[k];

                var bgColor=i%2==0?'#ffffff':'lightgray';
                var textColor='#000000';
                for (var m=0;m<redItemArray.length;m++){
                    if (JSON.stringify(redItemArray[m])==JSON.stringify(itemData)){
                        textColor='#ff0000';
                        break;
                    }
                }

                if (naveli.attr('teshu')){
                    itemHtml="<div class=\"row\" style=\"text-align: center\">\n" +
                        "                        <div class=\"col-1\" style=\"border: 1px solid #4c4c4c;color:"+textColor+"background-color:"+bgColor+"\">"+(tableHtml.children().length+1)+"</div>\n" +
                        "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.pinpai+"</div>\n" +
                        "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.jine+"</div>\n" +
                        "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;width: 30%;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.dianshu+"%</div>\n" +
                        "                        <div class=\"col-2\" style=\"border: 1px solid #4c4c4c;width: 30%;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.fandian+"</div>\n" +
                        "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"removeItem2("+i+","+totalIndex+")\">删除</button>"+
                        "                    </div>";
                } else{
                    itemHtml="<div class=\"row\" style=\"text-align: center\">\n" +
                        "                        <div class=\"col-1\" style=\"border: 1px solid #4c4c4c;color: "+textColor+"; background-color:"+bgColor+"\">"+(tableHtml.children().length+1)+"</div>\n" +
                        "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;color: "+textColor+";background-color:"+bgColor+"\">"+itemData.jine+"</div>\n" +
                        "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;width: 30%;color:"+textColor+";background-color:"+bgColor+"\">"+itemData.dianshu+"%</div>\n" +
                        "                        <div class=\"col-3\" style=\"border: 1px solid #4c4c4c;width: 30%;color:"+textColor+";background-color:"+bgColor+"\">"+itemData.fandian+"</div>\n" +
                        "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"removeItem2("+i+","+totalIndex+")\">删除</button>"+
                        "                    </div>";
                }

                tableHtml.append(itemHtml);
            }

            var jineTotal=0,fandianTotal=0;
            for (var k=0;k<item.items.length;k++){
                jineTotal=Number(jineTotal)+Number(item.items[k].jine);
                fandianTotal=Number(fandianTotal)+Number(item.items[k].fandian);
            }

            jineTotalHtml.html(jineTotal);
            fandianTotalHtml.html(Math.floor(fandianTotal*100)/100);

        }
    }

    //TODO 保存数据至Cookie
    function saveCookieData() {

        var userName=$("#user-name-input").val();

        var isNews=true;

        for (var i=0;i<cookieSaveData.length;i++){

            if (cookieSaveData[i].userName==userName){
                cookieSaveData[i].data=totalData;
                isNews=false;
                break;
            }

        }

        if (isNews){

            var itemData={
                userName:userName,
                data:totalData
            }

            cookieSaveData.push(itemData);
        }



    }

    function upload(input) {
        //支持chrome IE10
        if (window.FileReader) {
            var file = input.files[0];
            filename = file.name.split(".")[0];
            var reader = new FileReader();
            reader.onload = function() {
                console.log(this.result)
                alert(this.result);
            }
            reader.readAsText(file);
        }
        //支持IE 7 8 9 10
        else if (typeof window.ActiveXObject != 'undefined'){
            var xmlDoc;
            xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = false;
            xmlDoc.load(input.value);
            alert(xmlDoc.xml);
        }
        //支持FF
        else if (document.implementation && document.implementation.createDocument) {
            var xmlDoc;
            xmlDoc = document.implementation.createDocument("", "", null);
            xmlDoc.async = false;
            xmlDoc.load(input.value);
            alert(xmlDoc.xml);
        } else {
            alert('error');
        }
    }
</script>


</html>