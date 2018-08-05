<?php

namespace app\admin\model;

use think\Model;

class AdminUser extends Model
{
    public function getUserLogin($data)
    {
        $validate = Validate($this->name);

        if (!$validate->scene('login')->check($data)) {
            $this->error = $validate->getError();
            return false;
        }
        $res = $this->where($data)->find();
        if ($res) {
            if ($res['status']) {
                return $res;
            } else {
                $this->error = '该账户已被禁用';
                return false;
            }
        } else {
            $this->error = '账号或密码错误';
            return false;
        }
    }

    public function getUsers($data = [])
    {
        $res = $this->alias('u')
                    ->join('department d', 'u.d_id = d.id', 'LEFT')
                    ->join('position p', 'u.p_id = p.id', 'LEFT')
                    ->join('rule r', 'u.rule_id = r.id', 'LEFT')
                    ->field('u.*,p.name as p_name, d.name as d_name, r.rs')
                    ->order('id asc')
                    ->where($data)->select();
        if ($res) {
            $res = $res->toArray();
        }
        return $res;
    }

    public function getUserById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询用户不存在';
            return false;
        }
    }

    public function saveUser($param = [])
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

    public function updateUser($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->scene('update')->check($param)) {
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
