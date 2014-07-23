<?php

namespace Home\Controller;

class ChildOptionController extends BaseController {

    public function getByMainId($id) {
        $main = M("MainOption")->where(array("id" => $id)) - find();
        if ($main) {
            $childs = M("ChildOption")->where(array("MainOption_sn" => $main["sn"]))->select();
        }

        $data["success"] = isset($childs);
        $data["list"] = $childs;

        $this->ajaxReturn($data, "json");
    }

    public function insert($MainOption_sn, $id = NULL, $ChildOption_name = NULL, $Score_number = NULL, $Update_date = NULL, $Disable_date = NULL, $sn = NULL) {
        $childOption = M('ChildOption');
        if ($id) { //修改并添加
            for ($i = 0; $i < count($id); $i++) { //修改部分
                $data = array();
                $data["MainOption_sn"] = $MainOption_sn;
                $data["ChildOption_name"] = $ChildOption_name[$i];
                $data["Score_number"] = $Score_number[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $sn[$i];

                $result &= $childOption->add($data);
            }
            for ($i = count($id); $i < count($ChildOption_name); $i++) { //添加部分
                $data = array();
                $data["MainOption_sn"] = $MainOption_sn;
                $data["ChildOption_name"] = $ChildOption_name[$i];
                $data["Score_number"] = $Score_number[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $childOption->max("sn") + 1;

                $result &= $childOption->add($data);
            }
        } else { //添加
            for ($i = 0; $i < count($ChildOption_name); $i++) {
                $data = array();
                $data["MainOption_sn"] = $MainOption_sn;
                $data["ChildOption_name"] = $ChildOption_name[$i];
                $data["Score_number"] = $Score_number[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $childOption->max("sn") + 1;

                $result &= $childOption->add($data);
            }
        }

        if ($result !== FALSE) { //保存成功
            $this->success('保存成功!', cookie('_currentUrl_'));
        } else {
            //失败提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

}
