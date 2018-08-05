<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;

class Comm extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, sessionId, X-Requested-Token");
        $this->request = Request::instance();
        $this->param = $this->request->param();
        $this->token = isset($this->request->header()['x-requested-token']) ? $this->request->header()['x-requested-token'] : null;
        $this->checkToken();
    }

    public function checkToken()
    {
        $this->user = json_decode(cache($this->token), true);
        if (!$this->user) {
            exit(json_encode(['code'=>101, 'error'=>'请重新登录']));
        }
        //每次访问自动续命
        cache($this->token, json_encode($this->user), 3600);
    }
    public function checkRule()
    {
        $module = $this->request->module();
        $controller = $this->request->controller();
        $action = $this->request->action();
        $rule = $module.'-'.$controller.'-'.$action;
        if (isset($this->user['id']) && $this->user['id']!=1) {
            if (!isset($this->user['rules']) || !in_array($rule, $this->user['rules'])) {
                return false;
            }
        }
        return true;
    }

    public function logout()
    {
        if ($this->token) {
            cache($this->token, null);
            $d['last_logout_at'] = time();
            $ret = model('AdminUser')->updateUser($this->user['id'], $d, false);
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, '操作失败');
        }
    }
}
