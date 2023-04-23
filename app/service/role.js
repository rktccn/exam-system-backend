'use strict'

const service = require('egg').Service

class Role extends service {

  // 编号登录
  async loginByNo(no, password) {
    const { ctx } = this
    const user = await ctx.model.Role.findOne({
      where: {
        no,
        password
      }
    })

    if (!user) {
      return null
    } else {
      return user.toJSON()
    }
  }

  // 邮箱登录
  async loginByEmail(email, password) {
    const { ctx } = this
    const user = await ctx.model.Role.findOne({
      where: {
        email,
        password
      }
    })

    if (!user) {
      return null
    } else {
      return user.toJSON()
    }
  }

  // 注册
  async register(no, password, email, name, age) {
    const { ctx } = this
    const user = await ctx.model.Role.create({
      no,
      password,
      email,
      name,
      age,
      permission: 0
    })

    if (!user) {
      return { code: 404, message: '注册失败' }
    } else {
      return { code: 200, message: '注册成功' }
    }
  }


// 获取当前用户的角色
  async getRoleByUserId(userId) {
    const { ctx } = this
    const role = await ctx.model.Role.findOne({
      where: {
        id: userId
      }
    })

    if (!role) {
      ctx.throw(404, 'role not found')
    } else {
      ctx.logger.info('role found')
    }

    return role
  }

// 搜索用户
  async searchUser(id = null, no = null, name = null, email = null) {
    const { ctx } = this
    const Op = this.app.Sequelize.Op
    const user = await ctx.model.Role.findAll({
      where: {
        [Op.or]: [
          { no }, { id }, { name }, { email }
        ]
      }
    })

    if (!user) {
      return { code: 404, message: 'user not found' }
    } else {
      return { code: 200, data: user }
    }

  }

// 获取所有用户
  async getAllUser(limit = 10, offset = 0, permission = 2) {
    const { ctx } = this
    const Op = this.app.Sequelize.Op

    return await ctx.model.Role.findAndCountAll({
      limit,
      offset,
      where: {
        permission: {
          [Op.gte]: permission
        }
      }
    })
  }


}

module.exports = Role
