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
      permission: 2
    })

    if (!user) {
      return { code: 404, message: '注册失败' }
    } else {
      return { code: 200, message: '注册成功' }
    }
  }

  // 删除用户
  async deleteUser(userId) {
    const { ctx } = this
    const user = await ctx.model.Role.findOne({
      where: {
        userId
      }
    })

    if (!user) {
      return { code: 404, message: 'user not found' }
    } else {
      await ctx.model.Role.destroy({
        where: {
          userId
        }
      })
      return { code: 200, message: 'delete success' }
    }
  }

  // 获取当前用户的角色
  async getRoleByUserId(userId) {
    const { ctx } = this
    const role = await ctx.model.Role.findOne({
      where: {
        userId
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
  async searchUser(userId = null, no = null, name = null, email = null) {
    const { ctx } = this
    const Op = this.app.Sequelize.Op
    const user = await ctx.model.Role.findAll({
      where: {
        [Op.or]: [{ no }, { userId }, { name }, { email }]
      }
    })

    if (!user) {
      return { code: 404, message: 'user not found' }
    } else {
      return { code: 200, data: user }
    }
  }

  // 获取所有用户
  async getAllUser(limit, offset, permission) {
    const { ctx } = this
    const Op = this.app.Sequelize.Op

    if (!limit && (permission === 0 || permission === 1 || permission === 2)) {
      return await ctx.model.Role.findAndCountAll({
        where: {
          permission: permission
        }
      })
    } else if (!limit) {
      return await ctx.model.Role.findAndCountAll()
    }

    if (permission === 0 || permission === 1 || permission === 2) {
      return await ctx.model.Role.findAndCountAll({
        limit,
        offset,
        where: {
          permission: permission
        }
      })
    } else {
      return await ctx.model.Role.findAndCountAll({
        limit,
        offset
      })
    }
  }

  // 获取用户数量
  async getUserCount(permission) {
    const { ctx } = this

    if (permission === 0 || permission === 1 || permission === 2) {
      return await ctx.model.Role.count({
        where: {
          permission: permission
        }
      })
    } else {
      return await ctx.model.Role.count()
    }
  }

  // 更新用户信息
  async updateUser(userId, no, email, name, age, password, permission) {
    const { ctx } = this
    if (password === '') {
      await ctx.model.Role.update(
        {
          no,
          email,
          name,
          age,
          permission
        },
        {
          where: { userId }
        }
      )
    } else {
      await ctx.model.Role.update(
        {
          no,
          email,
          name,
          age,
          password,
          permission
        },
        {
          where: { userId }
        }
      )
    }
  }
}

module.exports = Role
