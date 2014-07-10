<?php

namespace Home\Model;

use Think\Model\RelationModel;

class JxareaModel extends RelationModel {

    protected $tableName = 'Jxarea';
    protected $_link = array(
        'Jxkefu' => array(
            'mapping_type' => self:: BELONGS_TO,
            'class_name' => 'Jxkefu',
            'foreign_key' => 'jx_area_004',
            'as_fields' => 'jx_kefu_002,jx_kefu_003,jx_kefu_004'
        )
    );

}

?>