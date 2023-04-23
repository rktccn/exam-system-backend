const { Controller } = require('egg')

class RoleController extends Controller {

  // 获取当前用户的角色
  async getRoleByUserId() {
    const { ctx } = this
    const { userId } = ctx.params
    ctx.body = await ctx.service.role.getRoleByUserId(userId)
  }

  // 获取当前用户权限
  async getPermissionByUserId() {
    const { ctx } = this
    const { userId } = ctx.params
    const { permission } = await ctx.service.role.getRoleByUserId(userId)
    ctx.body = permission
  }

  // 是否为学生
  async isStudent() {
    const { ctx } = this
    const { userId } = ctx.params
    const { permission } = await ctx.service.role.getRoleByUserId(userId)
    ctx.body = permission === 2
  }

  // 是否为老师
  async isTeacher() {
    const { ctx } = this
    const { userId } = ctx.params
    const { permission } = await ctx.service.role.getRoleByUserId(userId)
    ctx.body = permission === 1
  }

  // 是否为管理员
  async isAdmin() {
    const { ctx } = this
    const { userId } = ctx.params
    const { permission } = await ctx.service.role.getRoleByUserId(userId)
    ctx.body = permission === 0
  }

  // 搜索用户
  async searchUser() {
    const { ctx } = this

    let { id, no, name, email } = ctx.query
    id = id ? parseInt(id) : id
    no = no ? parseInt(no) : no

    ctx.body = await ctx.service.role.searchUser(id, no, name, email)
  }

  // 获取所有用户
  async getAllUser() {
    const { ctx } = this
    const limit = parseInt(ctx.query.limit)
    const offset = parseInt(ctx.query.offset)
    const permission = parseInt(ctx.query.permission)

    ctx.body = await ctx.service.role.getAllUser(limit, offset, permission)
  }

  // 登录
  async login() {
    const { ctx } = this
    const { no, email, password } = ctx.request.body
    // 类型检查
    const regEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/

    const number = parseInt(no),
      e_email = email


    // 密码
    if (!password || password.length === 0) {
      ctx.body = { code: 400, message: '请输入密码' }
    }

    // 检查编号，编号存在则使用编号登录
    if (number && !isNaN(number)) {
      // 编号登录
      const res = await ctx.service.role.loginByNo(number, password)
      if (res === null) {
        ctx.body = { code: 404, message: '账号或密码错误' }
        return
      }
      const { id, no, email, name, age } = res
      ctx.body = { code: 200, data: { id, no, email, name, age } }
    }

    // 检查邮箱类型
    if (e_email && regEmail.test(e_email)) {
      const res = await ctx.service.role.loginByEmail(e_email, password)

      if (res === null) {
        ctx.body = { code: 404, message: '账号或密码错误' }
        return
      }
      const { id, no, email, name, age } = res
      ctx.body = { code: 200, data: { id, no, email, name, age } }
    }

  }

  // 注册用户
  async register() {
    const { ctx } = this
    const { no, password, email, name, age } = ctx.request.body
    const regEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/

    // 检查编号
    if (!no || isNaN(parseInt(no))) {
      ctx.body = { code: 400, message: '编号必须为数字' }
    }

    // 检查邮箱类型
    if (!regEmail.test(email)) {
      ctx.body = { code: 400, message: '邮箱格式不正确' }
    }

    // 检查密码
    if (!name || password.length === 0) {
      ctx.body = { code: 400, message: '请输入密码' }
    }

    // 检查姓名
    if (!name || name.length === 0) {
      ctx.body = { code: 400, message: '请输入姓名' }
    }

    // 注册
    ctx.body = await ctx.service.role.register(no, password, email, name, age)
  }

}

module.exports = RoleController
