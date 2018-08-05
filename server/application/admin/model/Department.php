<?php

namespace app\admin\model;

use think\Model;

class Department extends Model
{
    public function getDepartments($data = [])
    {
        $res = $this->where($data)->select();
        if ($res) {
            $res = $res->toArray();
        }
        return $res;
    }

    public function getDepartmentById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询部门不存在';
            return false;
        }
    }

    public function saveDepartment($param = [])
    {
        $validate = validate($this->name);
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

    public function updateDepartment($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, [$this->getPk() => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }
}
