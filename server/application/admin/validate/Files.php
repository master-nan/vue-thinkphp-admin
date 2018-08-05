<?php
namespace app\admin\validate;

use think\Validate;

class Files extends Validate
{
    protected $rule = [
      'name' => 'require',
      'path' => 'require',
      'ext'  => 'require',
      'u_id' => 'require',
      'hash' => 'require',
  ];

    protected $message  =   [
      'name.require' => '文件名不能为空',
      'path.require' => '文件路径不能为空',
      'ext.require' => '文件后缀不能为空',
      'u_id.require' => '上传用户不能为空',
      'hash.require' => '文件hash值不能为空',
  ];

    protected $scene = [

  ];
}
