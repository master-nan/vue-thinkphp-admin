<?php

namespace app\admin\model;

use think\Model;

class AccessLogs extends Model
{
    public function saveLogs($param = [])
    {
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }
}
