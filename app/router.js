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

}
