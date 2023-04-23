'use strict'

module.exports = (app) => {
  const { STRING, BIGINT, INTEGER, DATE } = app.Sequelize

  const Role = app.model.define('Role', {
    // 编号
    no: {
      type: BIGINT(10),
      allowNull: false,
      unique: true,
      comment: '编号'
    },
    name: {
      type: STRING(30),
      allowNull: false,
      comment: '用户名'
    },
    age: {
      type: BIGINT(10),
      allowNull: false,
      comment: '年龄'
    },
    email: {
      type: STRING(30),
      allowNull: false,
      unique: true,
      comment: '邮箱'
    },
    password: {
      type: STRING(30),
      allowNull: false,
      comment: '密码'
    },
    // 权限
    permission: {
      type: INTEGER,
      allowNull: false,
      comment: '权限, 0: 管理员, 1: 老师, 2: 学生'
    },
    createdAt: {
      field: 'created_at',
      type: DATE
    },
    updatedAt: {
      field: 'updated_at',
      type: DATE
    }
  }, {
    comment: '角色表'
  },{
    collate: 'utf8mb4_general_ci'
  })

  return Role
}

