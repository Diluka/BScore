<?php

namespace Home\Controller;

use Think\Page;
use Think\Controller;

class BaseController extends Controller {

    public function index($map, $dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        if (Class_exists("Home\Model\\" . $dwz_db_name . "Model")) {
            $model = D($dwz_db_name);
        }
        $this->_search($dwz_db_name, $map);
        $this->assign("map", $map);

        if (!empty($model)) {
            $this->_list($model, $map, $dwz_db_name);
        }
        $this->display();
    }

    function add() {
        $this->display();
    }

    function insert($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        if (false === $model->create()) {
            $this->error($model->getError());
        }
        //保存当前数据对象
        $list = $model->add();
        if ($list !== false) { //保存成功
            $this->success('新增成功!', cookie('_currentUrl_'));
        } else {
            //失败提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

    protected function _search($dwz_db_name = '', &$map) {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        //生成查询条件
        $model = M($dwz_db_name);
        foreach ($model->getDbFields() as $key => $val) {
            if (isset($_REQUEST [$val]) && $_REQUEST [$val] != '') {
                if (empty($map [$val])) {
                    $map [$val] = $_REQUEST [$val];
                }
            }
        }
    }

    protected function _list($model, $map, $dwz_db_name, $sortBy = '', $asc = false) {

        //排序字段 默认为主键名
        $order = 'id desc';
        //取得满足条件的记录数
        $count = $model->where($map)->count('id');
        if ($count > 0) {
            //创建分页对象  ,默认10条记录
            if (!empty($_REQUEST ['listRows'])) {
                $listRows = $_REQUEST ['listRows'];
            } else {
                $listRows = '10';
            }
            $p = new Page($count, $listRows);
            $pageNum = empty($_REQUEST['numPerPage']) ? C('PAGE_LISTROWS') : $_REQUEST['numPerPage'];
            //分页查询数据
            $voList = array();
            if (Class_exists("Home\Model\\" . $dwz_db_name . "Model")) {
                $voList = $model->where($map)->order($order)->limit($pageNum)->page($_REQUEST[C('VAR_PAGE')])->relation(true)->select();
            } else {
                $voList = $model->where($map)->order($order)->limit($pageNum)->page($_REQUEST[C('VAR_PAGE')])->select();
            }
            //分页跳转的时候保证查询条件
            foreach ($map as $key => $val) {
                if (!is_array($val)) {
                    $p->parameter .= "$key=" . urlencode($val) . "&";
                }
            }
            //分页显示
            $page = $p->show();
            //列表排序显示
            $sortImg = $sort; //排序图标
            $sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列'; //排序提示
            $sort = $sort == 'desc' ? 1 : 0; //排序方式
            //模板赋值显示
            $this->assign('list', $voList);
            $this->assign('sort', $sort);
            $this->assign('order', $order);
            $this->assign('sortImg', $sortImg);
            $this->assign('sortType', $sortAlt);
            $this->assign("page", $page);
        }
        //囚鸟先生
        $this->assign('totalCount', $count);
        $pageNum = empty($_REQUEST['numPerPage']) ? C('PAGE_LISTROWS') : $_REQUEST['numPerPage'];
        $this->assign('numPerPage', $pageNum); //每页显示多少条
        $this->assign('currentPage', !empty($_REQUEST[C('VAR_PAGE')]) ? $_REQUEST[C('VAR_PAGE')] : 1);
        cookie('_currentUrl_', __SELF__);

        return;
    }

    public function foreverdelete($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        //删除指定记录
        $model = M($dwz_db_name);
        if (!empty($model)) {
            $id = $_REQUEST ["id"];
            if (isset($id)) {
                $condition = array("id" => array('in', explode(',', $id)));
                $succ = $model->where($condition)->select();
                if ($succ[0]["id"] != '') {
                    if (false !== $model->where($condition)->delete()) {
                        $this->success('删除成功！');
                    } else {
                        $this->error('删除失败！');
                    }
                } else {
                    $this->success("该记录已不存在");
                }
            } else {
                $this->error('非法操作');
            }
        }
        $this->forward();
    }

    function edit($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $id = $_REQUEST ["id"];
        $obj = $model->getById($id);
        $this->assign('obj', $obj);
        $this->display();
    }

    function update($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        if (false === $model->create()) {
            $this->error($model->getError());
        }
        $data = array();
        foreach ($model->getDbFields() as $key => $val) {
            if ($val != 'id') {
                $data[$val] = $model->$val;
            }
        }
        // 更新数据
        $list = $model->where('id=' . $model->id)->setField($data);
        //dump($model->getLastSql());
        if (false !== $list) {
            //成功提示
            $this->success('编辑成功!', cookie('_currentUrl_'));
        } else {
            //错误提示
            $this->error('服务器繁忙请稍后重试!');
        }
    }

    public function forbid($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $id = $_REQUEST ["id"];
        $condition = array("id" => array('in', $id));
        $list = $model->where($condition)->setField("status", 0);
        if ($list == 1) {
            $this->success('状态禁用成功', cookie('_currentUrl_'));
        } else {
            $this->error('状态禁用失败！');
        }
    }

    public function resume($dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $model = M($dwz_db_name);
        $id = $_REQUEST ["id"];
        $condition = array("id" => array('in', $id));
        $list = $model->where($condition)->setField("status", 1);
        if ($list == 1) {
            $this->success('状态恢复成功', cookie('_currentUrl_'));
        } else {
            $this->error('状态恢复失败！');
        }
    }

    public function export($title, $map, $dwz_db_name = '') {
        $dwz_db_name = $dwz_db_name ? $dwz_db_name : $this->getActionName();
        $key = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
        $data = array();
        if (Class_exists("Home\Model\\" . $dwz_db_name . "Model")) {
            $data = D($dwz_db_name)->relation(true)->select();
        } else {
            $data = M($dwz_db_name)->select();
        }

        import("Org.Util.PHPExcel");
        import("Org.Util.PHPExcel.Writer.Excel5");
        import("Org.Util.PHPExcel.IOFactory.php");

        // 创建 PHPExcel 对象
        $objPHPExcel = new \PHPExcel();
        // 设置属性
        $objPHPExcel->getProperties()->setCreator('jock')->setTitle($title);


        //设置单元格宽度
        for ($i = 0; $i < count($map); $i++) {
            $objPHPExcel->getActiveSheet()->getColumnDimension($key[$i])->setWidth(20);
        }
        //设置行高度
        $objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);
        $objPHPExcel->getActiveSheet()->getRowDimension('2')->setRowHeight(22);

        //设置文字大小和加粗
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(14);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);

        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);

        $objPHPExcel->getActiveSheet()->getStyle('A2:' . $key[count($map) - 1] . '2')->getFont()->setSize(10);
        $objPHPExcel->getActiveSheet()->getStyle('A2:' . $key[count($map) - 1] . '2')->getFont()->setBold(true);

        $objPHPExcel->getActiveSheet()->getStyle('A2:' . $key[count($map) - 1] . '2')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('A2:' . $key[count($map) - 1] . '2')->getBorders()->getAllBorders()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

        //设置水平居中
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('A2:' . $key[count($map) - 1] . '2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        //合并单元格
        $objPHPExcel->getActiveSheet()->mergeCells('A1:' . $key[count($map) - 1] . '1');

        // 添加数据
        $obj = $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $title);
        $index = 0;
        foreach ($map as $keys => $value) {
            $obj = $obj->setCellValue($key[$index] . '2', $value);
            $index++;
        }
        $i = 3;
        foreach ($data as $k => $v) {
            $objPHPExcel->getActiveSheet()->getStyle('A' . $i . ':' . $key[count($map) - 1] . $i)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
            $objPHPExcel->getActiveSheet()->getRowDimension($i)->setRowHeight(20);
            $obj = $objPHPExcel->setActiveSheetIndex(0);
            $index = 0;
            foreach ($map as $keys => $value) {
                $obj = $obj->setCellValue($key[$index] . $i, $v[$keys]);
                $index++;
            }
            $i++;
        }

        // 设置Sheet名称
        $objPHPExcel->getActiveSheet()->setTitle($title);
        // 设置打开文件后显示的表格
        $objPHPExcel->setActiveSheetIndex(0);

        // 设置浏览器下载请求头和文件名
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $title . '(' . date('Y-m-d') . ').xls"');
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
    }

}

?>