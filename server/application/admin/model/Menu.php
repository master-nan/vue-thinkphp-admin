<?php

namespace app\admin\model;

use think\Model;

class Menu extends Model
{
    public function getMenus($data = [])
    {
        $res = $this->where($data)->order('sort', 'asc')->select();
        if ($res) {
            $res = $res->toArray();
        }
        return $res;
    }

    public function getMenuById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询菜单不存在';
            return false;
        }
    }

    public function getMenuByIds($ids = [])
    {
        $data = [
          'id' => array('in',$ids),
          'status' => 1
        ];
        $res = $this->where($data)->order('sort', 'asc')->select();
        if ($res) {
            if ($res) {
                $res = $res->toArray();
            }
            return $res;
        } else {
            $res = [];
        }
    }

    public function saveMenu($param = [])
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

    public function updateMenu($id = null, $param = [], $flag = true)
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
