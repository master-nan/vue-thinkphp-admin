<?php
namespace app\admin\validate;

use think\Validate;

class Rule extends Validate
{
    protected $rule = [
        'title' => 'require',
        'rs' => 'require'
    ];

    protected $message  =   [
        'title.require' => '权限名称不能为空',
        'rs.require' => '权限不能为空',
    ];

    protected $scene = [

    ];
}
