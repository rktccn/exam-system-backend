'use strict'


module.exports = (app) => {
  const { INTEGER, DATE, STRING } = app.Sequelize

  const Question = app.model.define('question', {
    questionId: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    // teacherId: {
    //   type: INTEGER,
    //   allowNull: false,
    //   comment: '教师编号',
    //   references: {
    //     model: app.model.Role,
    //     key: 'id'
    //   }
    // },
    // 试题类型
    type: {
      type: INTEGER,
      allowNull: false,
      comment: '试题类型, 0: 单选题, 1: 多选题, 2: 判断题, 3: 填空题, 4: 简答题'
    },
    // 试题内容
    content: {
      type: STRING(1000),
      allowNull: false,
      comment: '试题内容'
    },
    // 分值
    score: {
      type: INTEGER,
      allowNull: false,
      comment: '分值'
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
    comment: '试题表'
  }, {
    collate: 'utf8mb4_general_ci'
  })

  return Question
}
