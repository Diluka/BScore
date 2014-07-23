<?php

namespace Home\Controller;

class MainOptionController extends BaseController {

    public function insert($Course_id, $id = NULL, $MainOption_name = NULL, $Score_number = NULL, $Update_date = NULL, $Disable_date = NULL, $sn = NULL) {
        $mainOption = M('MainOption');
        $result = 0;
        if ($id) { //修改并添加
            for ($i = 0; $i < count($id); $i++) { //修改部分
                $data = array();
                $data["Course_id"] = $Course_id;
                $data["Score_number"] = $Score_number[$i];
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $sn[$i];

                $result += $mainOption->add($data);
            }
            for ($i = count($id); $i < count($MainOption_name); $i++) { //添加部分
                $data = array();
                $data["Course_id"] = $Course_id;
                $data["Score_number"] = $Score_number[$i];
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $mainOption->max("sn") + 1;

                $result += $mainOption->add($data);
            }
        } else { //添加
            for ($i = 0; $i < count($MainOption_name); $i++) {
                $data = array();
                $data["Course_id"] = $Course_id;
                $data["Score_number"] = $Score_number[$i];
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if ($Disable_date[$i] != "") {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $mainOption->max("sn") + 1;

                $result += $mainOption->add($data);
            }
        }

        if ($result) { //保存成功
            $this->success('保存成功!', cookie('_currentUrl_'));
        } else {
            //失败提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

}
