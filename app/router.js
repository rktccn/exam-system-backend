'use strict'

/**
 * @param {Egg.Application} app - egg application
 */

module.exports = app => {
  const { router, controller } = app
  router.get('/', controller.home.index)

  // role
  router.get('/account/:userId', controller.role.getRoleByUserId)
  router.get('/permission/:userId', controller.role.getPermissionByUserId)
  router.get('/search', controller.role.searchUser)
  router.get('/role/all', controller.role.getAllUser)
  // 登录
  router.post('/login', controller.role.login)
  // 注册
  router.post('/register', controller.role.register)
  // 获取用户数量
  router.get('/user/count', controller.role.getUserCount)
  // 更新用户信息
  router.post('/user/update', controller.role.updateUserInfo)


  // 添加题目
  router.post('/question/add', controller.question.addQuestion)
  // 获取题目列表
  router.get('/question/list', controller.question.getQuestionList)
  // 修改题目
  router.post('/question/update', controller.question.updateQuestion)
}
