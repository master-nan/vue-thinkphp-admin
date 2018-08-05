<?php
namespace app\admin\validate;

use think\Validate;

class Department extends Validate
{
    protected $rule = [
        'name' => 'require',
    ];

    protected $message  =   [
        'name.require' => '部门名称不能为空'
    ];

    protected $scene = [

    ];
}
