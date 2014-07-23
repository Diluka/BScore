<?php

namespace Home\Controller;

class MainOptionController extends BaseController {

    public function insert($id, $MainOption_name, $Update_date, $Disable_date, $sn) {
        $module = M('Module');
        if (isset($id)) { //修改并添加
            for ($i = 0; $i < count($id); $i++) { //修改部分
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if (isset($Disable_date)) {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $sn[$i];

                $list = $module->add($data);
            }
            for ($i = count($id); $i < count($MainOption_name); $i++) { //添加部分
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if (isset($Disable_date)) {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $module->max("sn") + 1;

                $list = $module->add($data);
            }
        } else { //添加
            for ($i = 0; $i < count($MainOption_name); $i++) {
                $data["MainOption_name"] = $MainOption_name[$i];
                $data["Update_date"] = $Update_date[$i];
                if (isset($Disable_date)) {
                    $data["Disable_date"] = $Disable_date[$i];
                }
                $data["sn"] = $module->max("sn") + 1;

                $list = $module->add($data);
            }
        }

        if ($list !== false) { //保存成功
            $this->success('新增成功!', cookie('_currentUrl_'));
        } else {
            //失败提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

}
