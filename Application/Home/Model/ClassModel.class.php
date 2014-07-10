<?php

namespace Home\Model;

use Think\Model\RelationModel;

class ClassModel extends RelationModel {

    protected $_link = array(
        'College' => array(
            'mapping_type' => self::BELONGS_TO,
            'foreign_key' => 'College_id',
            'mapping_name' => 'college',
            'as_fields' => 'College_name'
        ),
        'Specialty' => array(
            'mapping_type' => self::BELONGS_TO,
            'foreign_key' => 'Specialty_id',
            'mapping_name' => 'specialty',
            'as_fields' => 'Specialty_name'
        ),
        'Grade' => array(
            'mapping_type' => self::BELONGS_TO,
            'foreign_key' => 'Grade_id',
            'mapping_name' => 'grade',
            'as_fields' => 'Grade_name'
        )
    );

}

?>