<?php

namespace app\admin\model;

use think\Model;

class Files extends Model
{
    public function getFileByHash($hash)
    {
        $ret = $this->where('hash', $hash)->find();
        if ($ret) {
            return $ret;
        } else {
            return false;
        }
    }

    public function saveFile($param)
    {
        $validate = Validate($this->name);
        if (!$validate->check($param)) {
            $this->error = $validate->getError();
            return false;
        }
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }
}
